import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/module/download/downloader.dart';

base class DownloadInfo extends LinkedListEntry<DownloadInfo> {
  MediaInfo mediaInfo;
  CancelToken cancelToken = CancelToken();
  Downloader downloader = Downloader();
  String? videoUrl;
  String? audioUrl;
  int thisSecondLength = 0;
  int lastSecondLength = 0;

  DownloadInfo(this.mediaInfo, {this.videoUrl, this.audioUrl});

  bool get isDownloading => mediaInfo.downloadStatus == DownloadStatus.downloading;

  bool get isEnqueued => mediaInfo.downloadStatus == DownloadStatus.waiting;

  bool get isPause => mediaInfo.downloadStatus == DownloadStatus.pause;

  bool get isFailed => mediaInfo.downloadStatus == DownloadStatus.failed;

  bool get isSuccess => mediaInfo.downloadStatus == DownloadStatus.success;

  String get identify => mediaInfo.identify;
}
