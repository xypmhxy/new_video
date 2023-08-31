/*
* 作者 Ren
* 时间  2023/7/26 07:39
*/

import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/app/resource/color_res.dart';
import 'package:free_tube_player/extension/duration_extension.dart';
import 'package:free_tube_player/module/player/controller/player_controller.dart';
import 'package:free_tube_player/utils/x_screen.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_button.dart';
import 'package:free_tube_player/widget/player_seek_bar.dart';
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
          children: [_backButton(), _title(), _playSpeed(), _movePositionWidget(), _playWidget(), _progressBar()],
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
            child: TextView.primary(playerController.mediaInfo?.title ?? '',
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
    const textColor = Colors.white;
    return Positioned(
        top: XScreen.getStatusBarH(context) + 12,
        right: 20,
        child: Obx(() => DropdownButton(
            value: PlayerController.get.playSpeed.value,
            elevation: 0,
            isDense: true,
            itemHeight: null,
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
              _button(Icons.replay_10_rounded, size: 43, onPressed: playerController.back10seconds),
              const Width(28),
              Obx(
                () => _button(PlayerController.get.isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                    onPressed: playerController.clickPlay, size: PlayerController.get.isPlaying ? 48 : 54),
              ),
              const Width(28),
              _button(Icons.forward_10_rounded, size: 43, onPressed: playerController.forward10Seconds)
            ],
          )),
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
}
