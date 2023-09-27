/*
* 作者 Ren
* 时间  2023/9/13 08:01
*/
import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/helper/media_info_helper.dart';
import 'package:free_tube_player/module/player/interface/chewie_player_impl.dart';
import 'package:free_tube_player/module/player/page/user_player_page.dart';
import 'package:free_tube_player/utils/log_utils.dart';
import 'package:free_tube_player/utils/page_navigation.dart';
import 'package:free_tube_player/utils/video_utils.dart';
import 'package:get/get.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import 'player_controller.dart';

Future<void> startUserPlayPage({required MediaInfo mediaInfo}) async {
  userPlayerController.playNewSource(mediaInfo);
  PageNavigation.startNewPage(const UserPlayerPage());
}

class UserPlayerController {
  final _youtubeExplode = YoutubeExplode();
  final _chewiePlayerImpl = ChewiePlayerImpl();

  final _nowPlayingMedia = Rxn<MediaInfo>();
  final playStatus = PlayStatus.none.obs;
  final duration = Duration.zero.obs;
  final position = Duration.zero.obs;
  final dragPosition = Rxn<Duration>();
  final buffered = Duration.zero.obs;

  final isShowControlPanel = false.obs;
  final playSpeed = 1.0.obs;
  final isFullScreen = false.obs;
  double? dragStartX;
  double? dragStartY;

  StreamSubscription? _playStatusSubs;
  StreamSubscription? _positionSubs;
  StreamSubscription? _durationSubs;
  StreamSubscription? _bufferSubs;

  Timer? _controlPanelTimer;
  final _mediaInfoHelper = MediaInfoHelper.get;

  Future<void> playNewSource(MediaInfo mediaInfo) async {
    _nowPlayingMedia.value = mediaInfo;
    await stop();
    await requestPlaySource(mediaInfo);
    if (mediaInfo.videoSources == null) return;
    const targetResolution = 720;
    final playVideoSource = VideoUtils.getTargetVideoUrl(targetResolution, mediaInfo);
    if (playVideoSource == null) return;
    String? audioUrl;
    if (mediaInfo.isNeedAudioTrack(targetResolution: targetResolution)) {
      audioUrl = mediaInfo.audioSources?.first.url;
    }
    await _chewiePlayerImpl.playNewSource(playVideoSource.url, audioUrl: audioUrl);
    setupStreams();
  }

  Future<void> play({bool isByUser = false}) async {
    await _chewiePlayerImpl.play(isByUser: isByUser);
  }

  Future<void> pause({bool isByUser = false}) async {
    await _chewiePlayerImpl.pause(isByUser: isByUser);
  }

  Future<void> previous({bool isByUser = false}) async {}

  Future<void> next({bool isByUser = false}) async {}

  Future<void> setPlaybackSpeed(double speed, {bool isByUser = false}) async {
    await _chewiePlayerImpl.setPlaybackSpeed(speed, isByUser: isByUser);
  }

  Future<void> seekTo(Duration position, {bool isByUser = false}) async {
    await _chewiePlayerImpl.seekTo(position);
  }

  Future<void> enterFullScreen({bool isByUser = false}) async {
    await _chewiePlayerImpl.enterFullScreen();
  }

  Future<void> exitFullScreen({bool isByUser = false}) async {
    await _chewiePlayerImpl.exitFullScreen();
  }

  Future<void> stop() async {
    await _chewiePlayerImpl.stop();
    _playStatusSubs?.cancel();
    _positionSubs?.cancel();
    _durationSubs?.cancel();
    _bufferSubs?.cancel();
    playStatus.value = PlayStatus.none;
  }

  Future<void> togglePanel() async {
    isShowControlPanel.value = !isShowControlPanel.value;
    checkControlPanelStatus();
  }

  void checkControlPanelStatus() {
    if (isShowControlPanel.value) {
      startDelayCloseControlPanel();
    } else {
      cancelDelayCloseControlPanel();
    }
  }

  void startDelayCloseControlPanel() {
    cancelDelayCloseControlPanel();
    _controlPanelTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      isShowControlPanel.value = false;
      cancelDelayCloseControlPanel();
    });
  }

  void cancelDelayCloseControlPanel() {
    _controlPanelTimer?.cancel();
    _controlPanelTimer = null;
  }

  Future<void> togglePlay() async {
    chewieController.togglePause();
    saveHistoryPosition();
  }

  Future<void> saveHistoryPosition() async {
    if (_nowPlayingMedia.value == null || positionMill < 0) return;
    await _mediaInfoHelper.savePlayPosition(_nowPlayingMedia.value!, positionMill);
  }

  Future<void> onHorizontalDragStart(double dx) async {
    // dragStartX = dx;
    // isShowControlPanel.value = true;
    // checkControlPanelStatus();
  }

  Future<void> onHorizontalDragUpdate(double dx) async {
    final isForward = dx >= 0;
    dragPosition.value ??= position.value;
    if (dragPosition.value == null) return;
    int inMilliseconds = dragPosition.value!.inMilliseconds;
    inMilliseconds += isForward ? 300 : -300;
    dragPosition.value = Duration(milliseconds: inMilliseconds);
  }

  Future<void> onHorizontalDragEnd() async {
    if (dragPosition.value == null) return;
    final position = dragPosition.value;
    dragPosition.value = null;
    await seekTo(position!);
  }

  Future<void> onMoveVerticalStart(double dx, double dy) async {
    if (isFullScreen.value == false) return;
    dragStartX = dx;
    // moveStartY = dy;
    // currentVolume = await FlutterVolumeController.getVolume();
    // currentBrightness = await ScreenBrightness().current;
    // LogUtils.i('onMoveVerticalStart $moveStartX $screenWidth $screenHeight');
  }

  Future<void> onMoveVerticalUpdate(double dy) async {
    // if (isFullScreen.value == false) return;
    // if (moveStartY == null || currentVolume == null || moveStartX == null) return;
    // final distance = moveStartY! - dy;
    // double rate = distance / screenHeight;
    // if (moveStartX! >= screenWidth / 2) {
    //   double newValue = currentVolume! + rate;
    //   newValue = newValue >= 1.0 ? 1.0 : newValue;
    //   newValue = newValue < 0.0 ? 0 : newValue;
    //   await FlutterVolumeController.setVolume(newValue);
    // } else {
    //   double newValue = currentBrightness! + rate;
    //   newValue = newValue >= 1.0 ? 1.0 : newValue;
    //   newValue = newValue < 0.0 ? 0 : newValue;
    //   ScreenBrightness().setScreenBrightness(newValue);
    // }
  }

  void onMoveVerticalEnd() {
    // if (isFullScreen.value == false) return;
    // moveStartY = null;
    // FlutterVolumeController.getVolume().then((value) => currentVolume = value);
    // ScreenBrightness().current.then((value) => currentBrightness = value);
  }

  Future<void> back10seconds() async {
    var newPosition = positionMill - 10000;
    newPosition = newPosition <= 0 ? 0 : newPosition;
    await seekTo(Duration(milliseconds: newPosition));
  }

  Future<void> forward10Seconds() async {
    var newPosition = positionMill + 10000;
    newPosition = newPosition >= durationMill ? durationMill : newPosition;
    await seekTo(Duration(milliseconds: newPosition));
  }

  void onBackPressed() {
    PageNavigation.back();
    isFullScreen.value = false;
  }

  void toggleFullScreen() {
    chewieController.toggleFullScreen();
    isFullScreen.value = chewieController.isFullScreen;
  }

  void setupStreams() {
    _playStatusSubs = _chewiePlayerImpl.watchPlayState.listen((status) {
      playStatus.value = status;
    });

    _positionSubs = _chewiePlayerImpl.watchPosition.listen((pos) {
      position.value = pos;
    });

    _durationSubs = _chewiePlayerImpl.watchDuration.listen((dur) {
      duration.value = dur;
    });

    _bufferSubs = _chewiePlayerImpl.watchBuffer.listen((buff) {
      buffered.value = buff;
    });
  }

  Future<void> requestPlaySource(MediaInfo mediaInfo) async {
    try {
      if (mediaInfo.youtubeId == null) return;
      final manifest = await _youtubeExplode.videos.streams.getManifest(mediaInfo.youtubeId!);
      List<VideoSource> videoSources = [];
      List<AudioSource> audioSource = [];
      for (final mux in manifest.video) {
        videoSources.add(VideoUtils.parseMuxedVideo(mux));
      }
      videoSources.sort((a, b) {
        if (a.width == null || b.width == null) return 0;
        return a.width! > b.width! ? 1 : 0;
      });

      for (final audioInfo in manifest.audio) {
        audioSource.add(VideoUtils.parseAudio(audioInfo));
      }
      audioSource.sort((a, b) {
        if (a.bitrate == null || b.bitrate == null) return 0;
        return a.bitrate! > b.bitrate! ? 1 : 0;
      });
      mediaInfo.videoSources = videoSources;
      mediaInfo.audioSources = audioSource;
    } catch (e) {
      LogUtils.e('获取播放链接错误 ${e.toString()}');
    }
  }

  ChewieController get chewieController => _chewiePlayerImpl.chewieController!;

  MediaInfo? get nowPlayingMedia => _nowPlayingMedia.value;

  double get videoRatio => chewieController.videoPlayerController.value.aspectRatio ?? 1.0;

  int get durationMill => duration.value.inMilliseconds;

  int get positionMill => position.value.inMilliseconds;

  bool get isPlaying => playStatus.value == PlayStatus.playing;
}
