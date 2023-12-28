/*
* 作者 Ren
* 时间  2023/8/7 20:43
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/bean/play/video_group.dart';
import 'package:free_tube_player/module/home/callback/home_detail_page_callback.dart';
import 'package:free_tube_player/widget/base_page_view.dart';
import 'package:free_tube_player/widget/video_small_item.dart';

class HomeDetailPageView extends BasePageView<HomeDetailPageCallback> {
  final VideoGroup videoGroup;

  const HomeDetailPageView({
    super.key,
    required super.pageCallback,
    required this.videoGroup,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(onPressed: pageCallback.onClickBack, title: videoGroup.title),
      body: _bodyListView(),
    );
  }

  Widget _bodyListView() {
    return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (_, index) {
          final mediaInfo = videoGroup.mediaInfoList[index];
          return VideoSmallItem(
            mediaInfo: mediaInfo,
            onClickItem: () {
              pageCallback.onItemClick.call(mediaInfo);
            },
            onClickMore: () {
              pageCallback.onItemMoreClick.call(videoGroup, mediaInfo);
            },
          );
        },
        separatorBuilder: (_, index) {
          return const SizedBox(height: 12);
        },
        itemCount: videoGroup.mediaInfoList.length);
  }
}
