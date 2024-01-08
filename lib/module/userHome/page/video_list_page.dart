/*
* 作者 Ren
* 时间  2023/12/18 22:10
*/

import 'package:flutter/material.dart';
import 'package:free_tube_player/ad/ad_utils.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/bean/play/playlist.dart';
import 'package:free_tube_player/module/player/controller/user_player_controller.dart';
import 'package:free_tube_player/module/userHome/controller/video_list_page_controller.dart';
import 'package:free_tube_player/utils/page_navigation.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_button.dart';
import 'package:free_tube_player/widget/play_bottom_bar.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:free_tube_player/widget/video_small_item.dart';
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
    ADUtils.instance.loadOtherAd();
    _controller.videos.value = widget.videos;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [_appbar(), const Height(12), _contentListView(), _playBottomBar()],
      )),
    );
  }

  Widget _playBottomBar() {
    return const Align(
      alignment: Alignment.bottomCenter,
      child: PlayBottomBar(),
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
                  return VideoSmallItem(
                    mediaInfo: mediaInfo,
                    onClickItem: () {
                      startUserPlayPage(mediaInfo: mediaInfo, from: 'video_list_page');
                    },
                    onClickMore: () {
                      _controller.showMoreDialog(mediaInfo, playlist: widget.playlist);
                    },
                  );
                },
                separatorBuilder: (_, index) {
                  return const Height(8);
                },
                itemCount: _controller.videos.length))));
  }
}
