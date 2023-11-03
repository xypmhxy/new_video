/*
* 作者 Ren
* 时间  2023/9/10 20:59
*/
import 'package:free_tube_player/api/youtube_home_api.dart';
import 'package:free_tube_player/base/base_controller.dart';
import 'package:free_tube_player/bean/home/youtube_home_tab.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/helper/video_action_helper.dart';
import 'package:free_tube_player/utils/dialog_utils.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class UserYoutubeChildController extends BaseController {
  final _youtubeHomeApi = YoutubeHomeApi();
  final YoutubeHomeTab youtubeHomeTab;
  final mediaInfos = <MediaInfo>[].obs;
  final refreshController = RefreshController();
  final _videoActionHelper = VideoActionHelper();
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
    if (youtubeHomeTab.continuation.isEmpty) {
      refreshController.refreshCompleted(resetFooterState: true);
      return;
    }
    mediaInfos.value = await _youtubeHomeApi.requestHomeChildVideos(
        token: youtubeHomeTab.continuation,
        clickParams: youtubeHomeTab.clickParams,
        onContinuation: (continuation) {
          youtubeHomeTab.continuation = continuation ?? '';
        });
    if (mediaInfos.isEmpty) {
      setEmpty();
    } else {
      setSuccess();
    }
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

  Future<void> showMoreActionDialog(MediaInfo mediaInfo) async {
    _videoActionHelper.showActionDialog(mediaInfo: mediaInfo);
  }
}
