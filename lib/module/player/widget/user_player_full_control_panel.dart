/*
* 作者 Ren
* 时间  2023/7/26 07:39
*/

import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/app/resource/color_res.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/extension/duration_extension.dart';
import 'package:free_tube_player/generated/assets.dart';
import 'package:free_tube_player/module/player/controller/user_player_controller.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/download_custom_view.dart';
import 'package:free_tube_player/widget/player_seek_bar.dart';
import 'package:free_tube_player/widget/svg_view.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:get/get.dart';

class UserPlayerFullControlPanel extends StatefulWidget {
  final UserPlayerController playerController;
  final Duration? movePosition;
  final VoidCallback onBackPressed;

  const UserPlayerFullControlPanel(
      {super.key, required this.playerController, required this.onBackPressed, this.movePosition});

  @override
  State<UserPlayerFullControlPanel> createState() => _UserPlayerFullControlPanelState();
}

class _UserPlayerFullControlPanelState extends State<UserPlayerFullControlPanel> {
  late UserPlayerController playerController = widget.playerController;
  late Duration? movePosition = widget.movePosition;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Visibility(
        visible: playerController.isShowControlPanel.value,
        child: Stack(
          alignment: Alignment.center,
          children: [_background(), _backButton(), _topToolBar(), _playWidget(), _progressBar()],
        )));
  }

  Widget _background() {
    return IgnorePointer(
        child: Container(
      color: Colors.black26,
    ));
  }

  Widget _backButton() {
    return Positioned(
        left: 24,
        top: 16,
        child: Row(
          children: [
            _button(Icons.arrow_back_rounded, onPressed: widget.onBackPressed, size: 28),
            const Width(12),
            SizedBox(
              width: screenWidth * .9,
              child: TextView.primary(
                playerController.nowPlayingMedia?.title ?? '',
                height: 1.1,
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ));
  }

  Widget _topToolBar() {
    return Positioned(
        top: 16,
        right: 48,
        child: Row(
          children: [_qualityDropDown(), const Width(20), _speedDropDown(), const Width(20), _downloadView()],
        ));
  }

  Widget _speedDropDown() {
    const textColor = Colors.white;
    return Obx(() => PopupMenuButton<double>(
          itemBuilder: (context) {
            return <PopupMenuItem<double>>[
              const PopupMenuItem(value: 0.5, child: TextView.primary('0.5x', color: textColor, fontSize: 16)),
              const PopupMenuItem(value: 0.75, child: TextView.primary('0.75x', color: textColor, fontSize: 16)),
              const PopupMenuItem(value: 1.0, child: TextView.primary('1.0x', color: textColor, fontSize: 16)),
              const PopupMenuItem(value: 1.25, child: TextView.primary('1.25x', color: textColor, fontSize: 16)),
              const PopupMenuItem(value: 1.5, child: TextView.primary('1.5x', color: textColor, fontSize: 16)),
              const PopupMenuItem(value: 2.0, child: TextView.primary('2.0x', color: textColor, fontSize: 16))
            ];
          },
          color: ColorRes.backgroundColor,
          iconSize: 1,
          onCanceled: () {
            playerController.startDelayCloseControlPanel();
          },
          onOpened: () {
            playerController.showControlPanelLongTime();
          },
          onSelected: (value) {
            playerController.setPlaybackSpeed(value);
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(  color: ColorRes.textPrimaryColor, width: 2),
                borderRadius: getBorderRadius(8)),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
            child: TextView.primary(
              '${playerController.playSpeed.value}x',
              color: ColorRes.textPrimaryColor,
              fontSize: 14,
            ),
          ),
        ));
  }

  Widget _qualityDropDown() {
    return Obx(() => Visibility(
        visible: playerController.isLive == false,
        child: PopupMenuButton<String>(
          itemBuilder: (context) {
            return getQualityChildren();
          },
          color: ColorRes.backgroundColor,
          iconSize: 1,
          onCanceled: () {
            playerController.startDelayCloseControlPanel();
          },
          onOpened: () {
            playerController.showControlPanelLongTime();
          },
          onSelected: (value) {
            playerController.changeQuality(value);
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: ColorRes.textPrimaryColor, width: 2),
                borderRadius: getBorderRadius(8)),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: TextView.primary(
              '${playerController.videoSource.value?.label}',
              color: ColorRes.textPrimaryColor,
              fontSize: 14,
            ),
          ),
        )));
  }

  Widget _downloadView() {
    return Obx(() => Visibility(
        visible: playerController.isLive == false,
        child: DownloadCustomView(
            mediaInfo: playerController.nowPlayingMedia!, videoSource: playerController.videoSource.value!)));
  }

  Widget _playWidget() {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _button(Icons.replay_10_rounded, size: 34, onPressed: playerController.back10seconds),
          const Width(64),
          Obx(() {
            final isPlaying = playerController.isPlaying;
            return _buttonSvg(isPlaying ? Assets.svgPause : Assets.svgPlay,
                size: isPlaying ? 44 : 44, onPressed: playerController.togglePlay);
          }),
          const Width(64),
          _button(Icons.forward_10_rounded, size: 34, onPressed: playerController.forward10Seconds),
        ],
      ),
    );
  }

  Widget _buttonSvg(String svg, {VoidCallback? onPressed, double size = 44}) {
    return GestureDetector(
        onTap: onPressed,
        child: SVGView(
          assetName: svg,
          color: AppThemeController.counterTextPrimaryColor(context),
          size: size,
        ));
  }

  Widget _button(IconData iconData, {VoidCallback? onPressed, double size = 44}) {
    return GestureDetector(
        onTap: onPressed,
        child: Icon(
          iconData,
          color: AppThemeController.counterTextPrimaryColor(context),
          size: size,
        ));
  }

  Widget _progressBar() {
    return Positioned(
      left: 24,
      bottom: 28,
      right: 46,
      child: Row(
        children: [
          // _button(Icons.replay_10_rounded, size: 32, onPressed: playerController.back10seconds),
          // const Width(16),
          // _button(Icons.forward_10_rounded, size: 32, onPressed: playerController.forward10Seconds),
          // const Width(30),
          Obx(() => _time(playerController.position.value.toSimpleString())),
          const Width(16),
          _seekBar(),
          const Width(16),
          Obx(() => _time(playerController.duration.value.toSimpleString())),
          const Width(30),
          _fullScreen()
        ],
      ),
    );
  }

  Widget _seekBar() {
    return Expanded(
      child: Obx(() => PlayerSeekBar(
            progress: playerController.positionMill,
            total: playerController.durationMill,
            barHeight: 5,
            baseBarColor: Colors.black26,
            progressBarColor: AppThemeController.primaryThemeColor(context),
            bufferedBarColor: AppThemeController.primaryThemeColor(context).withOpacity(.3),
            thumbColor: Colors.white,
            thumbRadius: 6,
            thumbGlowRadius: 10,
            insideThumbRadius: 3,
            insideThumbColor: AppThemeController.primaryThemeColor(context),
            timeLabelLocation: TimeLabelLocation.none,
            onSeek: (position) {
              playerController.seekTo(position);
            },
          )),
    );
  }

  Widget _fullScreen() {
    IconData iconData = playerController.isFullScreen.value ? Icons.fullscreen_exit_rounded : Icons.fullscreen_rounded;
    return GestureDetector(
      onTap: playerController.toggleFullScreen,
      child: Icon(
        iconData,
        size: 30,
        color: AppThemeController.counterTextPrimaryColor(context),
      ),
    );
  }

  Widget _time(String time) {
    return TextView.primary(
      time,
      fontSize: 13,
      color: AppThemeController.counterTextPrimaryColor(context),
    );
  }

  List<PopupMenuItem<String>> getQualityChildren() {
    final videoSources = resetVideoSources();
    List<PopupMenuItem<String>> menuItems = [];
    for (final videoSource in videoSources) {
      final item = PopupMenuItem(
          value: videoSource.label,
          child: TextView.primary(videoSource.label ?? 'none', color: Colors.white, fontSize: 16));
      menuItems.add(item);
    }
    return menuItems;
  }

  List<VideoSource> resetVideoSources() {
    final videoSources = playerController.nowPlayingMedia?.videoSources ?? [];
    List<VideoSource> sources = [];
    sources.addAll(videoSources);
    final sourcesReversed = sources.reversed.toList() ?? [];
    for (final videoSource in sourcesReversed) {
      final existVideoSource = sources.firstWhereOrNull((element) => element.label == videoSource.label);
      if (existVideoSource != null) continue;
      sources.add(videoSource);
    }
    return sources;
  }
}
