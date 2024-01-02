import 'dart:async';
import 'dart:io';

import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/db/dao/media_info_dao.dart';
import 'package:free_tube_player/dialog/dialog_confirm.dart';
import 'package:free_tube_player/extension/string_extension.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/download/bean/download_info.dart';
import 'package:free_tube_player/utils/dialog_utils.dart';
import 'package:free_tube_player/utils/file_utils.dart';
import 'package:free_tube_player/utils/log_utils.dart';
import 'package:free_tube_player/utils/video_data_helper.dart';
import 'package:get/get.dart';

class GlobalDownloadController extends GetxController {
  static const maxDownloadCount = 3;
  final _mediaDao = MediaInfoDao();
  final downloadList = <DownloadInfo>[].obs;
  final changeNotify = 0.obs;
  Timer? downloadSpeedTimer;

  bool get isDownloadCountLimit => downloadingCount() >= maxDownloadCount;

  Future<void> downloadMedia(
      {required MediaInfo mediaInfo, required BaseMediaSource mediaSource, bool needDownload = true}) async {
    final DownloadInfo downloadInfo = DownloadInfo(mediaInfo, videoSource: mediaSource);
    await addToDownloadList(downloadInfo, needDownload: needDownload);
  }

  Future<void> addToDownloadList(DownloadInfo downloadInfo, {bool needDownload = true}) async {
    final mediaInfo = downloadInfo.mediaInfo;
    final videoSource = downloadInfo.videoSource;
    DownloadInfo? download = _getDownloadInfoOrNull(downloadInfo);
    if (download == null) {
      downloadList.add(downloadInfo);
    }
    if (needDownload) {
      videoSource?.downloadStatus = isDownloadCountLimit ? DownloadStatus.waiting : DownloadStatus.downloading;
      await _mediaDao.insert(mediaInfo);
    }
    _updateUI(mediaInfo.identify);
    if (downloadingCount() < maxDownloadCount + 1) {
      if (needDownload) _doDownload(downloadInfo);
    }
    changeNotify.refresh();
  }

  void _removeDownloadInfo(DownloadInfo downloadInfo) {
    DownloadInfo? download = _getDownloadInfoOrNull(downloadInfo);
    if (download == null) return;
    downloadList.remove(download);
    changeNotify.refresh();
    if (downloadList.isEmpty) _cancelDownloadTimer();
  }

  Future<void> _doDownload(DownloadInfo downloadInfo) async {
    final downloader = downloadInfo.downloader;
    final mediaInfo = downloadInfo.mediaInfo;

    _mediaDao.insert(mediaInfo);

    if (mediaInfo.isUrlAvailable() == false) {
      await VideoDataHelper.get.requestVideoSource(mediaInfo);
    }
    final videoSource =
        mediaInfo.videoSources?.firstWhereOrNull((element) => element.identify == downloadInfo.videoSource?.identify);
    if (videoSource != null) downloadInfo.videoSource = videoSource;
    final videoUrl = downloadInfo.videoSource?.url;
    if (videoUrl == null) return;
    final fileName = mediaInfo.youtubeId ?? mediaInfo.title;
    final label = videoSource?.label ?? '${videoSource?.bitrate}';
    final relativePath = '${fileName.toMd5()}-$label.mp4';
    final videoSavePath = await FileUtils.getDownloadFilePath(relativePath);
    videoSource?.downloadPath = relativePath;
    videoSource?.downloadStatus = DownloadStatus.downloading;
    _mediaDao.insert(mediaInfo);

    _startDownloadSpeedTimer();
    downloader.download(
        url: videoUrl,
        savePath: videoSavePath,
        cancelToken: downloadInfo.cancelToken,
        downloadFailed: ({errorCode, errorMsg}) {
          videoSource?.downloadStatus = DownloadStatus.failed;
          _mediaDao.insert(mediaInfo);
          _updateUI(mediaInfo.identify);
          if (errorCode == 416) {
            _deleteFile(videoSource);
          }
          LogUtils.e('视频下载失败 $errorCode');
        },
        onReceiveProgress: (count, total) async {
          videoSource?.fileLength = total;
          videoSource?.downloadLength = count;
          // LogUtils.printLog('当前视频文件下载进度 ${mediaInfo.title}  $count  $total');
          if (count >= total) {
            final needAudioDownload = videoSource?.isNeedAudioTrack() ?? false;
            if (needAudioDownload) {
              LogUtils.i('视频下载完成开始下载音频 ${mediaInfo.title}');
              final audioResult = await _doDownloadAudio(downloadInfo, videoSource!.audioSource!);
              if (audioResult) {
                videoSource.downloadStatus = DownloadStatus.success;
                videoSource.downloadFinishDate = DateTime.now().millisecondsSinceEpoch;
                _removeDownloadInfo(downloadInfo);
                LogUtils.i('视频下载完成 ${mediaInfo.title}');
                downloadNext();
              }
            } else {
              videoSource?.downloadStatus = DownloadStatus.success;
              videoSource?.downloadFinishDate = DateTime.now().millisecondsSinceEpoch;
              _removeDownloadInfo(downloadInfo);
              LogUtils.i('视频下载完成 ${mediaInfo.title}');
              downloadNext();
            }
          }
          _mediaDao.insert(mediaInfo);
          _updateUI(mediaInfo.identify);
          // _downloadStreamController.add(downloadInfo);
        });
  }

  Future<bool> _doDownloadAudio(DownloadInfo downloadInfo, AudioSource audioSource) async {
    Completer<bool> completer = Completer();
    final downloader = downloadInfo.downloader;
    final mediaInfo = downloadInfo.mediaInfo;
    final audioUrl = audioSource.url;
    final fileName = mediaInfo.youtubeId ?? mediaInfo.title;
    final relativePath = '${fileName.toMd5()}.mp3';
    final audioSavePath = await FileUtils.getDownloadFilePath(relativePath);
    if (File(audioSavePath).existsSync()) {
      _mediaDao.insert(mediaInfo);
      _updateUI(mediaInfo.identify);
      return false;
    }
    audioSource.downloadPath = relativePath;
    _mediaDao.insert(mediaInfo);

    downloader.download(
        url: audioUrl,
        savePath: audioSavePath,
        cancelToken: downloadInfo.cancelToken,
        downloadFailed: ({errorCode, errorMsg}) {
          if (errorCode == 416) {
            _deleteFile(audioSource);
          }
          LogUtils.e('音频下载失败 $errorCode');
          completer.complete(false);
        },
        onReceiveProgress: (count, total) {
          audioSource.fileLength = total;
          audioSource.downloadLength = count;
          LogUtils.printLog('当前音频文件下载进度 ${mediaInfo.title}  $count  $total');
          if (count >= total) {
            audioSource.downloadStatus = DownloadStatus.success;
            audioSource.downloadFinishDate = DateTime.now().millisecondsSinceEpoch;
            LogUtils.i('音频下载完成 ${mediaInfo.title}');
          }
          _mediaDao.insert(mediaInfo);
          _updateUI(mediaInfo.identify);
          if (count >= total) {
            completer.complete(true);
          }
          // _downloadStreamController.add(downloadInfo);
        });
    return completer.future;
  }

  Future<void> pause(MediaInfo mediaInfo) async {
    final downloadInfo = _queryDownloadInfoOrNull(mediaInfo);
    downloadInfo?.pause();
    downloadInfo?.videoSource?.downloadStatus = DownloadStatus.pause;
    _updateUI(mediaInfo.identify);
    if (hasDownloadingVideo() == false) _cancelDownloadTimer();
    changeNotify.refresh();
    await _mediaDao.insert(mediaInfo);
  }

  Future<void> continueDownload(MediaInfo mediaInfo) async {
    final downloadInfo = _queryDownloadInfoOrNull(mediaInfo);
    if (downloadInfo == null) return;
    await addToDownloadList(downloadInfo);
    changeNotify.refresh();
  }

  Future<void> pauseAll() async {
    for (final downloadInfo in downloadList) {
      pause(downloadInfo.mediaInfo);
    }
    changeNotify.refresh();
  }

  Future<void> continueALL() async {
    for (final downloadInfo in downloadList) {
      await addToDownloadList(downloadInfo);
    }
  }

  Future<void> remove(MediaInfo mediaInfo, {BaseMediaSource? mediaSource, bool isAllowRemoveList = true}) async {
    final downloadInfo = _queryDownloadInfoOrNull(mediaInfo);
    if (downloadInfo != null) {
      downloadInfo.pause();
      if (isAllowRemoveList) _removeDownloadInfo(downloadInfo);
    }
    mediaSource ??= downloadInfo?.videoSource;
    await _deleteFile(mediaSource);
    mediaSource?.clearDownload();
    mediaSource?.audioSource?.clearDownload();
    await _mediaDao.insert(mediaInfo);
    _updateUI(mediaInfo.identify);
  }

  Future<void> removeAll() async {
    for (final downloadInfo in downloadList) {
      await remove(downloadInfo.mediaInfo, isAllowRemoveList: false);
    }
    downloadList.clear();
  }

  Future<void> downloadNext() async {
    if (isDownloadCountLimit) return;
    final nextDownloadInfo = _queryNextDownloadInfo();
    if (nextDownloadInfo == null) return;
    _doDownload(nextDownloadInfo);
  }

  void _startDownloadSpeedTimer() {
    if (downloadSpeedTimer != null) return;
    downloadSpeedTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      for (final downloadInfo in downloadList) {
        if (downloadInfo.isDownloading == false) continue;
        downloadInfo.preSecondLength = downloadInfo.curSecondLength;
        downloadInfo.curSecondLength = downloadInfo.videoSource?.downloadLength ?? 0;
      }
    });
  }

  void _cancelDownloadTimer() {
    downloadSpeedTimer?.cancel();
    downloadSpeedTimer = null;
  }

  DownloadInfo? _queryNextDownloadInfo() {
    for (final download in downloadList) {
      if (download.isWaiting) return download;
    }
    return null;
  }

  DownloadInfo? _queryDownloadInfoOrNull(MediaInfo mediaInfo) {
    try {
      return downloadList.firstWhere((element) => element.identify == mediaInfo.identify);
    } catch (_) {}
    return null;
  }

  DownloadInfo? _getDownloadInfoOrNull(DownloadInfo downloadInfo) {
    try {
      return downloadList.firstWhere((element) => element.identify == downloadInfo.identify);
    } catch (_) {}
    return null;
  }

  void _updateUI(Object id) {
    update([id]);
  }

  Future<void> _deleteFile(BaseMediaSource? videoSource) async {
    String? downloadPath = videoSource?.downloadPath;
    if (downloadPath != null) {
      downloadPath = await FileUtils.getDownloadFilePath(downloadPath);
      final file = File(downloadPath);
      if (file.existsSync()) file.deleteSync();
    }

    String? audioPath = videoSource?.audioSource?.downloadPath;
    if (audioPath != null) {
      audioPath = await FileUtils.getDownloadFilePath(audioPath);
      final audioFile = File(audioPath);
      if (audioFile.existsSync()) audioFile.deleteSync();
    }
  }

  int downloadingCount() {
    int index = 0;
    for (final downloadInfo in downloadList) {
      if (downloadInfo.isDownloading) index++;
    }
    return index;
  }

  bool hasDownloadingVideo() {
    for (final downloadInfo in downloadList) {
      if (downloadInfo.isDownloading) return true;
    }
    return false;
  }

  Future<void> prepareDownloadingList() async {
    final mediaInfoList = await _mediaDao.queryAllDownloading();
    for (final mediaInfo in mediaInfoList) {
      final videoSources = mediaInfo.videoSources ?? [];
      for (final videoSource in videoSources) {
        if (videoSource.isSuccess || videoSource.isDownloadNone) continue;
        downloadMedia(mediaInfo: mediaInfo, mediaSource: videoSource, needDownload: false);
      }
    }
  }

  void clickDownload(MediaInfo mediaInfo, {BaseMediaSource? mediaSource}) {
    final downloadInfo = _queryDownloadInfoOrNull(mediaInfo);
    if (downloadInfo == null && mediaSource != null) {
      downloadMedia(mediaInfo: mediaInfo, mediaSource: mediaSource);
      return;
    }
    if (downloadInfo?.isDownloading == true || downloadInfo?.isWaiting == true) {
      pause(mediaInfo);
    } else if (downloadInfo?.isPause == true || downloadInfo?.isFailed == true) {
      continueDownload(mediaInfo);
    } else if (downloadInfo?.isSuccess == true) {
      DialogUtils.showCenterDialog(DialogConfirm(
        title: S.current.removeDownloadConfirmText,
        onConfirm: () {
          pause(mediaInfo);
          DialogUtils.dismiss();
        },
      ));
    }
  }
}
