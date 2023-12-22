/*
* 作者 Ren
* 时间  2023/8/12 18:18
*/

import 'package:flutter/material.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/history/callback/history_page_callback.dart';
import 'package:free_tube_player/module/history/controller/history_page_controller.dart';
import 'package:free_tube_player/widget/base_page_view.dart';
import 'package:free_tube_player/widget/play_bottom_bar.dart';
import 'package:free_tube_player/widget/video_group_list_view.dart';
import 'package:get/get.dart';

class HistoryPageView extends BasePageView<HistoryPageCallback> {
  final HistoryPageController historyPageController;

  const HistoryPageView({super.key, required super.pageCallback, required this.historyPageController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(
          title: S.current.history,
          onPressed: () {
            pageCallback.onClickBack();
          },
          actions: []),
      body: Column(
        children: [
          Obx(() {
            historyPageController.videoGroupList.length;
            return Expanded(
                child: VideoGroupListView(
              controller: historyPageController,
              videoGroupList: historyPageController.videoGroupList,
              onClickAll: pageCallback.onClickAll,
              onItemClick: pageCallback.onItemClick,
              onItemMoreClick: pageCallback.onItemMoreClick,
            ));
          }),
          const PlayBottomBar()
        ],
      ),
    );
  }
}
