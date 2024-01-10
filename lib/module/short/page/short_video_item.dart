/*
* 作者 Ren
* 时间  2024/1/6 17:45
*/

import 'package:flutter/material.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/module/player/controller/player_controller.dart';
import 'package:free_tube_player/module/short/controller/short_video_item_controller.dart';
import 'package:free_tube_player/widget/image_view.dart';
import 'package:free_tube_player/widget/loading_view.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:video_player/video_player.dart';

class ShortVideoItem extends StatefulWidget {
  final ShortVideoItemController shortVideoItemController;

  const ShortVideoItem({super.key, required this.shortVideoItemController});

  @override
  State<ShortVideoItem> createState() => _ShortVideoItemState();
}

class _ShortVideoItemState extends State<ShortVideoItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [_image(), _videoPlayer(), _title()],
    );
  }

  Widget _image() {
    return Positioned.fill(child: AutoImageView(imageUrl: mediaInfo.thumbnail ?? ''));
  }

  Widget _videoPlayer() {
    return Obx(() {
      final playStatus = controller.playStatus.value;
      if (playStatus == PlayStatus.none || playStatus == PlayStatus.loading) {
        return const Center(
          child: LoadingView(size: 38),
        );
      }
      return VideoPlayer(controller.videoPlayerController!);
    });
  }

  Widget _title() {
    return Visibility(
        child: Center(
          child: TextView.primary(controller.mediaInfo.title),
        ));
  }

  MediaInfo get mediaInfo => widget.shortVideoItemController.mediaInfo;

  ShortVideoItemController get controller => widget.shortVideoItemController;
}
