import 'package:flutter/material.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/app/resource/color_res.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_view.dart';

import 'text_view.dart';

class GridVideoItem extends StatelessWidget {
  final MediaInfo mediaInfo;
  final VoidCallback? onClickItem;
  final VoidCallback? onClickMore;
  final double? width;
  final double? height;

  const GridVideoItem({
    Key? key,
    required this.mediaInfo,
    this.width,
    this.height,
    this.onClickItem,
    this.onClickMore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onClickItem,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: getBorderRadius(8),
                child: Stack(
                  children: [
                    AutoImageView(
                      width: width ?? 144,
                      height: height ?? 86,
                      imageUrl: mediaInfo.thumbnail ?? '',
                    ),
                    Positioned(
                        bottom: 4,
                        right: 4,
                        child: Container(
                          decoration: allRadiusDecoration(8,
                              color: mediaInfo.isLive ? ColorRes.themeColor : ColorRes.backgroundColor),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: TextView.primary(mediaInfo.isLive ? S.current.live : mediaInfo.durationFormat,
                              color: Colors.white, fontSize: 12, fontWeight: FontWeight.normal),
                        )),
                    if (mediaInfo.isLive == false &&
                        mediaInfo.historyProgress != null &&
                        mediaInfo.historyProgress! > 0)
                      Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: ClipRRect(
                            borderRadius: getBorderRadius(2),
                            child: LinearProgressIndicator(
                              minHeight: 2,
                              value: mediaInfo.historyProgress!,
                              backgroundColor: Colors.black26,
                            ),
                          ))
                  ],
                )),
            const Height(4),
            SizedBox(
              width: width ?? 144,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: TextView.primary(
                    mediaInfo.title,
                    fontSize: 13,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )),
                  GestureDetector(
                    onTap: onClickMore,
                    child: Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.only(left: 4, right: 4, bottom: 8, top: 3),
                        child: const Icon(
                          Icons.more_vert_rounded,
                          color: Colors.white,
                          size: 16,
                        )),
                  )
                ],
              ),
            ),
            const Height(2),
            TextView.accent('${mediaInfo.viewCountText}  ·  ${mediaInfo.publishedTime}', fontSize: 11)
          ],
        ));
  }
}
