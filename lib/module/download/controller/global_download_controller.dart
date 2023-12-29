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

  void downloadMedia({required MediaInfo mediaInfo, required BaseMediaSource mediaSource, bool needDownload = true}) {
    final DownloadInfo downloadInfo = DownloadInfo(mediaInfo, videoSource: mediaSource);
    addToDownloadList(downloadInfo, needDownload: needDownload);
  }

  void addToDownloadList(DownloadInfo downloadInfo, {bool needDownload = true}) {
    final mediaInfo = downloadInfo.mediaInfo;
    final videoSource = downloadInfo.videoSource;
    DownloadInfo? download = _getDownloadInfoOrNull(downloadInfo);
    if (download == null) {
      downloadList.add(downloadInfo);
    }
    videoSource?.downloadStatus = isDownloadCountLimit ? DownloadStatus.waiting : DownloadStatus.downloading;
    _mediaDao.insert(mediaInfo);
    _updateUI(mediaInfo.identify);
    if (isDownloadCountLimit == false) {
      if (needDownload) _doDownload(downloadInfo);
    }
  }

  void _removeDownloadInfo(DownloadInfo downloadInfo) {
    DownloadInfo? download = _getDownloadInfoOrNull(downloadInfo);
    if (download == null) return;
    downloadList.remove(download);
  }

  Future<void> _doDownload(DownloadInfo downloadInfo) async {
    final downloader = downloadInfo.downloader;
    final mediaInfo = downloadInfo.mediaInfo;

    final videoUrl = downloadInfo.videoSource?.url;
    if (mediaInfo.isUrlAvailable() == false) {
      await VideoDataHelper.get.requestVideoSource(mediaInfo);
    }
    final videoSource =
        mediaInfo.videoSources?.firstWhereOrNull((element) => element.label == downloadInfo.videoSource?.label);
    if (videoSource != null) downloadInfo.videoSource = videoSource;
    if (videoUrl == null) return;
    final fileName = mediaInfo.youtubeId ?? mediaInfo.title;
    final label = videoSource?.label ?? '${videoSource?.bitrate}';
    final relativePath = '${fileName.toMd5()}-$label.mp4';
    final videoSavePath = await FileUtils.getDownloadFilePath(relativePath);
    videoSource?.downloadPath = relativePath;
    videoSource?.downloadStatus = DownloadStatus.downloading;
    _mediaDao.insert(mediaInfo);

    downloader.download(
        url: videoUrl,
        savePath: videoSavePath,
        cancelToken: downloadInfo.cancelToken,
        downloadFailed: ({errorCode}) {
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
          LogUtils.printLog('当前视频文件下载进度 ${mediaInfo.title}  $count  $total');
          if (count >= total) {
            final needAudioDownload = (videoSource as VideoSource?)?.isNeedAudioTrack() ?? false;
            if (needAudioDownload) {
              LogUtils.i('视频下载完成开始下载音频 ${mediaInfo.title}');
              final audioResult = await _doDownloadAudio(downloadInfo, videoSource!.audioSource!);
              if (audioResult) {
                videoSource.downloadStatus = DownloadStatus.success;
                videoSource.downloadFinishDate = DateTime.now().millisecondsSinceEpoch;
                _removeDownloadInfo(downloadInfo);
                LogUtils.i('视频下载完成 ${mediaInfo.title}');
              }
            } else {
              videoSource?.downloadStatus = DownloadStatus.success;
              videoSource?.downloadFinishDate = DateTime.now().millisecondsSinceEpoch;
              _removeDownloadInfo(downloadInfo);
              LogUtils.i('视频下载完成 ${mediaInfo.title}');
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
        downloadFailed: ({errorCode}) {
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

  void pause(MediaInfo mediaInfo) {
    final downloadInfo = _queryDownloadInfoOrNull(mediaInfo);
    downloadInfo?.pause();
    downloadInfo?.videoSource?.downloadStatus = DownloadStatus.pause;
    _mediaDao.insert(mediaInfo);
    _updateUI(mediaInfo.identify);
  }

  void continueDownload(MediaInfo mediaInfo) {
    final downloadInfo = _queryDownloadInfoOrNull(mediaInfo);
    if (downloadInfo == null) return;
    addToDownloadList(downloadInfo);
  }

  Future<void> remove(MediaInfo mediaInfo, {BaseMediaSource? mediaSource}) async {
    final downloadInfo = _queryDownloadInfoOrNull(mediaInfo);
    if (downloadInfo != null) {
      downloadInfo.pause();
      _removeDownloadInfo(downloadInfo);
    }
    mediaSource ??= downloadInfo?.videoSource;
    await _deleteFile(mediaSource);
    mediaSource?.clearDownload();
    mediaSource?.audioSource?.clearDownload();
    _mediaDao.insert(mediaInfo);
    _updateUI(mediaInfo.identify);
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

  bool get isDownloadCountLimit => downloadList.length > maxDownloadCount;

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
