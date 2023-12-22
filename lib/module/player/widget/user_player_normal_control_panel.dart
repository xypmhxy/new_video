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
import 'package:free_tube_player/utils/x_screen.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_button.dart';
import 'package:free_tube_player/widget/player_seek_bar.dart';
import 'package:free_tube_player/widget/svg_view.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:get/get.dart';

class UserPlayerNormalControlPanel extends StatefulWidget {
  final UserPlayerController playerController;
  final Duration? movePosition;
  final VoidCallback? onBackPressed;

  const UserPlayerNormalControlPanel(
      {super.key, required this.playerController, this.movePosition, this.onBackPressed});

  @override
  State<UserPlayerNormalControlPanel> createState() => _PlayerNormalControlPanelState();
}

class _PlayerNormalControlPanelState extends State<UserPlayerNormalControlPanel> {
  late UserPlayerController playerController = widget.playerController;

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
        left: 20,
        top: XScreen.getStatusBarH(context) + 12,
        child: ImageButton(
            onPressed: () {
              widget.onBackPressed?.call();
            },
            child: Icon(
              Icons.arrow_back_rounded,
              color: AppThemeController.counterTextPrimaryColor(context),
            )));
  }

  Widget _topToolBar() {
    return Positioned(
        top: XScreen.getStatusBarH(context) + 12,
        right: 16,
        child: Row(
          children: [_qualityDropDown(), const Width(20), _playSpeed()],
        ));
  }

  Widget _playSpeed() {
    final textColor = AppThemeController.textPrimaryColor(context);
    return Obx(() => PopupMenuButton<double>(
          itemBuilder: (context) {
            return <PopupMenuItem<double>>[
              PopupMenuItem(value: 0.5, child: TextView.primary('0.5x', color: textColor, fontSize: 15)),
              PopupMenuItem(value: 0.75, child: TextView.primary('0.75x', color: textColor, fontSize: 15)),
              PopupMenuItem(value: 1.0, child: TextView.primary('1.0x', color: textColor, fontSize: 15)),
              PopupMenuItem(value: 1.25, child: TextView.primary('1.25x', color: textColor, fontSize: 15)),
              PopupMenuItem(value: 1.5, child: TextView.primary('1.5x', color: textColor, fontSize: 15)),
              PopupMenuItem(value: 2.0, child: TextView.primary('2.0x', color: textColor, fontSize: 15))
            ];
          },
          // color: ColorRes.backgroundColor,
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
                border: Border.all(color: ColorRes.textPrimaryColor, width: 2), borderRadius: getBorderRadius(8)),
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
                border: Border.all(color: ColorRes.textPrimaryColor, width: 2), borderRadius: getBorderRadius(8)),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
            child: TextView.primary(
              '${playerController.videoSource.value?.label}',
              color: ColorRes.textPrimaryColor,
              fontSize: 14,
            ),
          ),
        )));
  }

  Widget _playWidget() {
    return Center(
      child: SizedBox(
          width: screenWidth / 1.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _button(Icons.replay_10_rounded, size: 32, onPressed: playerController.back10seconds),
              const Width(28),
              Obx(
                () => _buttonSvg(playerController.isPlaying ? Assets.svgPause : Assets.svgPlay,
                    onPressed: playerController.togglePlay, size: playerController.isPlaying ? 35 : 38),
              ),
              const Width(28),
              _button(Icons.forward_10_rounded, size: 32, onPressed: playerController.forward10Seconds)
            ],
          )),
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
      bottom: XScreen.getBottomSafe(context) + 16,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Obx(() => _time(playerController.position.value.toSimpleString())),
          _seekBar(),
          Obx(() => _time(playerController.duration.value.toSimpleString())),
          _fullScreen()
        ],
      ),
    );
  }

  Widget _seekBar() {
    return SizedBox(
      width: screenWidth * .4,
      child: Obx(() => PlayerSeekBar(
            progress: playerController.positionMill,
            total: playerController.durationMill,
            barHeight: 4,
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
      fontSize: 11,
      color: AppThemeController.counterTextPrimaryColor(context),
    );
  }

  List<PopupMenuItem<String>> getQualityChildren() {
    final videoSources = resetVideoSources();
    List<PopupMenuItem<String>> menuItems = [];
    final textColor = AppThemeController.textPrimaryColor(context);
    for (final videoSource in videoSources) {
      final item = PopupMenuItem(
          value: videoSource.label,
          child: TextView.primary(videoSource.label ?? 'none', color: textColor, fontSize: 15));
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
