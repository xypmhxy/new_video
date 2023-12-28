/*
* 作者 Ren
* 时间  2023/12/18 22:10
*/

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/app/resource/color_res.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/bean/play/playlist.dart';
import 'package:free_tube_player/generated/assets.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/player/controller/user_player_controller.dart';
import 'package:free_tube_player/module/userHome/controller/video_list_page_controller.dart';
import 'package:free_tube_player/utils/page_navigation.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_button.dart';
import 'package:free_tube_player/widget/image_view.dart';
import 'package:free_tube_player/widget/svg_view.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:get/get.dart';

class VideoListPage extends StatefulWidget {
  final String title;
  final List<MediaInfo> videos;
  final Playlist? playlist;

  const VideoListPage({super.key, required this.title, required this.videos, this.playlist});

  @override
  State<VideoListPage> createState() => _VideoListPageState();
}

class _VideoListPageState extends State<VideoListPage> {
  final _controller = VideoListPageController();

  @override
  void initState() {
    _controller.videos.value = widget.videos;
    super.initState();
  }

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
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 16),
          child: ImageButton(
            onPressed: () {
              _controller.onClickDeleteAll(playlist: widget.playlist);
            },
            child: Icon(
              Icons.delete_forever_rounded,
              color: AppThemeController.textPrimaryColor(context),
            ),
          ),
        )
      ],
    );
  }

  Widget _contentListView() {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Obx(() => ListView.separated(
                itemBuilder: (_, index) {
                  final mediaInfo = _controller.videos[index];
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
                                      bottom: 4,
                                      right: 4,
                                      child: Container(
                                        decoration: allRadiusDecoration(8,
                                            color: mediaInfo.isLive ? ColorRes.themeColor : ColorRes.backgroundColor),
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                        child: TextView.primary(
                                            mediaInfo.isLive ? S.current.live : mediaInfo.durationFormat,
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal),
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
                                            _controller.showMoreDialog(mediaInfo, playlist: widget.playlist);
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
                },
                separatorBuilder: (_, index) {
                  return const Height(8);
                },
                itemCount: _controller.videos.length))));
  }
}
