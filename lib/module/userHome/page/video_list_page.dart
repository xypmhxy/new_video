/*
* 作者 Ren
* 时间  2023/12/18 22:10
*/

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/extension/duration_extension.dart';
import 'package:free_tube_player/module/player/controller/user_player_controller.dart';
import 'package:free_tube_player/module/userHome/controller/video_list_page_controller.dart';
import 'package:free_tube_player/utils/page_navigation.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_button.dart';
import 'package:free_tube_player/widget/image_view.dart';
import 'package:free_tube_player/widget/text_view.dart';

class VideoListPage extends StatefulWidget {
  final String title;
  final List<MediaInfo> videos;

  const VideoListPage({super.key, required this.title, required this.videos});

  @override
  State<VideoListPage> createState() => _VideoListPageState();
}

class _VideoListPageState extends State<VideoListPage> {

  final _controller = VideoListPageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [_appbar(), const Height(12), _contentListView()],
      )),
    );
  }

  Widget _appbar() {
    return AppBar(
      leading: ImageButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            PageNavigation.back();
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            size: 24,
          )),
      title: TextView.primary(widget.title, fontWeight: FontWeight.bold, fontSize: 18),
    );
  }

  Widget _contentListView() {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.separated(
                itemBuilder: (_, index) {
                  final mediaInfo = widget.videos[index];
                  String resolution = '${mediaInfo.width} x ${mediaInfo.height}';
                  if (mediaInfo.isLocalVideo == false) {
                    resolution = '${mediaInfo.videoSources?.first.width} x ${mediaInfo.videoSources?.first.height}';
                  }
                  return GestureDetector(
                      onTap: () {
                        startUserPlayPage(mediaInfo: mediaInfo);
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
                                      bottom: 6,
                                      left: 4,
                                      child: TextView.primary(
                                        Duration(milliseconds: mediaInfo.duration).toSimpleString(),
                                        color: Colors.white,
                                        fontSize: 11,
                                      )),
                                  if (mediaInfo.historyProgress != null && mediaInfo.historyProgress! > 0)
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
                                            _controller.showMoreDialog(mediaInfo);
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
                  return const Height(8);
                },
                itemCount: widget.videos.length)));
  }
}
