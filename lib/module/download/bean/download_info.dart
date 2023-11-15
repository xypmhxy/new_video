import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/module/download/downloader.dart';

base class DownloadInfo extends LinkedListEntry<DownloadInfo> {
  MediaInfo mediaInfo;
  CancelToken cancelToken = CancelToken();
  Downloader downloader = Downloader();
  BaseMediaSource? mediaSource;
  AudioSource? audioSource;
  int thisSecondLength = 0;
  int lastSecondLength = 0;

  DownloadInfo(this.mediaInfo, {this.mediaSource,this.audioSource});

  bool get isDownloading => mediaSource?.isDownloading ?? false;

  bool get isWaiting => mediaSource?.isWaiting ?? false;

  bool get isInQueue => mediaSource?.isInQueue ?? false;

  bool get isPause => mediaSource?.isPause ?? false;

  bool get isFailed => mediaSource?.isFailed ?? false;

  bool get isSuccess => mediaSource?.isSuccess ?? false;

  String get identify => mediaInfo.identify;
}
