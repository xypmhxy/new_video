import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/generated/assets.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:get/get.dart';

import 'svg_view.dart';

class PlayBottomBar extends StatefulWidget {
  const PlayBottomBar({Key? key}) : super(key: key);

  @override
  State<PlayBottomBar> createState() => _PlayBottomBarState();
}

class _PlayBottomBarState extends State<PlayBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Visibility(
        visible: userPlayerController.isPlayerAvailable.value,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_progress(), _info()],
        )));
  }

  Widget _progress() {
    return Obx(
      () => LinearProgressIndicator(
        value: userPlayerController.positionProgress,
        minHeight: 1,
      ),
    );
  }

  Widget _info() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(() {
          final isPlayerAvailable = userPlayerController.isPlayerAvailable.value;
          if (isPlayerAvailable == false) return const SizedBox();
          return IgnorePointer(
            child: SizedBox(
              width: 96,
              height: 56,
              child: Chewie(
                controller: userPlayerController.chewieController.copyWith(customControls: SizedBox()),
              ),
            ),
          );
        }),
        const Width(8),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(() => TextView.primary(
                  userPlayerController.nowPlayingMedia?.title ?? '- -',
                  fontSize: 14,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
            Height(8),
            Obx(() => TextView.accent(
                  userPlayerController.nowPlayingMedia?.author ?? '- -',
                  fontSize: 12,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
          ],
        )),
        const Width(16),
        GestureDetector(
          onTap: () {},
          child: Obx(
            () => SVGView(
              assetName: userPlayerController.isPlaying ? Assets.svgPause : Assets.svgPlay,
              size: 24,
            ),
          ),
        ),
        const Width(30)
      ],
    );
  }
}
