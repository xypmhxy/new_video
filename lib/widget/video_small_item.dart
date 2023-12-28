import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/app/resource/color_res.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_view.dart';

import 'text_view.dart';

class VideoSmallItem extends StatelessWidget {
  final MediaInfo mediaInfo;
  final VoidCallback? onClickItem;
  final VoidCallback? onClickMore;

  const VideoSmallItem({Key? key, required this.mediaInfo, this.onClickItem, this.onClickMore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onClickItem,
        child: Container(
            color: Colors.transparent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: getBorderRadius(4),
                      child: AutoImageView(
                        width: 144,
                        height: 86,
                        imageUrl: mediaInfo.thumbnail,
                        imageData: Uint8List.fromList(mediaInfo.localBytesThumbnail ?? []),
                      ),
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
                ),
                const Width(10),
                Expanded(
                    child: SizedBox(
                  height: 86,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: TextView.primary(
                            mediaInfo.title,
                            fontSize: 14,
                            maxLines: 2,
                            fontWeight: FontWeight.w500,
                          )),
                          GestureDetector(
                            onTap: onClickMore,
                            child: Container(
                                color: Colors.transparent,
                                padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 8),
                                child: const Icon(
                                  Icons.more_vert_rounded,
                                  color: Colors.white,
                                  size: 16,
                                )),
                          )
                        ],
                      ),
                      TextView.primary(
                        mediaInfo.getResolutionFormat(),
                        fontSize: 12,
                        color: AppThemeController.textPrimaryColor(context).withOpacity(.7),
                      ),
                      const Height(4),
                      TextView.primary(
                        mediaInfo.isLocalVideo ? mediaInfo.formatSize() : mediaInfo.createDateFormat,
                        fontSize: 12,
                        color: AppThemeController.textPrimaryColor(context).withOpacity(.7),
                      ),
                    ],
                  ),
                ))
              ],
            )));
  }
}
