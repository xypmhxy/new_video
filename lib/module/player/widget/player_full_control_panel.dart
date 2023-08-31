/*
* 作者 Ren
* 时间  2023/7/26 07:39
*/

import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/resource/color_res.dart';
import 'package:free_tube_player/extension/duration_extension.dart';
import 'package:free_tube_player/module/player/controller/player_controller.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/player_seek_bar.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:get/get.dart';

class PlayerFullControlPanel extends StatefulWidget {
  final PlayerController playerController;
  final Duration? movePosition;
  final VoidCallback onBackPressed;

  const PlayerFullControlPanel(
      {super.key, required this.playerController, required this.onBackPressed, this.movePosition});

  @override
  State<PlayerFullControlPanel> createState() => _PlayerFullControlPanelState();
}

class _PlayerFullControlPanelState extends State<PlayerFullControlPanel> {
  late PlayerController playerController = widget.playerController;
  late Duration? movePosition = widget.movePosition;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Visibility(
        visible: playerController.isShowControlPanel.value,
        child: Stack(
          alignment: Alignment.center,
          children: [_backButton(), _playSpeed(),_movePositionWidget(), _playWidget(), _progressBar()],
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
        left: 20,
        top: 24,
        child: Row(
          children: [
            _button(Icons.arrow_back_rounded, onPressed: widget.onBackPressed, size: 28),
            const Width(12),
            TextView.primary(playerController.mediaInfo?.title ?? '',
                height: 1.1, color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)
          ],
        ));
  }

  Widget _playSpeed() {
    const textColor = Colors.white;
    return Positioned(
        top: 24,
        right: 48,
        child: Obx(() => DropdownButton(
            value: PlayerController.get.playSpeed.value,
            elevation: 0,
            isDense: true,
            underline: const SizedBox(),
            icon: const SizedBox(),
            dropdownColor: ColorRes.backgroundColor,
            items: const [
              DropdownMenuItem(value: 0.5, child: TextView.primary('0.5x', color: textColor, fontSize: 17)),
              DropdownMenuItem(value: 0.75, child: TextView.primary('0.75x', color: textColor, fontSize: 17)),
              DropdownMenuItem(value: 1.0, child: TextView.primary('1.0x', color: textColor, fontSize: 17)),
              DropdownMenuItem(value: 1.25, child: TextView.primary('1.25x', color: textColor, fontSize: 17)),
              DropdownMenuItem(value: 1.5, child: TextView.primary('1.5x', color: textColor, fontSize: 17)),
              DropdownMenuItem(value: 2.0, child: TextView.primary('2.0x', color: textColor, fontSize: 17))
            ],
            onChanged: (value) {
              PlayerController.get.setPlaySpeed(value ?? 1.0);
            })));
  }

  Widget _movePositionWidget() {
    return Positioned(
        top: 20,
        child: Obx(() => Visibility(
            visible: playerController.movePosition.value != null,
            child: TextView.primary(
              playerController.movePosition.value?.toSimpleString() ?? '',
              fontSize: 30,
              color: AppThemeController.counterTextPrimaryColor(context),
            ))));
  }

  Widget _playWidget() {
    return Center(
      child: Obx(() {
        final isPlaying = PlayerController.get.isPlaying;
        return _button(isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
            size: isPlaying ? 60 : 72, onPressed: playerController.clickPlay);
      }),
    );
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
      bottom: 16,
      left: 20,
      right: 20,
      child: Row(
        children: [
          _button(Icons.replay_10_rounded, size: 32, onPressed: playerController.back10seconds),
          const Width(16),
          _button(Icons.forward_10_rounded, size: 32, onPressed: playerController.forward10Seconds),
          const Width(30),
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
