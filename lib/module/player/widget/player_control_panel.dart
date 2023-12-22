/*
* 作者 Ren
* 时间  2023/7/26 07:39
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/module/player/controller/player_controller.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:get/get.dart';
import 'package:free_tube_player/extension/duration_extension.dart';

import 'player_full_control_panel.dart';
import 'player_normal_control_panel.dart';

class PlayerControlPanel extends StatefulWidget {
  final PlayerController playerController;
  final VoidCallback onBackPressed;

  const PlayerControlPanel({super.key, required this.playerController, required this.onBackPressed});

  @override
  State<PlayerControlPanel> createState() => _PlayerControlPanelState();
}

class _PlayerControlPanelState extends State<PlayerControlPanel> {
  late PlayerController playerController = widget.playerController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: GestureDetector(
              onTap: () {
                playerController.togglePanel();
              },
              onDoubleTap: () {
                playerController.clickPlay();
              },
              onLongPress: () {
                vibrate();
                playerController.setPlaySpeed(2.0);
              },
              onLongPressUp: () {
                playerController.setPlaySpeed(1.0);
              },
              onHorizontalDragStart: (detail) {
                playerController.onMoveStart(detail.localPosition.dx);
              },
              onHorizontalDragUpdate: (detail) {
                playerController.onMove(detail.localPosition.dx);
              },
              onHorizontalDragEnd: (detail) {
                playerController.onMoveEnd();
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
                    ? PlayerFullControlPanel(
                        playerController: playerController,
                        onBackPressed: playerController.onBackPressed,
                      )
                    : PlayerNormalControlPanel(
                        playerController: playerController, onClickBack: playerController.onBackPressed)),
              ),
            ),
          ),
        ),
        _movePositionWidget(),
        _brightnessView()
      ],
    );
  }

  Widget _movePositionWidget() {
    return Positioned(
      top: playerController.isFullScreen.value ? 36 : 52,
      left: 0,
      right: 0,
      child: Align(
          alignment: Alignment.topCenter,
          child: Obx(
            () => Visibility(
              visible: playerController.movePosition.value != null,
              child: TextView.primary(
                playerController.movePosition.value?.toSimpleString() ?? '',
                fontSize: 30,
                color: AppThemeController.counterTextPrimaryColor(context),
              ),
            ),
          )),
    );
  }

  Widget _brightnessView() {
    return Positioned(
      top: playerController.isFullScreen.value ? 36 : 52,
      left: 0,
      right: 0,
      child: Align(
          alignment: Alignment.topCenter,
          child: Obx(
            () {
              return Visibility(
                visible: playerController.brightness.value != null,
                child: Container(
                  decoration: allRadiusDecoration(8, color: Colors.black38),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.brightness_6_rounded,
                        size: 20,
                        color: Colors.white,
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
              );
            },
          )),
    );
  }
}
