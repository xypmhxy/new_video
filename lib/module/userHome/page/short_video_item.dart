/*
* 作者 Ren
* 时间  2024/1/6 17:45
*/

import 'package:flutter/material.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/utils/log_utils.dart';
import 'package:free_tube_player/widget/image_view.dart';

class ShortVideoItem extends StatefulWidget {
  final MediaInfo mediaInfo;

  const ShortVideoItem({super.key, required this.mediaInfo});

  @override
  State<ShortVideoItem> createState() => _ShortVideoItemState();
}

class _ShortVideoItemState extends State<ShortVideoItem> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [Positioned.fill(child: AutoImageView(imageUrl: mediaInfo.thumbnail ?? ''))],
    );
  }

  MediaInfo get mediaInfo => widget.mediaInfo;
}
