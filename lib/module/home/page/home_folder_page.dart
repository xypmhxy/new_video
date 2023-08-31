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
import 'package:free_tube_player/module/home/controller/home_folder_page_controller.dart';
import 'package:free_tube_player/module/home/page/home_detail_page.dart';
import 'package:free_tube_player/module/home/view/home_folder_page_view.dart';
import 'package:free_tube_player/module/player/controller/player_controller.dart';
import 'package:free_tube_player/utils/page_navigation.dart';

class HomeFolderPage extends StatefulWidget {
  const HomeFolderPage({super.key});

  @override
  State<HomeFolderPage> createState() => _HomeFolderPageState();
}

class _HomeFolderPageState extends State<HomeFolderPage>
    with WidgetsBindingObserver, AutomaticKeepAliveClientMixin
    implements HomeFilePageCallback {
  final _homeFolderPageController = HomeFolderPageController();
  final _impMoreAction = ImpMoreAction();

  @override
  void initState() {
    _homeFolderPageController.checkPermission();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (isIOS) _homeFolderPageController.checkPermission();
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return HomeFolderPageView(
      pageCallback: this,
      homeFolderPageController: _homeFolderPageController,
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
          _homeFolderPageController.delete(mediaInfo, videoGroup);
        },
        onRename: (newName) {
          _homeFolderPageController.rename(mediaInfo, newName);
        },
        onHistoryDelete: () {
          _homeFolderPageController.clearHistory(mediaInfo, videoGroup);
        });
  }

  @override
  void onClickAll(VideoGroup videoGroup) {
    PageNavigation.startNewPage(HomeDetailPage(videoGroup: videoGroup));
  }

  @override
  void onClickImport() {
    _homeFolderPageController.openSetting();
  }
}
