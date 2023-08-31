/*
* 作者 Ren
* 时间  2023/8/7 20:43
*/
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/bean/play/video_group.dart';
import 'package:free_tube_player/extension/duration_extension.dart';
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
        padding: const EdgeInsets.all(20),
        itemBuilder: (_, index) {
          final mediaInfo = videoGroup.mediaInfoList[index];
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
                              child: ImageView.memory(
                                imageData: Uint8List.fromList(mediaInfo.localBytesThumbnail ?? []),
                                width: 144,
                                height: 86,
                              )),
                          Positioned(
                              bottom: 6,
                              left: 4,
                              child: TextView.primary(
                                Duration(milliseconds: mediaInfo.duration).toSimpleString(),
                                color: Colors.white,
                                fontSize: 11,
                              )),
                          Positioned(
                              top: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () {
                                  pageCallback.onItemMoreClick.call(videoGroup, mediaInfo);
                                },
                                child: const Padding(
                                    padding: EdgeInsets.all(6),
                                    child: Icon(
                                      Icons.more_vert_rounded,
                                      color: Colors.white,
                                      size: 16,
                                    )),
                              )),
                          if (mediaInfo.historyProgress != null && mediaInfo.historyProgress! > 0)
                            Positioned(
                                bottom: 3,
                                left: 4,
                                right: 4,
                                child: ClipRRect(
                                  borderRadius: getBorderRadius(2),
                                  child: LinearProgressIndicator(minHeight: 2, value: mediaInfo.historyProgress!),
                                ))
                        ],
                      ),
                      const Width(10),
                      SizedBox(
                        height: 86,
                        child: Wrap(
                          direction: Axis.vertical,
                          spacing: 6,
                          children: [
                            TextView.primary(
                              mediaInfo.title,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            TextView.primary(
                              '${mediaInfo.width} x ${mediaInfo.height}',
                              fontSize: 12,
                              color: AppThemeController.textPrimaryColor(context).withOpacity(.7),
                            ),
                            TextView.primary(
                              mediaInfo.formatSize(),
                              fontSize: 12,
                              color: AppThemeController.textPrimaryColor(context).withOpacity(.7),
                            ),
                            TextView.primary(
                              mediaInfo.createDateFormat,
                              fontSize: 12,
                              color: AppThemeController.textPrimaryColor(context).withOpacity(.7),
                            )
                          ],
                        ),
                      )
                    ],
                  )));
        },
        separatorBuilder: (_, index) {
          return const SizedBox(height: 12);
        },
        itemCount: videoGroup.mediaInfoList.length);
  }
}
