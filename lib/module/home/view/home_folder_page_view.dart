/*
* 作者 Ren
* 时间  2023/8/5 16:29
*/

import 'package:flutter/material.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/bean/play/video_group.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/home/callback/home_file_page_callback.dart';
import 'package:free_tube_player/module/home/controller/home_folder_page_controller.dart';
import 'package:free_tube_player/widget/base_page_view.dart';
import 'package:free_tube_player/widget/no_data_view.dart';
import 'package:free_tube_player/widget/video_group_list_view.dart';
import 'package:get/get.dart';

class HomeFolderPageView extends BasePageView<HomeFilePageCallback> {
  final HomeFolderPageController homeFolderPageController;

  const HomeFolderPageView(
      {super.key, required this.homeFolderPageController, required HomeFilePageCallback pageCallback})
      : super(pageCallback: pageCallback);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final length = homeFolderPageController.videoGroupList.length;
      if (homeFolderPageController.isLoading) {
        return Container(
            margin: const EdgeInsets.only(top: 144),
            alignment: Alignment.topCenter,
            child: const UnconstrainedBox(
              child: SizedBox(width: 48, height: 48, child: CircularProgressIndicator()),
            ));
      } else if (homeFolderPageController.hasPermission.isFalse) {
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
        controller: homeFolderPageController,
        videoGroupList: homeFolderPageController.videoGroupList,
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
