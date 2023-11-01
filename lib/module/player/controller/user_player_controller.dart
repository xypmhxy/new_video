/*
* 作者 Ren
* 时间  2023/9/13 08:01
*/
import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/helper/media_info_helper.dart';
import 'package:free_tube_player/module/player/interface/chewie_player_impl.dart';
import 'package:free_tube_player/module/player/page/user_player_page.dart';
import 'package:free_tube_player/utils/file_utils.dart';
import 'package:free_tube_player/utils/log_utils.dart';
import 'package:free_tube_player/utils/page_navigation.dart';
import 'package:free_tube_player/utils/sp_utils.dart';
import 'package:free_tube_player/utils/video_utils.dart';
import 'package:get/get.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import 'player_controller.dart';

Future<void> startUserPlayPage(
    {required MediaInfo mediaInfo, bool isCloseCurrent = false, BuildContext? context}) async {
  userPlayerController.playNewSource(mediaInfo);
  if (isCloseCurrent) {
    PageNavigation.startNewPageAndClose(const UserPlayerPage(), preventDuplicates: false);
  } else {
    PageNavigation.startNewPage(const UserPlayerPage());
  }
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
  final isLoop = false.obs;
  final isBackgroundPlayback = false.obs;
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
    if (mediaInfo.videoSources == null && mediaInfo.downloadPath == null) return;
    if (mediaInfo.downloadStatus == DownloadStatus.success) {
      final videoPath = await FileUtils.getDownloadFilePath(mediaInfo.downloadPath!);
      String? audioPath;
      if (mediaInfo.downloadAudioPath != null) {
        audioPath = await FileUtils.getDownloadFilePath(mediaInfo.downloadAudioPath!);
      }
      await _chewiePlayerImpl.playNewSource(videoPath, audioUrl: audioPath);
    } else {
      const targetResolution = 1080;
      final playVideoSource = VideoUtils.getTargetVideoUrl(targetResolution, mediaInfo);
      if (playVideoSource == null) return;
      String? audioUrl;
      if (mediaInfo.isNeedAudioTrack(targetResolution: targetResolution)) {
        audioUrl = mediaInfo.audioSources?.first.url;
      }
      await _chewiePlayerImpl.playNewSource(playVideoSource.url, audioUrl: audioUrl);
    }
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
    playSpeed.value = speed;
    await _chewiePlayerImpl.setPlaybackSpeed(speed, isByUser: isByUser);
  }

  Future<void> seekTo(Duration position, {bool isByUser = false}) async {
    if (isLive) return;
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
    position.value = Duration.zero;
    duration.value = Duration.zero;
    isLoop.value = false;
    isBackgroundPlayback.value = false;
    playStatus.value = PlayStatus.none;
  }

  Future<void> togglePanel() async {
    isShowControlPanel.value = !isShowControlPanel.value;
    checkControlPanelStatus();
  }

  void checkControlPanelStatus({int seconds = 3}) {
    if (isShowControlPanel.value) {
      startDelayCloseControlPanel();
    } else {
      cancelDelayCloseControlPanel();
    }
  }

  void startDelayCloseControlPanel({int seconds = 3}) {
    cancelDelayCloseControlPanel();
    _controlPanelTimer = Timer.periodic(Duration(seconds: seconds), (timer) {
      isShowControlPanel.value = false;
      cancelDelayCloseControlPanel();
    });
  }

  void showControlPanelLongTime() {
    if (isShowControlPanel.value) {
      startDelayCloseControlPanel(seconds: 30);
    } else {
      cancelDelayCloseControlPanel();
    }
  }

  void cancelDelayCloseControlPanel() {
    _controlPanelTimer?.cancel();
    _controlPanelTimer = null;
  }

  Future<void> togglePlay() async {
    startDelayCloseControlPanel();
    chewieController.togglePause();
    saveHistoryPosition();
  }

  void toggleLoop() {
    setLoop(isLoop.toggle().value);
  }

  void setLoop(bool isLoop) {
    _chewiePlayerImpl.setLoop(isLoop);
    this.isLoop.value = isLoop;
    SPUtils.setBool('play_loop', isLoop);
  }

  void toggleBackgroundPlayback() {
    isBackgroundPlayback.toggle();
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
    if (isLive) return;
    final isForward = dx >= 0;
    dragPosition.value ??= position.value;
    if (dragPosition.value == null) return;
    int inMilliseconds = dragPosition.value!.inMilliseconds;
    inMilliseconds += isForward ? 300 : -300;
    dragPosition.value = Duration(milliseconds: inMilliseconds);
  }

  Future<void> onHorizontalDragEnd() async {
    if (isLive) return;
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
    if (isLive) return;
    var newPosition = positionMill - 10000;
    newPosition = newPosition <= 0 ? 0 : newPosition;
    await seekTo(Duration(milliseconds: newPosition));
  }

  Future<void> forward10Seconds() async {
    if (isLive) return;
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
      if (playStatus.value == PlayStatus.initialized) {
        if (isRelease) play();
      }
    });

    _positionSubs = _chewiePlayerImpl.watchPosition.listen((pos) {
      if (isLive) return;
      position.value = pos;
    });

    _durationSubs = _chewiePlayerImpl.watchDuration.listen((dur) {
      if (isLive) return;
      duration.value = dur;
    });

    _bufferSubs = _chewiePlayerImpl.watchBuffer.listen((buff) {
      buffered.value = buff;
    });
  }

  Future<void> requestPlaySource(MediaInfo mediaInfo) async {
    try {
      if (mediaInfo.youtubeId == null) return;
      List<VideoSource> videoSources = [];
      List<AudioSource> audioSource = [];
      if (isLive) {
        final liveUrl = await _youtubeExplode.videos.streams.getHttpLiveStreamUrl(VideoId(mediaInfo.youtubeId!));
        videoSources.add(VideoSource(url: liveUrl));
      } else {
        final manifest = await _youtubeExplode.videos.streams.getManifest(mediaInfo.youtubeId!);
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
      }
      mediaInfo.videoSources = videoSources;
      mediaInfo.audioSources = audioSource;
    } catch (e) {
      LogUtils.e('获取播放链接错误 ${e.toString()}');
    }
  }

  void refreshMediaInfo() {
    _nowPlayingMedia.refresh();
  }

  ChewieController get chewieController => _chewiePlayerImpl.chewieController!;

  MediaInfo? get nowPlayingMedia => _nowPlayingMedia.value;

  double get videoRatio => chewieController.videoPlayerController.value.aspectRatio ?? 1.0;

  int get durationMill => duration.value.inMilliseconds;

  int get positionMill => position.value.inMilliseconds;

  bool get isPlaying => playStatus.value == PlayStatus.playing;

  bool get isLive => nowPlayingMedia?.isLive ?? false;

  static bool getLoop() {
    return SPUtils.getBool('play_loop');
  }
}
