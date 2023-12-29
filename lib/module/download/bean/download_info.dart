import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/extension/number_extension.dart';
import 'package:free_tube_player/module/download/downloader.dart';

base class DownloadInfo extends LinkedListEntry<DownloadInfo> {
  MediaInfo mediaInfo;
  CancelToken cancelToken = CancelToken();
  Downloader downloader = Downloader();
  BaseMediaSource? videoSource;
  int thisSecondLength = 0;
  int lastSecondLength = 0;

  DownloadInfo(this.mediaInfo, {this.videoSource});

  bool get isDownloading => videoSource?.isDownloading ?? false;

  bool get isWaiting => videoSource?.isWaiting ?? false;

  bool get isInQueue => videoSource?.isInQueue ?? false;

  bool get isPause => videoSource?.isPause ?? false;

  bool get isFailed => videoSource?.isFailed ?? false;

  bool get isSuccess => videoSource?.isSuccess ?? false;

  String get identify => mediaInfo.identify;

  String downloadProgressString() {
    final downloadLength = videoSource?.downloadLength ?? 0;
    final totalLength = videoSource?.realTotalLength ?? 0;
    return '${downloadLength.parseUnit()} / ${totalLength.parseUnit()}';
  }
}
