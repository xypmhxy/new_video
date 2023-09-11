/*
* 作者 Ren
* 时间  2023/8/5 17:46
*/
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/bean/play/video_group.dart';
import 'package:free_tube_player/extension/duration_extension.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_view.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'text_view.dart';

class VideoGroupListView extends StatelessWidget {
  final List<VideoGroup> videoGroupList;
  final ValueChanged<MediaInfo>? onItemClick;
  final ValueChanged<VideoGroup>? onClickAll;
  final GetxController controller;
  final Function(MediaInfo mediaInfo, VideoGroup videoGroup)? onItemMoreClick;

  const VideoGroupListView(
      {super.key,
      required this.controller,
      required this.videoGroupList,
      this.onItemClick,
      this.onItemMoreClick,
      this.onClickAll});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemBuilder: (_, index) {
          return GetBuilder(
              id: videoGroupList[index].title,
              init: controller,
              builder: (_) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: GestureDetector(
                          onTap: () {
                            onClickAll?.call(videoGroupList[index]);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextView.primary(
                                videoGroupList[index].title,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              TextView.primary(
                                  '${S.current.paramsVideos(videoGroupList[index].mediaInfoList.length)} >',
                                  color: AppThemeController.textPrimaryColor(context).withOpacity(.75),
                                  fontSize: 13)
                            ],
                          )),
                    ),
                    const Height(8),
                    _childListView(videoGroupList[index].mediaInfoList, videoGroupList[index])
                  ],
                );
              });
        },
        separatorBuilder: (_, index) {
          return const Height(12);
        },
        itemCount: videoGroupList.length);
  }

  Widget _childListView(List<MediaInfo> mediaInfoList, VideoGroup videoGroup) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final mediaInfo = mediaInfoList[index];
            return GetBuilder<GetxController>(
                init: controller,
                id: mediaInfo.identify,
                builder: (_) {
                  final mediaInfo = mediaInfoList[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          onItemClick?.call(mediaInfo);
                        },
                        child: ClipRRect(
                            borderRadius: getBorderRadius(4),
                            child: Stack(
                              children: [
                                Hero(
                                    tag: mediaInfo.identify,
                                    child: ImageView.memory(
                                      imageData: Uint8List.fromList(mediaInfo.localBytesThumbnail ?? []),
                                      width: 144,
                                      height: 86,
                                    )),
                                Positioned(
                                    bottom: 6,
                                    left: 4,
                                    child: TextView.primary(
                                      mediaInfo.durationFormat,
                                      color: Colors.white,
                                      fontSize: 11,
                                    )),
                                Positioned(
                                    top: 0,
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        onItemMoreClick?.call(mediaInfo, videoGroup);
                                      },
                                      child: Container(
                                          color: Colors.transparent,
                                          padding: const EdgeInsets.all(8),
                                          child: const Icon(
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
                            )),
                      ),
                      const Height(4),
                      ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 144),
                          child: TextView.primary(
                            mediaInfo.title,
                            fontSize: 13,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ))
                    ],
                  );
                });
          },
          separatorBuilder: (_, index) {
            return const Width(12);
          },
          itemCount: mediaInfoList.length),
    );
  }
}
