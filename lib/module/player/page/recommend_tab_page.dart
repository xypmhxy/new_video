/*
* 作者 Ren
* 时间  2023/9/29 16:50
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/player/controller/recommend_controller.dart';
import 'package:free_tube_player/module/player/controller/user_player_controller.dart';
import 'package:free_tube_player/module/player/controller/user_player_page_controller.dart';
import 'package:free_tube_player/utils/page_navigation.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/loading_view.dart';
import 'package:free_tube_player/widget/no_data_view.dart';
import 'package:free_tube_player/widget/search_item.dart';
import 'package:free_tube_player/widget/video_item_view.dart';
import 'package:get/get.dart';

class RecommendTabPage extends StatefulWidget {
  const RecommendTabPage({super.key});

  @override
  State<RecommendTabPage> createState() => _RecommendTabPageState();
}

class _RecommendTabPageState extends State<RecommendTabPage> with AutomaticKeepAliveClientMixin {
  final _recommendController = RecommendController();

  @override
  void initState() {
    _recommendController.requestRecommend(userPlayerController.nowPlayingMedia?.youtubeId ?? '');
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Obx(() {
      if (_recommendController.viewStatus.value == ViewStatus.loading) {
        return const Center(
          child: LoadingView(
            size: 40,
          ),
        );
      } else if (_recommendController.viewStatus.value == ViewStatus.empty) {
        return GestureDetector(
            onTap: () {
              _recommendController.requestRecommend(userPlayerController.nowPlayingMedia?.youtubeId ?? '');
            },
            child: NoDataView(
              text: S.current.noDataClickRetry,
              iconSize: 164,
            ));
      }
      return ListView.separated(
        itemCount: _recommendController.recommendVideos.length,
        itemBuilder: (_, index) {
          final mediaInfo = _recommendController.recommendVideos[index];
          return GestureDetector(
              onTap: () {
                startUserPlayPage(mediaInfo: mediaInfo, isCloseCurrent: true,context: context, from: 'recomment');
              },
              child: SearchItem(
                mediaInfo: mediaInfo,
                onClickMore: () {
                  _recommendController.showMoreAction(mediaInfo);
                },
              ));
        },
        separatorBuilder: (_, index) {
          return const Height(20);
        },
      );
    });
  }
}
