/*
* 作者 Ren
* 时间  2023/12/17 10:50
*/

import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/app/resource/color_res.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_button.dart';
import 'package:free_tube_player/widget/image_view.dart';

import 'text_view.dart';

class HorizontalVideoListView extends StatelessWidget {
  final List<MediaInfo> mediaList;
  final ValueChanged<MediaInfo>? onItemClick;
  final ValueChanged<MediaInfo>? onItemMoreClick;

  const HorizontalVideoListView({
    super.key,
    required this.mediaList,
    this.onItemClick,
    this.onItemMoreClick,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 180,
        child: ListView.separated(
            padding: const EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final mediaInfo = mediaList[index];
              return GestureDetector(
                onTap: () {
                  onItemClick?.call(mediaInfo);
                },
                child: SizedBox(
                  width: 144,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _image(mediaInfo),
                      const Height(6),
                      _title(mediaInfo),
                      const Height(4),
                      _subTitle(mediaInfo)
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (_, index) {
              return const Width(12);
            },
            itemCount: mediaList.length));
  }

  Widget _image(MediaInfo mediaInfo) {
    return ClipRRect(
      borderRadius: getBorderRadius(12),
      child: Stack(
        children: [
          AutoImageView(
            width: 144,
            height: 108,
            imageUrl: mediaInfo.thumbnail,
            imageData: mediaInfo.localUint8List,
            fit: BoxFit.cover,
          ),
          Positioned(
              bottom: 4,
              right: 4,
              child: Container(
                decoration:
                    allRadiusDecoration(8, color: mediaInfo.isLive ? ColorRes.themeColor : ColorRes.backgroundColor),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: TextView.primary(mediaInfo.isLive ? S.current.live : mediaInfo.durationFormat,
                    color: Colors.white, fontSize: 12, fontWeight: FontWeight.normal),
              )),
          if (mediaInfo.isLive == false)
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.black38,
                  minHeight: 2,
                  value: mediaInfo.historyProgress!,
                ))
        ],
      ),
    );
  }

  Widget _title(MediaInfo mediaInfo) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: TextView.primary(
          mediaInfo.title,
          maxLines: 2,
          fontSize: 15,
          height: 1.4,
          overflow: TextOverflow.ellipsis,
          fontWeight: FontWeight.w600,
        )),
        ImageButton(
          onPressed: () {
            onItemMoreClick?.call(mediaInfo);
          },
          splashRadius: 20,
          child: const Icon(
            Icons.more_vert_rounded,
            size: 18,
          ),
        )
      ],
    );
  }

  Widget _subTitle(MediaInfo mediaInfo) {
    return TextView.accent(
      mediaInfo.author,
      maxLines: 1,
      fontSize: 12,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w600,
    );
  }
}
