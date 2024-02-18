/*
* 作者 Ren
* 时间  2023/9/10 20:51
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/bean/home/youtube_home_tab.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/player/controller/user_player_controller.dart';
import 'package:free_tube_player/module/userHome/controller/user_youtube_child_controller.dart';
import 'package:free_tube_player/utils/dialog_utils.dart';
import 'package:free_tube_player/utils/log_utils.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/no_data_view.dart';
import 'package:free_tube_player/widget/refresh_header.dart';
import 'package:free_tube_player/widget/video_item_view.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class UserYoutubeChildPage extends StatefulWidget {
  final YoutubeHomeTab youtubeHomeTab;

  const UserYoutubeChildPage({super.key, required this.youtubeHomeTab});

  @override
  State<UserYoutubeChildPage> createState() => _UserYoutubeChildPageState();
}

class _UserYoutubeChildPageState extends State<UserYoutubeChildPage> with AutomaticKeepAliveClientMixin {
  late UserYoutubeChildController youtubeController = UserYoutubeChildController(widget.youtubeHomeTab);

  @override
  void initState() {
    if (widget.youtubeHomeTab.isAll) {
      onBuildWidgetFinish(() {
        youtubeController.checkTabAllMediaInfoList();
      });
    } else if (widget.youtubeHomeTab.isAll == false && widget.youtubeHomeTab.isSearchRecommend == false) {
      onBuildWidgetFinish(() {
        youtubeController.requestRefresh();
      });
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant UserYoutubeChildPage oldWidget) {
    if (widget.youtubeHomeTab.mediaInfos?.first.identify == oldWidget.youtubeHomeTab.mediaInfos?.first.identify) return;
    youtubeController = UserYoutubeChildController(widget.youtubeHomeTab);
    youtubeController.viewStatus = ViewStatus.success;
    super.didUpdateWidget(oldWidget);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Obx(() {
      Widget child = const SizedBox();
      if (youtubeController.isEmpty) {
        child = SingleChildScrollView(child: NoDataView(text: S.current.noDataClickRetry));
      } else {
        child = ListView.separated(
            itemBuilder: (_, index) {
              final mediaInfo = youtubeController.mediaInfos[index];
              return GestureDetector(
                  onTap: () {
                    startUserPlayPage(mediaInfo: mediaInfo, from: 'youtube_home');
                  },
                  child: VideoItemView(
                    mediaInfo: mediaInfo,
                    onClickMore: () {
                      youtubeController.showMoreActionDialog(mediaInfo);
                    },
                  ));
            },
            separatorBuilder: (_, index) {
              return const Height(20);
            },
            itemCount: youtubeController.mediaInfos.length);
      }
      return SmartRefresher(
          controller: youtubeController.refreshController,
          enablePullDown: true,
          enablePullUp: true,
          scrollDirection: Axis.vertical,
          header: const RefreshHeaderView(margin: 12),
          onRefresh: () {
            youtubeController.queryTabVideos();
          },
          onLoading: () {
            youtubeController.loadMoreVideos();
          },
          child: child);
    });
  }
}
