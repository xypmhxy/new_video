/*
* 作者 Ren
* 时间  2023/7/25 21:15
*/

import 'dart:async';
import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_volume_controller/flutter_volume_controller.dart';
import 'package:free_tube_player/ad/helper/ad_manager.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/helper/media_info_helper.dart';
import 'package:free_tube_player/module/player/page/player_page.dart';
import 'package:free_tube_player/module/player/widget/player_control_panel.dart';
import 'package:free_tube_player/utils/log_utils.dart';
import 'package:free_tube_player/utils/page_navigation.dart';
import 'package:free_tube_player/utils/toast_utils.dart';
import 'package:get/get.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

enum PlayStatus { none, initialized, loading, playing, pause }

void playMediaInfo({required MediaInfo mediaInfo}) {
  PlayerController.get.playNew(mediaInfo);
  PageNavigation.startNewPage(const PlayerPage());
}

class PlayerController extends GetxController {
  static final get = PlayerController._();

  PlayerController._() {
    _init();
  }

  final Rxn<MediaInfo> _mediaInfo = Rxn();

  final playStatus = PlayStatus.none.obs;
  final duration = Duration.zero.obs;
  final position = Duration.zero.obs;
  final movePosition = Rxn<Duration>();
  final buffered = Duration.zero.obs;
  final isShowControlPanel = false.obs;
  final playSpeed = 1.0.obs;
  final isFullScreen = false.obs;
  final brightness = Rxn<double>();

  final _mediaInfoHelper = MediaInfoHelper.get;

  ChewieController? chewieController;
  double? moveStartX;
  double? moveStartY;
  double? currentVolume;
  double? currentBrightness;
  Timer? _timer;
  Timer? _controlPanelTimer;
  Completer<bool>? _adShowCompleter;

  void _init() {
    playStatus.listen((playStatus) {
      if (playStatus == PlayStatus.playing) {
        WakelockPlus.enable();
        startPositionRecordTimer();
      } else {
        WakelockPlus.disable();
      }
    });
  }

  Future<void> playNew(MediaInfo mediaInfo) async {
    _showAD();
    await release();
    _mediaInfo.value = mediaInfo;
    preparePlay();
  }

  MediaInfo? get nowPlayMedia => _mediaInfo.value;

  Rxn<MediaInfo> get mediaInfoRx => _mediaInfo;

  Future<void> preparePlay() async {
    playStatus.value = PlayStatus.loading;
    if (chewieController?.hasListeners ?? false) {
      chewieController?.removeListener(_videoPlayerListener);
    }
    VideoPlayerController videoPlayerController = VideoPlayerController.file(File(nowPlayMedia!.localPath!));

    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoInitialize: false,
        autoPlay: false,
        showControlsOnInitialize: true,
        showControls: true,
        useRootNavigator: false,
        deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
        deviceOrientationsOnEnterFullScreen: [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight],
        customControls: PlayerControlPanel(playerController: this, onBackPressed: onBackPressed),
        errorBuilder: (_, e) {
          playStatus.value = PlayStatus.none;
          return Container(color: Colors.deepOrange);
        });
    chewieController?.videoPlayerController.addListener(_videoPlayerListener);
    chewieController?.videoPlayerController.initialize().then((value) async {
      if (nowPlayMedia?.historyPosition != null) {
        await seekTo(Duration(milliseconds: nowPlayMedia!.historyPosition!));
      }
      if (_adShowCompleter?.isCompleted == false) {
        await _adShowCompleter?.future;
      }
      chewieController?.play();
    }).onError((error, stackTrace) {
      ToastUtils.show('视频播放失败 ${error.toString()}');
    });
  }

  Future<void> back10seconds() async {
    var newPosition = positionMill - 10000;
    newPosition = newPosition <= 0 ? 0 : newPosition;
    await seekTo(Duration(milliseconds: newPosition));
  }

  Future<void> clickPlay() async {
    if (isPlaying == false) {
      _showAD();
    }
    chewieController?.togglePause();
    saveHistoryPosition();
    checkControlPanelStatus();
  }

  Future<void> forward10Seconds() async {
    var newPosition = positionMill + 10000;
    newPosition = newPosition >= durationMill ? durationMill : newPosition;
    await seekTo(Duration(milliseconds: newPosition));
  }

  Future<void> seekTo(Duration position) async {
    this.position.value = position;
    movePosition.refresh();
    checkControlPanelStatus();
    await chewieController?.seekTo(position);
    saveHistoryPosition();
  }

  Future<void> togglePanel() async {
    isShowControlPanel.value = !isShowControlPanel.value;
    checkControlPanelStatus();
  }

  Future<void> setPlaySpeed(double speed) async {
    cancelDelayCloseControlPanel();
    isShowControlPanel.value = false;
    await chewieController?.videoPlayerController.setPlaybackSpeed(speed);
    playSpeed.value = speed;
  }

  Future<void> onMoveStart(double dx) async {
    moveStartX = dx;
    // isShowControlPanel.value = true;
  }

  Future<void> onMove(double dx) async {
    if (moveStartX == null) return;
    final distance = (dx - moveStartX!) ~/ 5;
    int moveMill = positionMill + (distance * 3 * 500);
    moveMill = moveMill <= 0 ? 0 : moveMill;
    moveMill = moveMill >= durationMill ? durationMill : moveMill;
    movePosition.value = Duration(milliseconds: moveMill);
  }

  Future<void> onMoveEnd() async {
    moveStartX = null;
    if (movePosition.value == null) return;
    final position = movePosition.value;
    movePosition.value = null;
    await seekTo(position!);
  }

  void toggleFullScreen() {
    chewieController?.toggleFullScreen();
    isFullScreen.value = chewieController?.isFullScreen ?? false;
    checkControlPanelStatus();
  }

  void enterFullScreen() {
    isFullScreen.value = true;
    chewieController?.enterFullScreen();
    checkControlPanelStatus();
  }

  void exitFullScreen() {
    isFullScreen.value = false;
    chewieController?.exitFullScreen();
    checkControlPanelStatus();
  }

  void onBackPressed() {
    PageNavigation.back();
    isFullScreen.value = false;
  }

  Future<void> onMoveVerticalStart(double dx, double dy) async {
    // LogUtils.i('bottomBarHeight ${bottomSafeBarHeight}');
    if (isFullScreen.value == false) return;
    moveStartX = dx;
    moveStartY = dy;
    currentVolume = await FlutterVolumeController.getVolume();
    currentBrightness = await ScreenBrightness().current;
    brightness.value = currentBrightness;
    // LogUtils.i('onMoveVerticalStart $moveStartX $screenWidth $screenHeight');
  }

  Future<void> onMoveVerticalUpdate(double dy) async {
    if (isFullScreen.value == false) return;
    if (moveStartY == null || currentVolume == null || moveStartX == null) return;
    final distance = moveStartY! - dy;
    double rate = distance / screenHeight;
    if (moveStartX! >= screenWidth / 2) {
      double newValue = currentVolume! + rate;
      newValue = newValue >= 1.0 ? 1.0 : newValue;
      newValue = newValue < 0.0 ? 0 : newValue;
      await FlutterVolumeController.setVolume(newValue);
    } else {
      double newValue = currentBrightness! + rate;
      newValue = newValue >= 1.0 ? 1.0 : newValue;
      newValue = newValue < 0.0 ? 0 : newValue;
      brightness.value = newValue;
      ScreenBrightness().setScreenBrightness(newValue);
    }
  }

  void onMoveVerticalEnd() {
    if (isFullScreen.value == false) return;
    moveStartY = null;
    FlutterVolumeController.getVolume().then((value) => currentVolume = value);
    ScreenBrightness().current.then((value) => currentBrightness = value);
    brightness.value = null;
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

  Future<void> saveHistoryPosition() async {
    if (nowPlayMedia == null || positionMill < 0) return;
    await _mediaInfoHelper.savePlayPosition(nowPlayMedia!, positionMill);
  }

  void startDelayCloseControlPanel({int seconds = 3}) {
    cancelDelayCloseControlPanel();
    _controlPanelTimer = Timer.periodic(Duration(seconds: seconds), (timer) {
      isShowControlPanel.value = false;
      cancelDelayCloseControlPanel();
    });
  }

  void cancelDelayCloseControlPanel() {
    _controlPanelTimer?.cancel();
    _controlPanelTimer = null;
  }

  void checkControlPanelStatus({int seconds = 3}) {
    if (isShowControlPanel.value) {
      startDelayCloseControlPanel(seconds: seconds);
    } else {
      cancelDelayCloseControlPanel();
    }
  }

  void showControlPanelLongTime() {
    if (isShowControlPanel.value) {
      startDelayCloseControlPanel(seconds: 30);
    } else {
      cancelDelayCloseControlPanel();
    }
  }

  ///
  void _videoPlayerListener() {
    final isPlaying = chewieController?.isPlaying ?? false;
    if (isPlaying) {
      playStatus.value = PlayStatus.playing;
    } else {
      playStatus.value = PlayStatus.pause;
    }

    final duration = chewieController?.videoPlayerController.value.duration ?? Duration.zero;
    this.duration.value = duration;

    final position = chewieController?.videoPlayerController.value.position ?? Duration.zero;
    this.position.value = position;

    isFullScreen.value = chewieController?.isFullScreen ?? false;
    // final buffered = videoPlayerController?.value.buffered.last.end ?? Duration.zero;
    // this.buffered.value = buffered;
  }

  ///
  double get videoRatio => chewieController?.videoPlayerController.value.aspectRatio ?? 1.0;

  int get durationMill => duration.value.inMilliseconds;

  int get positionMill => position.value.inMilliseconds;

  bool get isPlaying => playStatus.value == PlayStatus.playing;

  ///
  Future<void> release() async {
    await chewieController?.pause();
    await chewieController?.videoPlayerController.dispose();
    chewieController?.dispose();
    chewieController = null;
    stopPositionRecordTimer();
    cancelDelayCloseControlPanel();
    await saveHistoryPosition();
    sendMediaInfoEvent();
    playStatus.value = PlayStatus.none;
    isShowControlPanel.value = false;
    isFullScreen.value = false;
    _mediaInfo.value = null;
    position.value = Duration.zero;
    duration.value = Duration.zero;
  }

  void sendMediaInfoEvent() {
    if (nowPlayMedia == null) return;
    MediaInfoHelper.get.sendChangeEvent(MediaInfoChangeWatcher(mediaInfo: nowPlayMedia!, type: DBChangeType.update));
  }

  Future<void> _showAD() async {
    ADManager.instance.loadPlayAD();
    _adShowCompleter = Completer();
    await ADManager.instance.tryShowPlayAD();
    _adShowCompleter?.complete(true);
  }
}
