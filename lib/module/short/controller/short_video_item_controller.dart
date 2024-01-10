import 'dart:async';

import 'package:free_tube_player/api/short_video_api.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/player/controller/player_controller.dart';
import 'package:free_tube_player/utils/log_utils.dart';
import 'package:free_tube_player/utils/toast_utils.dart';
import 'package:free_tube_player/utils/video_data_helper.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ShortVideoItemController {
  final _shortVideoApi = ShortVideoApi();
  final duration = Duration.zero.obs;
  final position = Duration.zero.obs;
  final playStatus = PlayStatus.none.obs;
  final viewStatus = ViewStatus.none.obs;
  MediaInfo mediaInfo;

  VideoPlayerController? videoPlayerController;

  ShortVideoItemController(this.mediaInfo);

  Future<bool> preload() async {
    Completer<bool> completer = Completer();
    playStatus.value = PlayStatus.loading;
    var url = mediaInfo.videoSources?.first.url ?? '';
    if (url.isEmpty) {
      viewStatus.value = ViewStatus.loading;
      final mediaInfoWithUrl = await _requestPlayUrl(mediaInfo);
      if (mediaInfoWithUrl == null) {
        ToastUtils.show(S.current.getPlaySourceFailed, isCorrect: false);
        LogUtils.e('短视频获取链接失败 ${mediaInfoWithUrl?.title}');
        viewStatus.value = ViewStatus.failed;
        return false;
      }
      mediaInfo = mediaInfoWithUrl;
    }
    viewStatus.value = ViewStatus.success;
    url = mediaInfo.videoSources!.first.url;
    LogUtils.i('开始播放 ${mediaInfo.title} $url');
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url));
    videoPlayerController?.initialize().then((value) {
      videoPlayerController?.addListener(_videoListener);
      playStatus.value = PlayStatus.initialized;
      completer.complete(true);
    }).catchError((e) {
      ToastUtils.show(S.current.getPlaySourceFailed, isCorrect: false);
      LogUtils.e('短视频初始化失败  ${mediaInfo.title} - url ${url}');
      playStatus.value = PlayStatus.none;
      completer.complete(false);
    });
    return completer.future;
  }

  Future<void> loadAndPlay() async {
    if (isInitialized) {
      play();
    } else {
      final result = await preload();
      if (result == false) return;
      play();
    }
  }

  Future<MediaInfo?> _requestPlayUrl(MediaInfo mediaInfo) async {
    if (mediaInfo.duration == 0) mediaInfo.duration = 1;
    var media = await _shortVideoApi.requestShortVideoItem(
        videoParams: mediaInfo.params, playParams: mediaInfo.playParams, videoId: mediaInfo.youtubeId);
    if (media == null) return null;
    if (media.videoSources == null) {
      final mediaWithPlayUrl = await VideoDataHelper.get.requestVideoSource(media);
      if (mediaWithPlayUrl == null || mediaWithPlayUrl.videoSources == null) return null;
    }
    media.params = mediaInfo.params;
    media.playParams = mediaInfo.playParams;
    return media;
  }

  Future<void> dispose() async {
    videoPlayerController?.removeListener(_videoListener);
    playStatus.value = PlayStatus.none;
    viewStatus.value = ViewStatus.none;
    await videoPlayerController?.pause();
    await videoPlayerController?.dispose();
    duration.value = Duration.zero;
    position.value = Duration.zero;
  }

  void _videoListener() {
    final duration = videoPlayerController?.value.duration ?? Duration.zero;
    if (duration.inMilliseconds == 0) return;
    final position = videoPlayerController?.value.position ?? Duration.zero;
    final isPlaying = videoPlayerController?.value.isPlaying ?? false;
    this.duration.value = duration;
    this.position.value = position;
    playStatus.value = isPlaying ? PlayStatus.playing : PlayStatus.pause;
  }

  Future<void> togglePlay() async {
    if (isPlaying) {
      await pause();
    } else {
      await play();
    }
  }

  Future<void> play() async {
    await videoPlayerController?.play();
  }

  Future<void> pause() async {
    await videoPlayerController?.pause();
  }

  Future<void> seekTo(Duration duration) async {
    await videoPlayerController?.seekTo(duration);
  }

  bool get isPlaying => videoPlayerController?.value.isPlaying ?? false;

  bool get isInitialized => videoPlayerController?.value.isInitialized ?? false;
}
