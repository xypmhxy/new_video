import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/extension/number_extension.dart';
import 'package:free_tube_player/module/download/downloader.dart';

base class DownloadInfo extends LinkedListEntry<DownloadInfo> {
  MediaInfo mediaInfo;
  CancelToken cancelToken = CancelToken();
  Downloader downloader = Downloader();
  BaseMediaSource videoSource;
  int curSecondLength = 0;
  int preSecondLength = 0;

  DownloadInfo(this.mediaInfo, {required this.videoSource});

  bool get isDownloading => videoSource.isDownloading;

  bool get isWaiting => videoSource.isWaiting;

  bool get isInQueue => videoSource.isInQueue;

  bool get isPause => videoSource.isPause;

  bool get isFailed => videoSource.isFailed;

  bool get isSuccess => videoSource.isSuccess;

  String get identify => mediaInfo.identify;

  String downloadProgressString() {
    final downloadLength = videoSource.downloadLength ?? 0;
    final totalLength = videoSource.realTotalLength;
    return '${downloadLength.formatSpeedSize()} / ${totalLength.formatSpeedSize()}';
  }

  void pause() {
    cancelToken.cancel();
    cancelToken = CancelToken();
    curSecondLength = preSecondLength = 0;
  }

  String getDownloadSpeed() {
    if (curSecondLength == 0 || preSecondLength == 0) return '- -';
    final speedBytes = curSecondLength - preSecondLength;
    if (speedBytes <= 0) return '0KB';
    return speedBytes.formatSpeedSize();
  }
}
