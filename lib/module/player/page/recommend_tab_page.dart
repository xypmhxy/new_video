/*
* 作者 Ren
* 时间  2023/9/29 16:50
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/player/controller/user_player_page_controller.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/loading_view.dart';
import 'package:free_tube_player/widget/no_data_view.dart';
import 'package:free_tube_player/widget/video_item_view.dart';
import 'package:get/get.dart';

class RecommendTabPage extends StatefulWidget {
  final UserPlayerPageController pageController;

  const RecommendTabPage({super.key, required this.pageController});

  @override
  State<RecommendTabPage> createState() => _RecommendTabPageState();
}

class _RecommendTabPageState extends State<RecommendTabPage> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    widget.pageController.requestRecommend(userPlayerController.nowPlayingMedia?.youtubeId ?? '');
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Obx(() {
      if (widget.pageController.recommendViewStatus.value == ViewStatus.loading) {
        return const Center(
          child: LoadingView(
            size: 40,
          ),
        );
      } else if (widget.pageController.recommendViewStatus.value == ViewStatus.empty) {
        return GestureDetector(
            onTap: () {
              widget.pageController.requestRecommend(userPlayerController.nowPlayingMedia?.youtubeId ?? '');
            },
            child: NoDataView(
              text: S.current.noDataClickRetry,
              iconSize: 164,
            ));
      }
      return ListView.separated(
        itemCount: widget.pageController.recommendVideos.length,
        itemBuilder: (_, index) {
          final mediaInfo = widget.pageController.recommendVideos[index];
          return VideoItemView(mediaInfo: mediaInfo);
        },
        separatorBuilder: (_, index) {
          return const Height(20);
        },
      );
    });
  }
}
