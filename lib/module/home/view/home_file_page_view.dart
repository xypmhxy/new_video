/*
* 作者 Ren
* 时间  2023/8/5 16:29
*/

import 'package:flutter/material.dart';
import 'package:free_tube_player/bean/play/video_group.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/home/callback/home_file_page_callback.dart';
import 'package:free_tube_player/module/home/controller/base_video_controller.dart';
import 'package:free_tube_player/widget/base_page_view.dart';
import 'package:free_tube_player/widget/loading_view.dart';
import 'package:free_tube_player/widget/no_data_view.dart';
import 'package:free_tube_player/widget/video_group_list_view.dart';
import 'package:get/get.dart';

class HomeFilePageView extends BasePageView<HomeFilePageCallback> {
  final BaseVideoController videoController;

  const HomeFilePageView({super.key, required this.videoController, required HomeFilePageCallback pageCallback})
      : super(pageCallback: pageCallback);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final length = videoController.videoGroupList.length;
      if (videoController.isLoading) {
        return Container(
            margin: const EdgeInsets.only(top: 144),
            alignment: Alignment.topCenter,
            child: const UnconstrainedBox(
              child: LoadingView(),
            ));
      } else if (videoController.hasPermission.isFalse) {
        return Container(
          margin: const EdgeInsets.only(top: 64),
          child: NoDataView(
            text: S.current.noPermissionGrant,
            button: S.current.toAuthorize,
            onClick: () {
              pageCallback.onClickToAuthorize();
            },
          ),
        );
      } else if (length == 0) {
        return Container(
          margin: const EdgeInsets.only(top: 64),
          child: NoDataView(
            text: S.current.noDataAndroid,
          ),
        );
      }
      return VideoGroupListView(
        controller: videoController,
        videoGroupList: videoController.videoGroupList,
        onItemClick: (mediaInfo) {
          pageCallback.onItemClick(mediaInfo);
        },
        onItemMoreClick: (mediaInfo, videoGroup) {
          pageCallback.onItemMoreClick(mediaInfo, videoGroup);
        },
        onClickAll: (VideoGroup videoGroup) {
          pageCallback.onClickAll(videoGroup);
        },
      );
    });
  }
}
