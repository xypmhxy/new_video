/*
* 作者 Ren
* 时间  2023/9/13 08:06
*/
import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/module/player/controller/player_controller.dart';
import 'package:free_tube_player/module/player/interface/player_interface.dart';
import 'package:free_tube_player/module/player/widget/user_player_control_panel.dart';
import 'package:free_tube_player/utils/log_utils.dart';
import 'package:video_player/video_player.dart';

class ChewiePlayerImpl implements PlayerInterface {
  ChewieController? _chewieController;

  Stream<Duration> watchBuffer = const Stream.empty();

  PlayStatus _playStatus = PlayStatus.none;
  final StreamController<PlayStatus> _playStateController = StreamController.broadcast();
  late Stream watchPlayState = _playStateController.stream;

  bool _isFullScreen = false;
  final StreamController<bool> _fullScreenController = StreamController.broadcast();
  late Stream watchFullScreen = _fullScreenController.stream;

  Duration _duration = Duration.zero;
  final StreamController<Duration> _durationController = StreamController.broadcast();
  late Stream watchDuration = _durationController.stream;

  final StreamController<Duration> _positionController = StreamController.broadcast();
  late Stream watchPosition = _positionController.stream;

  @override
  Future<void> playNewSource(String url, {String? audioUrl}) async {
    await stop();
    _playStatus = PlayStatus.loading;
    if (chewieController?.hasListeners ?? false) {
      chewieController?.removeListener(_videoPlayerListener);
    }
    VideoPlayerController videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(url), audioSource: audioUrl);
    _chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoInitialize: false,
        autoPlay: false,
        showControlsOnInitialize: true,
        showControls: true,
        useRootNavigator: false,
        deviceOrientationsOnEnterFullScreen: [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight],
        customControls: UserPlayerControlPanel(
            playerController: userPlayerController, onBackPressed: userPlayerController.onBackPressed),
        errorBuilder: (_, e) {
          _playStatus = PlayStatus.none;
          return Container(color: Colors.deepOrange);
        });
    chewieController?.videoPlayerController.addListener(_videoPlayerListener);
    chewieController?.videoPlayerController.initialize().then((value) async {
      // if (nowPlayMedia?.historyPosition != null) {
      //   await seekTo(Duration(milliseconds: nowPlayMedia!.historyPosition!));
      // }
      // if (_adShowCompleter?.isCompleted == false) {
      //   await _adShowCompleter?.future;
      // }
      // chewieController?.play();
    }).onError((error, stackTrace) {
      LogUtils.e('视频播放失败 ${error.toString()}');
    });
  }

  @override
  Future<void> play({bool isByUser = false}) async {
    await _chewieController?.play();
  }

  @override
  Future<void> pause({bool isByUser = false}) async {
    await _chewieController?.pause();
  }

  @override
  Future<void> previous({bool isByUser = false}) async {}

  @override
  Future<void> next({bool isByUser = false}) async {}

  @override
  Future<void> setPlaybackSpeed(double speed, {bool isByUser = false}) async {
    await chewieController?.videoPlayerController.setPlaybackSpeed(speed);
  }

  @override
  Future<void> seekTo(Duration position, {bool isByUser = false}) async {
    await chewieController?.seekTo(position);
  }

  @override
  Future<void> enterFullScreen({bool isByUser = false}) async {
    chewieController?.enterFullScreen();
  }

  @override
  Future<void> exitFullScreen({bool isByUser = false}) async {
    chewieController?.exitFullScreen();
  }

  @override
  Future<void> stop() async {
    try {
      await pause();
      _chewieController?.removeListener(_videoPlayerListener);
      _chewieController?.dispose();
      _chewieController = null;
    } catch (_) {}
  }

  ChewieController? get chewieController => _chewieController;

  void _videoPlayerListener() {
    final isPlaying = chewieController?.isPlaying ?? false;
    var playStatus = PlayStatus.none;
    if (isPlaying) {
      playStatus = PlayStatus.playing;
    } else {
      playStatus = PlayStatus.pause;
    }
    if (_playStatus != playStatus) {
      _playStatus = playStatus;
      _playStateController.add(playStatus);
    }

    final duration = chewieController?.videoPlayerController.value.duration ?? Duration.zero;
    if (_duration != duration) {
      _duration = duration;
      _durationController.add(_duration);
    }

    final position = chewieController?.videoPlayerController.value.position ?? Duration.zero;
    _positionController.add(position);

    final isFullScreen = chewieController?.isFullScreen ?? false;
    if (_isFullScreen != isFullScreen) {
      _isFullScreen = isFullScreen;
      _fullScreenController.add(isFullScreen);
    }
  }
}
