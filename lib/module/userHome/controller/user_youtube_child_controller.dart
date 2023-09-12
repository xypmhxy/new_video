/*
* 作者 Ren
* 时间  2023/9/10 20:59
*/
import 'package:free_tube_player/api/youtube_home_api.dart';
import 'package:free_tube_player/bean/home/youtube_home_tab.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class UserYoutubeChildController {
  final _youtubeHomeApi = YoutubeHomeApi();
  final YoutubeHomeTab youtubeHomeTab;
  final mediaInfos = <MediaInfo>[].obs;
  final refreshController = RefreshController();
  String continuation = '';

  UserYoutubeChildController(this.youtubeHomeTab) {
    if (youtubeHomeTab.mediaInfos?.isNotEmpty ?? false) {
      mediaInfos.value = youtubeHomeTab.mediaInfos!;
    }
    if (youtubeHomeTab.continuation.isEmpty) {
      refreshController.loadNoData();
    }
  }

  void requestRefresh() {
    refreshController.requestRefresh();
  }

  Future<void> queryTabVideos() async {
    mediaInfos.value = await _youtubeHomeApi.requestHomeChildVideos(
        token: youtubeHomeTab.continuation,
        clickParams: youtubeHomeTab.clickParams,
        onContinuation: (continuation) {
          youtubeHomeTab.continuation = continuation ?? '';
        });
    refreshController.refreshCompleted(resetFooterState: true);
    if (youtubeHomeTab.continuation.isEmpty) {
      refreshController.loadNoData();
    }
  }

  Future<void> loadMoreVideos() async {
    final result = await _youtubeHomeApi.requestHomeChildVideos(
        token: youtubeHomeTab.continuation,
        clickParams: youtubeHomeTab.clickParams,
        onContinuation: (continuation) {
          youtubeHomeTab.continuation = continuation ?? '';
        });
    mediaInfos.addAll(result);
    refreshController.loadComplete();
    if (youtubeHomeTab.continuation.isEmpty) {
      refreshController.loadNoData();
    }
  }
}
