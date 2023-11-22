import 'dart:collection';
import 'dart:io';

import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/db/dao/media_info_dao.dart';
import 'package:free_tube_player/extension/string_extension.dart';
import 'package:free_tube_player/module/download/bean/download_info.dart';
import 'package:free_tube_player/utils/file_utils.dart';
import 'package:free_tube_player/utils/log_utils.dart';
import 'package:get/get.dart';

class GlobalDownloadController extends GetxController {
  static const maxDownloadCount = 3;
  final _mediaDao = MediaInfoDao();
  LinkedList<DownloadInfo> downloadList = LinkedList();

  void downloadMedia({required MediaInfo mediaInfo, required BaseMediaSource mediaSource}) {
    final DownloadInfo downloadInfo = DownloadInfo(mediaInfo, videoSource: mediaSource);
    addToDownloadList(downloadInfo);
  }

  void addToDownloadList(DownloadInfo downloadInfo) {
    DownloadInfo? download = _getDownloadInfoOrNull(downloadInfo);
    if (download != null) {
      removeDownloadInfo(download);
    }
    downloadList.add(downloadInfo);
    final mediaInfo = downloadInfo.mediaInfo;
    final videoSource = downloadInfo.videoSource;
    videoSource?.downloadStatus = DownloadStatus.downloading;
    if (downloadList.length > maxDownloadCount) {
      videoSource?.downloadStatus = DownloadStatus.waiting;
      _mediaDao.insert(mediaInfo);
      _updateUI(mediaInfo.identify);
      return;
    }
    _mediaDao.insert(mediaInfo);
    _updateUI(mediaInfo.identify);
    _doDownload(downloadInfo);
  }

  void removeDownloadInfo(DownloadInfo downloadInfo) {
    DownloadInfo? download = _getDownloadInfoOrNull(downloadInfo);
    if (download == null) return;
    downloadList.remove(download);
  }

  Future<void> _doDownload(DownloadInfo downloadInfo) async {
    final downloader = downloadInfo.downloader;
    final mediaInfo = downloadInfo.mediaInfo;
    final videoSource = downloadInfo.videoSource;
    final videoUrl = downloadInfo.videoSource?.url;

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
            final downloadPath = videoSource?.downloadPath;
            _deleteFile(downloadPath);
          }
          LogUtils.e('视频下载失败 $errorCode');
        },
        onReceiveProgress: (count, total) {
          videoSource?.fileLength = total;
          videoSource?.downloadLength = count;
          LogUtils.printLog('当前视频文件下载进度 ${mediaInfo.title}  $count  $total');
          if (count >= total) {
            final audioUrl = videoSource?.childSource?.url;
            if (audioUrl != null) {
              _doDownloadAudio(downloadInfo, videoSource!.childSource! as AudioSource);
            } else {
              videoSource?.downloadStatus = DownloadStatus.success;
              videoSource?.downloadFinishDate = DateTime.now().millisecondsSinceEpoch;
              // removeDownloadFromList(downloadInfo);
            }
            LogUtils.i('视频下载完成 ${mediaInfo.title}');
          }
          _mediaDao.insert(mediaInfo);
          _updateUI(mediaInfo.identify);
          // _downloadStreamController.add(downloadInfo);
        });
  }

  Future<void> _doDownloadAudio(DownloadInfo downloadInfo, AudioSource audioSource) async {
    final downloader = downloadInfo.downloader;
    final mediaInfo = downloadInfo.mediaInfo;
    final audioUrl = audioSource.url;
    final fileName = mediaInfo.youtubeId ?? mediaInfo.title;
    final relativePath = '${fileName.toMd5()}.mp3';
    final audioSavePath = await FileUtils.getDownloadFilePath(relativePath);
    if (File(audioSavePath).existsSync()) {
      _mediaDao.insert(mediaInfo);
      _updateUI(mediaInfo.identify);
      return;
    }
    audioSource.downloadPath = relativePath;
    _mediaDao.insert(mediaInfo);

    downloader.download(
        url: audioUrl,
        savePath: audioSavePath,
        downloadFailed: ({errorCode}) {
          if (errorCode == 416) {
            final downloadPath = audioSource.downloadPath;
            _deleteFile(downloadPath);
          }
          LogUtils.e('音频下载失败 $errorCode');
        },
        onReceiveProgress: (count, total) {
          audioSource.fileLength = total;
          audioSource.downloadLength = count;
          LogUtils.printLog('当前音频文件下载进度 ${mediaInfo.title}  $count  $total');
          if (count >= total) {
            audioSource.downloadStatus = DownloadStatus.success;
            audioSource.downloadFinishDate = DateTime.now().millisecondsSinceEpoch;
            // removeDownloadFromList(downloadInfo);
            LogUtils.i('音频下载完成 ${mediaInfo.title}');
          }
          _mediaDao.insert(mediaInfo);
          _updateUI(mediaInfo.identify);
          // _downloadStreamController.add(downloadInfo);
        });
  }

  void pause(MediaInfo mediaInfo) {
    final downloadInfo = _queryDownloadInfoOrNull(mediaInfo);
    downloadInfo?.cancelToken.cancel();
    downloadInfo?.videoSource?.downloadStatus = DownloadStatus.pause;
    _mediaDao.insert(mediaInfo);
    _updateUI(mediaInfo.identify);
  }

  Future<void> remove(MediaInfo mediaInfo, {BaseMediaSource? mediaSource}) async {
    final downloadInfo = _queryDownloadInfoOrNull(mediaInfo);
    if (downloadInfo != null) {
      downloadInfo.cancelToken.cancel();
      removeDownloadInfo(downloadInfo);
    }
    mediaSource ??= downloadInfo?.videoSource;
    await _deleteFile(mediaSource?.downloadPath);
    mediaSource?.clearDownload();
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

  Future<void> _deleteFile(String? downloadPath) async {
    if (downloadPath == null) return;
    downloadPath = await FileUtils.getDownloadFilePath(downloadPath);
    final file = File(downloadPath);
    if (file.existsSync()) file.deleteSync();
  }
}
