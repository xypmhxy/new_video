/*
* 作者 Ren
* 时间  2023/8/12 18:17
*/

import 'package:flutter/material.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/bean/play/video_group.dart';
import 'package:free_tube_player/dialog/dialog_user_more_action.dart';
import 'package:free_tube_player/helper/imp_more_action.dart';
import 'package:free_tube_player/helper/video_action_helper.dart';
import 'package:free_tube_player/module/history/callback/history_page_callback.dart';
import 'package:free_tube_player/module/history/controller/history_page_controller.dart';
import 'package:free_tube_player/module/history/view/history_page_view.dart';
import 'package:free_tube_player/module/home/page/home_detail_page.dart';
import 'package:free_tube_player/module/player/controller/player_controller.dart';
import 'package:free_tube_player/module/player/controller/user_player_controller.dart';
import 'package:free_tube_player/utils/page_navigation.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> implements HistoryPageCallback {
  final _historyPageController = HistoryPageController();
  final _impMoreAction = ImpMoreAction();
  final _videoActionHelper = VideoActionHelper();

  @override
  void didChangeDependencies() {
    if (TickerMode.of(context)) {
      _historyPageController.queryAllHistory();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return HistoryPageView(pageCallback: this, historyPageController: _historyPageController);
  }

  @override
  void onClickBack() {
    PageNavigation.back();
  }

  @override
  void onClickAll(VideoGroup videoGroup) {
    PageNavigation.startNewPage(HomeDetailPage(videoGroup: videoGroup));
  }

  @override
  void onItemClick(MediaInfo mediaInfo) {
    if (mediaInfo.isLocalVideo) {
      playMediaInfo(mediaInfo: mediaInfo);
    } else {
      startUserPlayPage(mediaInfo: mediaInfo, from: 'history');
    }
  }

  @override
  void onItemMoreClick(MediaInfo mediaInfo, VideoGroup videoGroup) {
    if (mediaInfo.isLocalVideo) {
      _impMoreAction.showDialog(
          isShowHistory: true,
          videoGroup: videoGroup,
          mediaInfo: mediaInfo,
          onDelete: () {
            _historyPageController.delete(mediaInfo, videoGroup);
          },
          onRename: (newName) {
            _historyPageController.rename(mediaInfo, newName);
          },
          onHistoryDelete: () {
            _historyPageController.deleteHistory(mediaInfo, videoGroup);
          });
    } else {
      _videoActionHelper.showActionDialog(
          mediaInfo: mediaInfo,
          from: 'history',
          isShowHistory: true,
          onDeleteHistory: () {
            _historyPageController.deleteHistory(mediaInfo, videoGroup);
          });
    }
  }

  @override
  void onClickToAuthorize() {}
}
