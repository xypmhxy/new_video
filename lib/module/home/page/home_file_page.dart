/*
* 作者 Ren
* 时间  2023/8/5 16:29
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/bean/play/video_group.dart';
import 'package:free_tube_player/helper/imp_more_action.dart';
import 'package:free_tube_player/module/home/callback/home_file_page_callback.dart';
import 'package:free_tube_player/module/home/controller/home_file_page_controller.dart';
import 'package:free_tube_player/module/home/page/home_detail_page.dart';
import 'package:free_tube_player/module/home/view/home_file_page_view.dart';
import 'package:free_tube_player/module/player/controller/player_controller.dart';
import 'package:free_tube_player/utils/page_navigation.dart';
import 'package:free_tube_player/utils/permission_utils.dart';

class HomeFilePage extends StatefulWidget {
  const HomeFilePage({super.key});

  @override
  State<HomeFilePage> createState() => _HomeFilePageState();
}

class _HomeFilePageState extends State<HomeFilePage>
    with WidgetsBindingObserver, AutomaticKeepAliveClientMixin
    implements HomeFilePageCallback {
  final _homeFilePageController = HomeFilePageController();
  final _impMoreAction = ImpMoreAction();

  @override
  void initState() {
    _homeFilePageController.checkPermission();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (isIOS){
      _homeFilePageController.checkPermission();
      PermissionUtils.requestIDFA();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return HomeFilePageView(
      pageCallback: this,
      homeFilePageController: _homeFilePageController,
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
          _homeFilePageController.delete(mediaInfo, videoGroup);
        },
        onRename: (newName) {
          _homeFilePageController.rename(mediaInfo, newName);
        },
        onHistoryDelete: () {
          _homeFilePageController.clearHistory(mediaInfo, videoGroup);
        });
  }

  @override
  void onClickAll(VideoGroup videoGroup) {
    PageNavigation.startNewPage(HomeDetailPage(videoGroup: videoGroup));
  }

  @override
  void onClickImport() {
    _homeFilePageController.openSetting();
  }
}
