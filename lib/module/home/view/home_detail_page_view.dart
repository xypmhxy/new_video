/*
* 作者 Ren
* 时间  2023/8/7 20:43
*/
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/app/resource/color_res.dart';
import 'package:free_tube_player/bean/play/video_group.dart';
import 'package:free_tube_player/extension/duration_extension.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/home/callback/home_detail_page_callback.dart';
import 'package:free_tube_player/widget/base_page_view.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_view.dart';
import 'package:free_tube_player/widget/text_view.dart';

class HomeDetailPageView extends BasePageView<HomeDetailPageCallback> {
  final VideoGroup videoGroup;

  const HomeDetailPageView({
    super.key,
    required super.pageCallback,
    required this.videoGroup,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(onPressed: pageCallback.onClickBack, title: videoGroup.title),
      body: _bodyListView(),
    );
  }

  Widget _bodyListView() {
    return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (_, index) {
          final mediaInfo = videoGroup.mediaInfoList[index];
          String resolution = '${mediaInfo.width} x ${mediaInfo.height}';
          if (mediaInfo.isLocalVideo == false) {
            resolution = '${mediaInfo.videoSources?.first.width} x ${mediaInfo.videoSources?.first.height}';
          }
          return GestureDetector(
              onTap: () {
                pageCallback.onItemClick.call(mediaInfo);
              },
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
                                  onTap: () {
                                    pageCallback.onItemMoreClick.call(videoGroup, mediaInfo);
                                  },
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
                              resolution,
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
        },
        separatorBuilder: (_, index) {
          return const SizedBox(height: 12);
        },
        itemCount: videoGroup.mediaInfoList.length);
  }
}
