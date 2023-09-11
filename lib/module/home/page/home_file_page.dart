/*
* 作者 Ren
* 时间  2023/8/5 16:29
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/bean/play/video_group.dart';
import 'package:free_tube_player/helper/imp_more_action.dart';
import 'package:free_tube_player/module/home/callback/home_file_page_callback.dart';
import 'package:free_tube_player/module/home/controller/base_video_controller.dart';
import 'package:free_tube_player/module/home/page/home_detail_page.dart';
import 'package:free_tube_player/module/home/view/home_file_page_view.dart';
import 'package:free_tube_player/module/player/controller/player_controller.dart';
import 'package:free_tube_player/utils/page_navigation.dart';

class HomeFilePage extends StatefulWidget {
  final BaseVideoController videoController;

  const HomeFilePage({super.key, required this.videoController});

  @override
  State<HomeFilePage> createState() => _HomeFilePageState();
}

class _HomeFilePageState extends State<HomeFilePage>
    with AutomaticKeepAliveClientMixin
    implements HomeFilePageCallback {
  final _impMoreAction = ImpMoreAction();

  @override
  void initState() {
    widget.videoController.checkPermission();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return HomeFilePageView(
      pageCallback: this,
      videoController: widget.videoController,
    );
  }

  @override
  void onItemClick(MediaInfo mediaInfo) {
    playMediaInfo(mediaInfo: mediaInfo);
  }

  @override
  void onItemMoreClick(MediaInfo mediaInfo, VideoGroup videoGroup) {
    _impMoreAction.showDialog(
        videoGroup: videoGroup,
        mediaInfo: mediaInfo,
        onDelete: () {
          widget.videoController.delete(mediaInfo, videoGroup);
        },
        onRename: (newName) {
          widget.videoController.rename(mediaInfo, newName);
        },
        onHistoryDelete: () {
          widget.videoController.clearHistory(mediaInfo, videoGroup);
        });
  }

  @override
  void onClickAll(VideoGroup videoGroup) {
    PageNavigation.startNewPage(HomeDetailPage(videoGroup: videoGroup));
  }

  @override
  void onClickToAuthorize() {
    widget.videoController.openSetting();
  }
}
