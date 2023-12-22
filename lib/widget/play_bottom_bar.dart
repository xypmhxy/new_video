/*
* 作者 Ren
* 时间  2023/12/10 13:25
*/

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/generated/assets.dart';
import 'package:free_tube_player/module/player/controller/user_player_controller.dart';
import 'package:free_tube_player/module/player/page/user_player_page.dart';
import 'package:free_tube_player/utils/page_navigation.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_view.dart';
import 'package:free_tube_player/widget/loading_view.dart';
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
        visible: userPlayerController.nowPlayingMedia != null,
        child: GestureDetector(
            onTap: () {
              PageNavigation.startNewPage(const UserPlayerPage());
            },
            child: Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [const Height(2),_progress(), _info()],
                )))));
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
          if (userPlayerController.isPlayerLoading || userPlayerController.isPlayerNone) {
            return GestureDetector(
                onTap: () {
                  PageNavigation.startNewPage(const UserPlayerPage());
                },
                child: _placeHolder());
          }
          return GestureDetector(
            onTap: () {
              PageNavigation.startNewPage(const UserPlayerPage());
            },
            child: SizedBox(
              width: 96,
              height: 56,
              child: Chewie(
                controller: userPlayerController.chewieController.copyWith(customControls: const SizedBox()),
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
            const Height(8),
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
          onTap: () {
            userPlayerController.togglePlay();
          },
          child: Obx(
            () => SVGView(
              assetName: userPlayerController.isPlaying ? Assets.svgPause : Assets.svgPlay,
              size: 24,
              color: AppThemeController.textPrimaryColor(context),
            ),
          ),
        ),
        const Width(30)
      ],
    );
  }

  Widget _placeHolder() {
    return SizedBox(
      width: 96,
      height: 56,
      child: Stack(
        children: [
          ImageView.network(
            imageUrl: userPlayerController.nowPlayingMedia?.thumbnail ?? '',
            width: 96,
            height: 56,
          ),
          const Center(
            child: LoadingView(
              size: 28,
            ),
          )
        ],
      ),
    );
  }
}
