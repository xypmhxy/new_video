/*
* 作者 Ren
* 时间  2023/9/29 17:21
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/app/resource/color_res.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_button.dart';
import 'package:free_tube_player/widget/image_view.dart';

import 'text_view.dart';

class VideoItemView extends StatelessWidget {
  final MediaInfo mediaInfo;

  const VideoItemView({super.key, required this.mediaInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
                borderRadius: getBorderRadius(16),
                child: ImageView.network(
                  imageUrl: mediaInfo.thumbnail ?? '',
                  height: screenWidth * 0.5,
                  width: screenWidth - 40,
                )),
            Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  decoration:
                      allRadiusDecoration(8, color: mediaInfo.isLive ? ColorRes.themeColor : ColorRes.backgroundColor),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextView.primary(mediaInfo.isLive ? S.current.live : mediaInfo.durationFormat,
                      color: Colors.white, fontSize: 12, fontWeight: FontWeight.normal),
                )),
            Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  decoration: allRadiusDecoration(8, color: ColorRes.backgroundColor),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextView.primary(mediaInfo.viewCountText ?? '',
                      fontSize: 12, color: Colors.white, fontWeight: FontWeight.normal),
                )),
          ],
        ),
        const Height(16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipOval(
              child: ImageView.network(
                imageUrl: mediaInfo.authorThumbnail ?? '',
                size: 48,
              ),
            ),
            const Width(12),
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView.primary(
                  mediaInfo.title,
                  fontSize: 16,
                  maxLines: 2,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
                const Height(4),
                TextView.accent('${mediaInfo.author}  ·  ${mediaInfo.publishedTime}', fontSize: 12)
              ],
            )),
            const Width(8),
            ImageButton(
                onPressed: () {},
                splashRadius: 20,
                child: const Icon(
                  Icons.more_vert_rounded,
                  size: 22,
                ))
          ],
        ),
      ],
    );
  }
}
