/*
* 作者 Ren
* 时间  2023/8/7 20:42
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/bean/play/video_group.dart';
import 'package:free_tube_player/helper/imp_more_action.dart';
import 'package:free_tube_player/helper/media_info_helper.dart';
import 'package:free_tube_player/helper/video_action_helper.dart';
import 'package:free_tube_player/module/home/callback/home_detail_page_callback.dart';
import 'package:free_tube_player/module/home/view/home_detail_page_view.dart';
import 'package:free_tube_player/module/player/controller/player_controller.dart';
import 'package:free_tube_player/module/player/controller/user_player_controller.dart';
import 'package:free_tube_player/utils/page_navigation.dart';

class HomeDetailPage extends StatefulWidget {
  final VideoGroup videoGroup;

  const HomeDetailPage({super.key, required this.videoGroup});

  @override
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> implements HomeDetailPageCallback, OnMediaInfoChangedListener {
  static const tag = 'HomeDetailPage';
  final _impMoreAction = ImpMoreAction();
  final _mediaInfoHelper = MediaInfoHelper.get;
  final _videoActionHelper = VideoActionHelper();

  @override
  void initState() {
    _mediaInfoHelper.addWatcher(this);
    super.initState();
  }

  @override
  void dispose() {
    _mediaInfoHelper.removeWatcher(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HomeDetailPageView(pageCallback: this, videoGroup: widget.videoGroup);
  }

  @override
  void onClickBack() {
    PageNavigation.back();
  }

  @override
  void onItemClick(MediaInfo mediaInfo) {
    if (mediaInfo.isLocalVideo) {
      playMediaInfo(mediaInfo: mediaInfo);
    } else {
      startUserPlayPage(mediaInfo: mediaInfo);
    }
  }

  @override
  void onItemMoreClick(VideoGroup videoGroup, MediaInfo mediaInfo) {
    if (mediaInfo.isLocalVideo) {
      _impMoreAction.showDialog(
          isShowHistory: true,
          videoGroup: videoGroup,
          mediaInfo: mediaInfo,
          onDelete: () {
            delete(mediaInfo, videoGroup);
          },
          onRename: (newName) {
            rename(mediaInfo, newName);
          },
          onHistoryDelete: () {
            delete(mediaInfo, videoGroup);
          });
    } else {
      _videoActionHelper.showActionDialog(
          mediaInfo: mediaInfo,
          isShowHistory: true,
          onDeleteHistory: () {
            delete(mediaInfo, videoGroup);
          });
    }
  }

  Future<void> rename(MediaInfo mediaInfo, String newName) async {
    setState(() {});
    _mediaInfoHelper.sendChangeEvent(MediaInfoChangeWatcher(mediaInfo: mediaInfo, type: DBChangeType.update, tag: tag));
  }

  Future<void> delete(MediaInfo mediaInfo, VideoGroup videoGroup) async {
    videoGroup.mediaInfoList.remove(mediaInfo);
    setState(() {});
    _mediaInfoHelper.sendChangeEvent(MediaInfoChangeWatcher(mediaInfo: mediaInfo, type: DBChangeType.delete, tag: tag));
  }

  @override
  void onMediaInfoChange(MediaInfoChangeWatcher mediaInfoChangeWatcher) {
    if (mediaInfoChangeWatcher.tag == tag) return;
    final dbType = mediaInfoChangeWatcher.type;
    final mediaInfo = mediaInfoChangeWatcher.mediaInfo;

    int mediaInfoIndex = 0;
    final videoGroup = widget.videoGroup;
    mediaInfoIndex = videoGroup.mediaInfoList.indexWhere((media) => media.isSame(mediaInfo));

    if (mediaInfoIndex == -1) {
      setState(() {});
      return;
    }
    if (dbType == DBChangeType.delete) {
      videoGroup.mediaInfoList.removeAt(mediaInfoIndex);
      setState(() {});
    } else if (dbType == DBChangeType.update) {
      videoGroup.mediaInfoList[mediaInfoIndex] = mediaInfo;
      setState(() {});
    }
  }
}
