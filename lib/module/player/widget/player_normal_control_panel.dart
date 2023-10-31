/*
* 作者 Ren
* 时间  2023/7/26 07:39
*/

import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/extension/duration_extension.dart';
import 'package:free_tube_player/generated/assets.dart';
import 'package:free_tube_player/module/player/controller/player_controller.dart';
import 'package:free_tube_player/utils/x_screen.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_button.dart';
import 'package:free_tube_player/widget/player_seek_bar.dart';
import 'package:free_tube_player/widget/svg_view.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:get/get.dart';

class PlayerNormalControlPanel extends StatefulWidget {
  final PlayerController playerController;
  final Duration? movePosition;
  final VoidCallback? onClickBack;

  const PlayerNormalControlPanel({super.key, required this.playerController, this.movePosition, this.onClickBack});

  @override
  State<PlayerNormalControlPanel> createState() => _PlayerNormalControlPanelState();
}

class _PlayerNormalControlPanelState extends State<PlayerNormalControlPanel> {
  late PlayerController playerController = widget.playerController;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Visibility(
        visible: playerController.isShowControlPanel.value,
        child: Stack(
          alignment: Alignment.center,
          children: [_backButton(), _title(), _playSpeed(), _playWidget(), _progressBar()],
        )));
  }

  Widget _background() {
    return IgnorePointer(
        child: Container(
      color: Colors.black12,
    ));
  }

  Widget _backButton() {
    return Positioned(
        left: 0,
        top: XScreen.getStatusBarH(context) + 12,
        child: ImageButton(
            onPressed: () {
              widget.onClickBack?.call();
            },
            child: Icon(
              Icons.arrow_back_rounded,
              color: AppThemeController.counterTextPrimaryColor(context),
            )));
  }

  Widget _title() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(top: XScreen.getStatusBarH(context) + 15),
        child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: screenWidth / 2.5),
            child: TextView.primary(playerController.nowPlayMedia?.title ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                height: 1.1,
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500)),
      ),
    );
  }

  Widget _playSpeed() {
    return Positioned(top: XScreen.getStatusBarH(context) + 12, right: 0, child: _speedDropDown());
  }

  Widget _speedDropDown() {
    const textColor = Colors.white;
    return Obx(() => PopupMenuButton<double>(
          itemBuilder: (context) {
            return <PopupMenuItem<double>>[
              const PopupMenuItem(value: 0.5, child: TextView.primary('0.5x', color: textColor, fontSize: 17)),
              const PopupMenuItem(value: 0.75, child: TextView.primary('0.75x', color: textColor, fontSize: 17)),
              const PopupMenuItem(value: 1.0, child: TextView.primary('1.0x', color: textColor, fontSize: 17)),
              const PopupMenuItem(value: 1.25, child: TextView.primary('1.25x', color: textColor, fontSize: 17)),
              const PopupMenuItem(value: 1.5, child: TextView.primary('1.5x', color: textColor, fontSize: 17)),
              const PopupMenuItem(value: 2.0, child: TextView.primary('2.0x', color: textColor, fontSize: 17))
            ];
          },
          iconSize: 1,
          onCanceled: () {
            PlayerController.get.startDelayCloseControlPanel();
          },
          onOpened: () {
            PlayerController.get.showControlPanelLongTime();
          },
          onSelected: (value) {
            PlayerController.get.setPlaySpeed(value);
          },
          child: TextView.primary(
            '${PlayerController.get.playSpeed.value}',
            fontSize: 17,
          ),
        ));
  }

  Widget _movePositionWidget() {
    return Positioned(
        top: (screenHeight / 4) - 48,
        child: Obx(() => Visibility(
            visible: playerController.movePosition.value != null,
            child: TextView.primary(
              playerController.movePosition.value?.toSimpleString() ?? '',
              fontSize: 28,
              color: AppThemeController.counterTextPrimaryColor(context),
            ))));
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
                    onPressed: playerController.clickPlay, size: playerController.isPlaying ? 35 : 38),
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
      bottom: 0,
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
}
