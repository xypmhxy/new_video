/*
* 作者 Ren
* 时间  2023/10/14 23:33
*/

import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/app/resource/color_res.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/download/bean/download_info.dart';
import 'package:free_tube_player/module/download/controller/global_download_controller.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_view.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import 'text_view.dart';

class SearchItem extends StatelessWidget {
  final MediaInfo mediaInfo;
  final VoidCallback? onClickMore;

  const SearchItem({super.key, required this.mediaInfo, this.onClickMore});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_thumbImage(), const Width(12), _info(context)],
    );
  }

  Widget _thumbImage() {
    return Stack(
      children: [
        Hero(
          tag: mediaInfo.identify,
          child: ClipRRect(
            borderRadius: getBorderRadius(8),
            child: ImageView.network(
              imageUrl: mediaInfo.thumbnail ?? '',
              height: screenWidth * 0.5 * .67,
              width: screenWidth * .5,
            ),
          ),
        ),
        Positioned(
            bottom: 4,
            right: 4,
            child: Container(
              decoration: allRadiusDecoration(6,
                  color: mediaInfo.duration == 0 ? ColorRes.themeColor : ColorRes.backgroundColor),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: TextView.primary(mediaInfo.duration == 0 ? S.current.live : mediaInfo.durationFormat,
                  color: Colors.white, fontSize: 10, fontWeight: FontWeight.normal),
            )),
        Positioned(
            bottom: 4,
            left: 4,
            child: Container(
              decoration: allRadiusDecoration(6, color: ColorRes.backgroundColor),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: TextView.primary(mediaInfo.viewCountText ?? '',
                  fontSize: 10, color: Colors.white, fontWeight: FontWeight.normal),
            )),
      ],
    );
  }

  Widget _info(BuildContext context) {
    return Expanded(
        child: SizedBox(
      height: screenWidth * 0.5 * .67,
      child: Column(
        children: [
          TextView.primary(
            mediaInfo.title,
            fontSize: 12,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          Expanded(
              child: Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextView.accent(
                      mediaInfo.author,
                      fontSize: 12,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    TextView.accent(
                      mediaInfo.publishedTime ?? '',
                      fontSize: 12,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                )),
                const Width(2),
                GestureDetector(
                    onTap: onClickMore,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      color: Colors.transparent,
                      child: Icon(
                        Icons.more_vert_rounded,
                        size: 20,
                        color: AppThemeController.textAccentColor(context),
                      ),
                    ))
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
