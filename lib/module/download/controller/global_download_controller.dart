import 'dart:collection';

import 'package:free_tube_player/module/download/bean/download_info.dart';
import 'package:free_tube_player/utils/file_utils.dart';

class GlobalDownloadController {
  LinkedList<DownloadInfo> downloadList = LinkedList();

  void addToDownloadList(DownloadInfo downloadInfo) {
    DownloadInfo? download = _getDownloadInfoOrNull(downloadInfo);
    if (download != null) return;
    downloadList.add(downloadInfo);
  }

  void removeDownloadInfo(DownloadInfo downloadInfo) {
    DownloadInfo? download = _getDownloadInfoOrNull(downloadInfo);
    if (download == null) return;
    downloadList.remove(download);
  }

  DownloadInfo? _getDownloadInfoOrNull(DownloadInfo downloadInfo) {
    try {
      return downloadList.firstWhere((element) => element.identify == downloadInfo.identify);
    } catch (_) {}
    return null;
  }

  Future<void> _doDownload(DownloadInfo downloadInfo)async{
    final downloader = downloadInfo.downloader;
    final mediaInfo = downloadInfo.mediaInfo;
    final videoUrl = downloadInfo.videoUrl;
    final audioUrl = downloadInfo.audioUrl;

    // if (videoUrl != null){
    //   final videoSavePath = FileUtils.getDownloadFilePath(mediaInfo.youtubeId!);
    //   downloader.download(url: videoUrl, savePath: savePath);
    // }
    // downloadInfo.mediaInfo.videoSources
    // downloader.download(url: url, savePath: savePath);
  }
}
