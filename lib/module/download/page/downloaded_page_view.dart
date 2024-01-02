import 'package:flutter/material.dart';
import 'package:free_tube_player/module/download/controller/downloaded_page_controller.dart';
import 'package:free_tube_player/module/player/controller/user_player_controller.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/video_small_item.dart';
import 'package:get/get.dart';

class DownloadedPageView extends StatefulWidget {
  const DownloadedPageView({super.key});

  @override
  State<DownloadedPageView> createState() => _DownloadedPageViewState();
}

class _DownloadedPageViewState extends State<DownloadedPageView> with AutomaticKeepAliveClientMixin {
  final _controller = DownloadedPageController();

  @override
  void initState() {
    _controller.queryDownloadCompleteVideos();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Obx(() => ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemBuilder: (_, index) {
          final mediaInfo = _controller.downloadedList[index];
          return VideoSmallItem(
            mediaInfo: mediaInfo,
            onClickItem: () {
              startUserPlayPage(mediaInfo: mediaInfo);
            },
            onClickMore: () {
              _controller.showMoreDialog(mediaInfo);
            },
          );
        },
        separatorBuilder: (_, index) {
          return const Height(12);
        },
        itemCount: _controller.downloadedList.length));
  }
}
