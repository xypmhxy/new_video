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

  void addToDownloadList(DownloadInfo downloadInfo) {
    DownloadInfo? download = _getDownloadInfoOrNull(downloadInfo);
    if (download != null) return;
    downloadList.add(downloadInfo);
    if (downloadList.length > maxDownloadCount) return;
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
    final videoUrl = downloadInfo.videoUrl;
    final audioUrl = downloadInfo.audioUrl;

    if (videoUrl != null) {
      final fileName = mediaInfo.youtubeId ?? mediaInfo.title;
      final relativePath = '${fileName.toMd5()}.mp4';
      final videoSavePath = await FileUtils.getDownloadFilePath(relativePath);
      mediaInfo.downloadPath = relativePath;
      _mediaDao.insert(mediaInfo);

      downloader.download(
          url: videoUrl,
          savePath: videoSavePath,
          cancelToken: downloadInfo.cancelToken,
          downloadFailed: ({errorCode}) {
            mediaInfo.downloadStatus = DownloadStatus.failed;
            _mediaDao.insert(mediaInfo);
            _updateUI(mediaInfo.identify);
            if (errorCode == 416) {
              final downloadPath = mediaInfo.downloadPath;
              _deleteFile(downloadPath);
            }
            LogUtils.e('视频下载失败 $errorCode');
          },
          onReceiveProgress: (count, total) {
            mediaInfo.downloadLength = count;
            print('当前视频文件下载进度 ${mediaInfo.title}  $count  $total');
            if (count >= total) {
              if (audioUrl != null) {
                _doDownloadAudio(downloadInfo);
              } else {
                mediaInfo.downloadStatus = DownloadStatus.success;
                downloadInfo.mediaInfo.downloadFinishDate = DateTime.now().millisecondsSinceEpoch;
                // removeDownloadFromList(downloadInfo);
              }
              LogUtils.i('视频下载完成 ${mediaInfo.title}');
            }
            _mediaDao.insert(mediaInfo);
            _updateUI(mediaInfo.identify);
            // _downloadStreamController.add(downloadInfo);
          });
    }
  }

  Future<void> _doDownloadAudio(DownloadInfo downloadInfo) async {
    final downloader = downloadInfo.downloader;
    final mediaInfo = downloadInfo.mediaInfo;
    final audioUrl = downloadInfo.audioUrl;
    if (audioUrl == null) return;
    final fileName = mediaInfo.youtubeId ?? mediaInfo.title;
    final relativePath = '${fileName.toMd5()}.mp3';
    final audioSavePath = await FileUtils.getDownloadFilePath(relativePath);
    mediaInfo.downloadAudioPath = relativePath;
    _mediaDao.insert(mediaInfo);

    downloader.download(
        url: audioUrl,
        savePath: audioSavePath,
        downloadFailed: ({errorCode}) {
          if (errorCode == 416) {
            final downloadPath = mediaInfo.downloadPath;
            _deleteFile(downloadPath);
          }
          LogUtils.e('音频下载失败 $errorCode');
        },
        onReceiveProgress: (count, total) {
          mediaInfo.downloadAudioLength = count;
          print('当前音频文件下载进度 ${mediaInfo.title}  $count  $total');
          if (count >= total) {
            mediaInfo.downloadStatus = DownloadStatus.success;
            downloadInfo.mediaInfo.downloadFinishDate = DateTime.now().millisecondsSinceEpoch;
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
