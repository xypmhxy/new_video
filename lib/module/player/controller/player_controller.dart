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
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/helper/media_info_helper.dart';
import 'package:free_tube_player/module/player/page/player_page.dart';
import 'package:free_tube_player/module/player/widget/player_control_panel.dart';
import 'package:free_tube_player/utils/page_navigation.dart';
import 'package:free_tube_player/utils/toast_utils.dart';
import 'package:get/get.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:video_player/video_player.dart';

enum PlayStatus { none, loading, playing, pause }

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

  final _mediaInfoHelper = MediaInfoHelper.get;

  ChewieController? chewieController;
  double? moveStartX;
  double? moveStartY;
  double? currentVolume;
  double? currentBrightness;
  Timer? _timer;
  Timer? _controlPanelTimer;

  void _init() {
    playStatus.listen((playStatus) {
      if (playStatus == PlayStatus.playing) {
        startPositionRecordTimer();
      }
    });
  }

  Future<void> playNew(MediaInfo mediaInfo) async {
    await release();
    _mediaInfo.value = mediaInfo;
    preparePlay();
  }

  MediaInfo? get mediaInfo => _mediaInfo.value;

  Rxn<MediaInfo> get mediaInfoRx => _mediaInfo;

  Future<void> preparePlay() async {
    playStatus.value = PlayStatus.loading;
    if (chewieController?.hasListeners ?? false) {
      chewieController?.removeListener(_videoPlayerListener);
    }
    VideoPlayerController videoPlayerController;
    if (mediaInfo?.isLocalVideo ?? false) {
      videoPlayerController = VideoPlayerController.file(File(mediaInfo!.localPath!));
    } else if (_mediaInfo.value?.downloadPath?.isNotEmpty ?? false) {
      videoPlayerController = VideoPlayerController.file(File(_mediaInfo.value!.downloadPath!));
    } else {
      videoPlayerController = VideoPlayerController.file(File(_mediaInfo.value!.downloadPath!));
    }
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoInitialize: false,
        autoPlay: false,
        showControlsOnInitialize: true,
        showControls: true,
        useRootNavigator: false,
        deviceOrientationsOnEnterFullScreen: [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight],
        customControls: PlayerControlPanel(playerController: this, onBackPressed: onBackPressed),
        errorBuilder: (_, e) {
          playStatus.value = PlayStatus.none;
          return Container(color: Colors.deepOrange);
        });
    chewieController?.videoPlayerController.addListener(_videoPlayerListener);
    chewieController?.videoPlayerController.initialize().then((value) async {
      if (mediaInfo?.historyPosition != null) {
        await seekTo(Duration(milliseconds: mediaInfo!.historyPosition!));
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
    chewieController?.togglePause();
    saveHistoryPosition();
  }

  Future<void> forward10Seconds() async {
    var newPosition = positionMill + 10000;
    newPosition = newPosition >= durationMill ? durationMill : newPosition;
    await seekTo(Duration(milliseconds: newPosition));
  }

  Future<void> seekTo(Duration position) async {
    this.position.value = position;
    movePosition.refresh();
    await chewieController?.seekTo(position);
    saveHistoryPosition();
  }

  Future<void> togglePanel() async {
    isShowControlPanel.value = !isShowControlPanel.value;
    checkControlPanelStatus();
  }

  Future<void> setPlaySpeed(double speed) async {
    await chewieController?.videoPlayerController.setPlaybackSpeed(speed);
    playSpeed.value = speed;
  }

  Future<void> onMoveStart(double dx) async {
    moveStartX = dx;
    isShowControlPanel.value = true;
    checkControlPanelStatus();
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
  }

  void enterFullScreen() {
    isFullScreen.value = true;
    chewieController?.enterFullScreen();
  }

  void exitFullScreen() {
    isFullScreen.value = false;
    chewieController?.exitFullScreen();
  }

  void onBackPressed() {
    PageNavigation.back();
    isFullScreen.value = false;
  }

  Future<void> onMoveVerticalStart(double dx, double dy) async {
    if (isFullScreen.value == false) return;
    moveStartX = dx;
    moveStartY = dy;
    currentVolume = await FlutterVolumeController.getVolume();
    currentBrightness = await ScreenBrightness().current;
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
      ScreenBrightness().setScreenBrightness(newValue);
    }
  }

  void onMoveVerticalEnd() {
    if (isFullScreen.value == false) return;
    moveStartY = null;
    FlutterVolumeController.getVolume().then((value) => currentVolume = value);
    ScreenBrightness().current.then((value) => currentBrightness = value);
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
    if (mediaInfo == null || positionMill < 0) return;
    await _mediaInfoHelper.savePlayPosition(mediaInfo!, positionMill);
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

  void checkControlPanelStatus(){
    if (isShowControlPanel.value) {
      startDelayCloseControlPanel();
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
    if (mediaInfo == null) return;
    MediaInfoHelper.get.sendChangeEvent(MediaInfoChangeWatcher(mediaInfo: mediaInfo!, type: DBChangeType.update));
  }
}
