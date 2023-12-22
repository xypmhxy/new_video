/*
* 作者 Ren
* 时间  2023/7/26 07:39
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/extension/duration_extension.dart';
import 'package:free_tube_player/module/player/controller/user_player_controller.dart';
import 'package:free_tube_player/module/player/widget/user_player_full_control_panel.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:get/get.dart';

import 'user_player_normal_control_panel.dart';

class UserPlayerControlPanel extends StatefulWidget {
  final UserPlayerController playerController;
  final VoidCallback onBackPressed;

  const UserPlayerControlPanel({super.key, required this.playerController, required this.onBackPressed});

  @override
  State<UserPlayerControlPanel> createState() => _PlayerControlPanelState();
}

class _PlayerControlPanelState extends State<UserPlayerControlPanel> {
  late UserPlayerController playerController = widget.playerController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: GestureDetector(
                onTap: () {
                  playerController.togglePanel();
                },
                onDoubleTap: () {
                  playerController.togglePanel();
                },
                onLongPress: () {
                  vibrate();
                  playerController.setPlaybackSpeed(2.0);
                },
                onLongPressUp: () {
                  playerController.setPlaybackSpeed(1.0);
                },
                onHorizontalDragStart: (detail) {
                  playerController.onHorizontalDragStart(detail.localPosition.dx);
                },
                onHorizontalDragUpdate: (detail) {
                  playerController.onHorizontalDragUpdate(detail.primaryDelta ?? 0.0);
                },
                onHorizontalDragEnd: (detail) {
                  playerController.onHorizontalDragEnd();
                },
                onVerticalDragStart: (detail) {
                  playerController.onMoveVerticalStart(detail.globalPosition.dx, detail.localPosition.dy);
                },
                onVerticalDragUpdate: (detail) {
                  playerController.onMoveVerticalUpdate(detail.localPosition.dy);
                },
                onVerticalDragEnd: (_) {
                  playerController.onMoveVerticalEnd();
                },
                child: Container(
                  color: Colors.transparent,
                  child: Obx(() => playerController.isFullScreen.value
                      ? UserPlayerFullControlPanel(
                          playerController: playerController,
                          onBackPressed: playerController.onBackPressed,
                        )
                      : UserPlayerNormalControlPanel(
                          playerController: playerController, onBackPressed: playerController.onBackPressed)),
                ))),
        _dragPositionWidget(),
        _dragBrightnessWidget(),
      ],
    );
  }

  Widget _dragPositionWidget() {
    return Positioned(
        top: 52,
        left: 0,
        right: 0,
        child: Obx(() => Visibility(
            visible: playerController.dragPosition.value != null,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                decoration: allRadiusDecoration(8, color: Colors.black38),
                child: TextView.primary(
                  playerController.dragPosition.value?.toSimpleString() ?? '',
                  fontSize: 24,
                  color: AppThemeController.counterTextPrimaryColor(context),
                ),
              ),
            ))));
  }

  Widget _dragBrightnessWidget() {
    return Positioned(
        top: 52,
        left: 0,
        right: 0,
        child: Obx(() => Visibility(
            visible: playerController.brightness.value != null,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                decoration: allRadiusDecoration(8, color: Colors.black38),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.brightness_6_rounded,
                      size: 20,
                    ),
                    const Width(8),
                    SizedBox(
                      width: 120,
                      child: LinearProgressIndicator(
                        borderRadius: getBorderRadius(2),
                        minHeight: 2,
                        backgroundColor: Colors.white24,
                        color: Colors.white,
                        value: playerController.brightness.value,
                      ),
                    )
                  ],
                ),
              ),
            ))));
  }
}
