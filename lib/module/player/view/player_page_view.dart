/*
* 作者 Ren
* 时间  2023/7/25 21:14
*/
import 'dart:typed_data';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/app/resource/color_res.dart';
import 'package:free_tube_player/module/player/callback/player_page_callback.dart';
import 'package:free_tube_player/module/player/controller/player_controller.dart';
import 'package:free_tube_player/module/player/controller/player_page_controller.dart';
import 'package:free_tube_player/widget/base_page_view.dart';
import 'package:free_tube_player/widget/image_view.dart';
import 'package:get/get.dart';

class PlayerPageView extends BasePageView<PlayerPageCallback> {
  final PlayerController playerController;
  final PlayerPageController playerPageController;

  const PlayerPageView(
      {super.key,
      required PlayerPageCallback pageCallback,
      required this.playerController,
      required this.playerPageController})
      : super(pageCallback: pageCallback);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: ColorRes.backgroundColor,
          body: Column(
            children: [_playerWidget()],
          ),
        ),
        onWillPop: () async {
          playerController.onBackPressed();
          return false;
        });
  }

  Widget _playerWidget() {
    return Container(
      width: screenWidth,
      height: screenHeight,
      alignment: Alignment.center,
      child: Obx(() {
        if (playerController.playStatus.value == PlayStatus.loading ||
            playerController.playStatus.value == PlayStatus.none) {
          final ratio = playerController.nowPlayMedia?.getVideoRatio() ?? 1.78;
          return Stack(
            children: [
              Center(
                child: Hero(
                    tag: playerController.nowPlayMedia?.identify ?? '?',
                    child: AutoImageView(
                      imageData: Uint8List.fromList(playerController.nowPlayMedia?.localBytesThumbnail ?? []),
                      fit: BoxFit.cover,
                      width: screenWidth,
                      height: screenWidth / ratio,
                    )),
              ),
              const Center(
                child: SizedBox(
                  width: 48,
                  height: 48,
                  child: CircularProgressIndicator(),
                ),
              )
            ],
          );
        }
        return Chewie(
          controller: playerController.chewieController!,
        );
      }),
    );
  }
}
