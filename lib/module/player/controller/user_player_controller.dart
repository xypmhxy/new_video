/*
* 作者 Ren
* 时间  2023/9/13 08:01
*/
import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_volume_controller/flutter_volume_controller.dart';
import 'package:free_tube_player/ad/ad_utils.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/db/dao/media_info_dao.dart';
import 'package:free_tube_player/firebase/firebase_event.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/helper/media_info_helper.dart';
import 'package:free_tube_player/module/player/interface/chewie_player_impl.dart';
import 'package:free_tube_player/module/player/page/user_player_page.dart';
import 'package:free_tube_player/utils/date_utils.dart';
import 'package:free_tube_player/utils/file_utils.dart';
import 'package:free_tube_player/utils/log_utils.dart';
import 'package:free_tube_player/utils/page_navigation.dart';
import 'package:free_tube_player/utils/setting_utils.dart';
import 'package:free_tube_player/utils/sp_utils.dart';
import 'package:free_tube_player/utils/toast_utils.dart';
import 'package:free_tube_player/utils/video_data_helper.dart';
import 'package:get/get.dart';
import 'package:native_device_orientation/native_device_orientation.dart';
import 'package:screen_brightness/screen_brightness.dart';

import 'player_controller.dart';

Future<void> startUserPlayPage(
    {required MediaInfo mediaInfo,
    required String from,
    VideoSource? videoSource,
    bool isCloseCurrent = false,
    BuildContext? context}) async {
  ADUtils.instance.showPlayAD();
  userPlayerController.playNewSource(mediaInfo, videoSource: videoSource);
  if (isCloseCurrent) {
    PageNavigation.startNewPageAndClose(const UserPlayerPage(), preventDuplicates: false);
  } else {
    PageNavigation.startNewPage(const UserPlayerPage());
  }
  FirebaseEvent.instance.logEvent('play_click', params: {'value': mediaInfo.youtubeId ?? 'none', 'value1': from});
}

class UserPlayerController {
  final _mediaDao = MediaInfoDao();
  final _chewiePlayerImpl = ChewiePlayerImpl();
  final _nativeDeviceOrientation = NativeDeviceOrientationCommunicator();

  final _nowPlayingMedia = Rxn<MediaInfo>();
  final videoSource = Rxn<VideoSource>();
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
  final brightness = Rxn<double>();
  final fetchPlayInfoProgress = 0.0.obs;

  double? dragStartX;
  double? dragStartY;
  double? currentVolume;
  double? currentBrightness;

  StreamSubscription? _playStatusSubs;
  StreamSubscription? _positionSubs;
  StreamSubscription? _durationSubs;
  StreamSubscription? _bufferSubs;
  StreamSubscription? _playerAvailableSubs;
  StreamSubscription? _fullScreenSubs;
  StreamSubscription? _orientationSubs;

  Timer? _controlPanelTimer;
  Timer? _timer;
  final _mediaInfoHelper = MediaInfoHelper.get;

  Future<void> playNewSource(MediaInfo mediaInfo, {VideoSource? videoSource}) async {
    if (mediaInfo.identify == _nowPlayingMedia.value?.identify &&
        videoSource?.identify == this.videoSource.value?.identify) return;
    LogUtils.i('播放--开始播放');
    FirebaseEvent.instance.logEvent('play_video', params: {'value': mediaInfo.youtubeId});
    final startPrePlayDate = DateUtil.getNowDateMs();
    int getUrlDate = startPrePlayDate;
    fetchPlayInfoProgress.value = 0.0;
    _mediaDao.insert(mediaInfo);
    _nowPlayingMedia.value = mediaInfo;
    playStatus.value = PlayStatus.loading;
    await stop();
    if (videoSource == null) {
      if (SettingUtils.getBoolConfig('play_downloaded_first', defaultValue: true)) {
        videoSource = mediaInfo.getDownloadedSource();
      }
      if (videoSource == null) {
        const targetResolution = defaultResolution;
        videoSource = VideoDataHelper.get.getTargetVideoUrl(targetResolution, mediaInfo);
      }
    }
    String? videoUrl;
    String? audioUrl;
    if (videoSource == null) {
      final media = await VideoDataHelper.get.requestVideoSource(mediaInfo, isNeedRetry: true);
      getUrlDate = DateUtil.getNowDateMs();
      LogUtils.i('播放--播放链接获取完成总耗时 ${getUrlDate - startPrePlayDate} 是否成功 ${media != null}');
      if (media == null) {
        playStatus.value = PlayStatus.none;
        fetchPlayInfoProgress.value = 0.0;
        ToastUtils.show(S.current.getPlaySourceFailed, isCorrect: false);
        return;
      }
      const targetResolution = defaultResolution;
      videoSource = VideoDataHelper.get.getTargetVideoUrl(targetResolution, mediaInfo);
      if (videoSource == null) {
        playStatus.value = PlayStatus.none;
        fetchPlayInfoProgress.value = 0.0;
        ToastUtils.show(S.current.getPlaySourceFailed, isCorrect: false);
        FirebaseEvent.instance.logEvent('play_resolution_error', params: {'value': mediaInfo.youtubeId});
        return;
      }
      videoUrl = videoSource.url;
      audioUrl = videoSource.audioSource?.url;
    } else {
      if (videoSource.isDownloadAvailable == true) {
        videoUrl = await FileUtils.getDownloadFilePath(videoSource.downloadPath!);
        String? audioPath = videoSource.audioSource?.downloadPath;
        if (audioPath != null) {
          audioUrl = await FileUtils.getDownloadFilePath(audioPath);
        }
      } else {
        videoUrl = videoSource.url;
        audioUrl = videoSource.audioSource?.url;
      }
    }
    if (videoSource.isNeedAudioTrack() && audioUrl == null) {
      videoSource.audioSource = mediaInfo.audioSources?.first;
      audioUrl = videoSource.audioSource?.url;
    }
    this.videoSource.value = videoSource;
    saveHistoryPosition();
    fetchPlayInfoProgress.value = 0.5;
    setupStreams();
    final errorMsg = await _chewiePlayerImpl.playNewSource(videoUrl, audioUrl: audioUrl);
    if (errorMsg != null) {
      if (isDebug) {
        ToastUtils.show('播放失败 $errorMsg', isCorrect: false);
      } else {
        ToastUtils.show(S.current.getPlaySourceFailed, isCorrect: false);
      }
      FirebaseEvent.instance.logEvent('play_video_error', params: {'value': mediaInfo.youtubeId, 'value1': errorMsg});
    }
    final playSuccessDate = DateUtil.getNowDateMs();
    LogUtils.i('播放--初始化耗时 ${playSuccessDate - getUrlDate}');
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
    saveHistoryPosition();
  }

  Future<void> enterFullScreen({bool isByUser = false}) async {
    await _chewiePlayerImpl.enterFullScreen();
    isFullScreen.value = true;
  }

  Future<void> exitFullScreen({bool isByUser = false}) async {
    await _chewiePlayerImpl.exitFullScreen();
    isFullScreen.value = false;
  }

  Future<void> stop() async {
    await _chewiePlayerImpl.stop();
    _playStatusSubs?.cancel();
    _fullScreenSubs?.cancel();
    _orientationSubs?.cancel();
    _playerAvailableSubs?.cancel();
    _positionSubs?.cancel();
    _durationSubs?.cancel();
    _bufferSubs?.cancel();
    position.value = Duration.zero;
    duration.value = Duration.zero;
    isLoop.value = false;
    isBackgroundPlayback.value = false;
    playStatus.value = PlayStatus.none;
    isFullScreen.value = false;
    fetchPlayInfoProgress.value = 0.0;
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
    ADUtils.instance.loadPlayAD();
    if (isPlaying == false) {
      await ADUtils.instance.showPlayAD();
    }
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
    FirebaseEvent.instance
        .logEvent('set_loop', params: {'value': nowPlayingMedia?.youtubeId ?? 'none', 'value1': '$isLoop'});
  }

  void toggleBackgroundPlayback() {
    isBackgroundPlayback.toggle();
    FirebaseEvent.instance.logEvent('click_background_play',
        params: {'value': nowPlayingMedia?.youtubeId ?? 'none', 'value1': '${isBackgroundPlayback.value}'});
  }

  Future<void> saveHistoryPosition() async {
    if (_nowPlayingMedia.value == null) return;
    await _mediaInfoHelper.savePlayPosition(_nowPlayingMedia.value!, positionMill);
  }

  Future<void> onHorizontalDragStart(double dx) async {
    if (dx < 30 || dx >= screenHeight - 30) return;
    dragStartX = dx;
  }

  Future<void> onHorizontalDragUpdate(double dx) async {
    if (isLive || dragStartX == null) return;
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
    dragStartX = null;
    await seekTo(position!);
  }

  Future<void> onMoveVerticalStart(double dx, double dy) async {
    if (isFullScreen.value == false) return;
    if (dx < 30 || dx >= screenHeight - 30 || dy <= 30 || dy >= screenWidth - 30) return;
    dragStartX = dx;
    dragStartY = dy;
    currentVolume = await FlutterVolumeController.getVolume();
    currentBrightness = await ScreenBrightness().current;
  }

  Future<void> onMoveVerticalUpdate(double dy) async {
    if (isFullScreen.value == false) return;
    if (dragStartY == null || currentVolume == null || dragStartX == null) return;
    final distance = dragStartY! - dy;
    double rate = distance / screenHeight;
    if (dragStartX! >= screenHeight / 2) {
      double newValue = currentVolume! + rate;
      newValue = newValue >= 1.0 ? 1.0 : newValue;
      newValue = newValue < 0.0 ? 0 : newValue;
      await FlutterVolumeController.setVolume(newValue);
    } else {
      double newValue = currentBrightness! + rate;
      newValue = newValue >= 1.0 ? 1.0 : newValue;
      newValue = newValue < 0.0 ? 0 : newValue;
      ScreenBrightness().setScreenBrightness(newValue);
      brightness.value = newValue;
    }
  }

  void onMoveVerticalEnd() {
    if (isFullScreen.value == false) return;
    dragStartY = null;
    brightness.value = null;
    FlutterVolumeController.getVolume().then((value) => currentVolume = value);
    ScreenBrightness().current.then((value) => currentBrightness = value);
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

  Future<void> changeQuality(String label) async {
    final videoSource = nowPlayingMedia?.videoSources?.firstWhereOrNull((element) => element.label == label);
    if (videoSource == null) return;
    if (isFullScreen.value) {
      await exitFullScreen();
    }
    FirebaseEvent.instance
        .logEvent('change_quality', params: {'value': nowPlayingMedia?.youtubeId ?? 'none', 'value1': label});
    playNewSource(nowPlayingMedia!, videoSource: videoSource);
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
    _fullScreenSubs = _chewiePlayerImpl.watchFullScreen.listen((fullScreen) {
      isFullScreen.value = fullScreen;
    });

    _orientationSubs = _nativeDeviceOrientation.onOrientationChanged(useSensor: true).listen((event) {
      if (isFullScreen.value) {
        if (event == NativeDeviceOrientation.landscapeLeft) {
          SystemChrome.setPreferredOrientations([
            // 强制横屏
            DeviceOrientation.landscapeLeft,
          ]);
        } else if (event == NativeDeviceOrientation.landscapeRight) {
          SystemChrome.setPreferredOrientations([
            // 强制横屏
            DeviceOrientation.landscapeRight,
          ]);
        }
      }
    });

    _playStatusSubs = _chewiePlayerImpl.watchPlayState.listen((status) async {
      playStatus.value = status;
      if (playStatus.value == PlayStatus.initialized) {
        startPositionRecordTimer();
        // if (isRelease) {
        await ADUtils.instance.waitPlayADShow?.future;
        play();
        // }
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

  void refreshMediaInfo() {
    _nowPlayingMedia.refresh();
  }

  void startPositionRecordTimer() {
    stopPositionRecordTimer();
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      saveHistoryPosition();
    });
  }

  void stopPositionRecordTimer() {
    _timer?.cancel();
    _timer = null;
  }

  ChewieController get chewieController => _chewiePlayerImpl.chewieController!;

  MediaInfo? get nowPlayingMedia => _nowPlayingMedia.value;

  double get videoRatio => chewieController.videoPlayerController.value.aspectRatio ?? 1.0;

  int get durationMill => duration.value.inMilliseconds;

  int get positionMill => position.value.inMilliseconds;

  bool get isPlaying => playStatus.value == PlayStatus.playing;

  bool get isPlayerAvailable => playStatus.value != PlayStatus.none;

  bool get isPlayerLoading => playStatus.value == PlayStatus.loading;

  bool get isPlayerNone => playStatus.value == PlayStatus.none;

  bool get isLive => nowPlayingMedia?.isLive ?? false;

  double get positionProgress => durationMill == 0 ? 0 : positionMill / durationMill;

  static bool getLoop() {
    return SPUtils.getBool('play_loop');
  }
}
