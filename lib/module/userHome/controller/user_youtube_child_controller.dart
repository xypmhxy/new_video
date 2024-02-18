/*
* 作者 Ren
* 时间  2023/9/10 20:59
*/
import 'package:free_tube_player/api/youtube_home_api.dart';
import 'package:free_tube_player/base/base_controller.dart';
import 'package:free_tube_player/bean/home/youtube_home_tab.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/helper/video_action_helper.dart';
import 'package:free_tube_player/utils/date_utils.dart';
import 'package:free_tube_player/utils/dialog_utils.dart';
import 'package:free_tube_player/utils/log_utils.dart';
import 'package:free_tube_player/utils/sp_utils.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class UserYoutubeChildController extends BaseController {
  final _youtubeHomeApi = YoutubeHomeApi();
  final YoutubeHomeTab youtubeHomeTab;
  final mediaInfos = <MediaInfo>[].obs;
  final refreshController = RefreshController();
  final _videoActionHelper = VideoActionHelper();
  String continuation = '';
  bool isAllowRetry = true;

  UserYoutubeChildController(this.youtubeHomeTab) {
    // if (youtubeHomeTab.mediaInfos?.isNotEmpty ?? false) {
    //   mediaInfos.value = youtubeHomeTab.mediaInfos!;
    // }
    if (youtubeHomeTab.continuation.isEmpty) {
      refreshController.loadNoData();
    }
  }

  void requestRefresh() {
    refreshController.requestRefresh();
  }

  ///校验是否需要重新请求All tab的数据
  void checkTabAllMediaInfoList() {
    final allContinuation = getAllContinuation();
    final allContinuationGetDate = getAllContinuationDate();
    final nowDate = DateTime.now().millisecondsSinceEpoch;
    final intervalDate = nowDate - allContinuationGetDate;
    if (allContinuation?.isNotEmpty == true && intervalDate <= 48 * DateUtil.HOUR) {
      youtubeHomeTab.continuation = allContinuation!;
      youtubeHomeTab.mediaInfos?.clear();
      refreshController.requestRefresh();
    } else {
      mediaInfos.value = youtubeHomeTab.mediaInfos ?? [];
      setAllContinuation(youtubeHomeTab.continuation);
    }
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
          setAllContinuation(youtubeHomeTab.continuation);
        });
    if (mediaInfos.isEmpty) {
      if (isAllowRetry) {
        isAllowRetry = false;
        LogUtils.i('获取首页信息失败重试开始');
        queryTabVideos();
        return;
      }
      setEmpty();
    } else {
      isAllowRetry = true;
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
    _videoActionHelper.showActionDialog(mediaInfo: mediaInfo, from: 'youtube_home');
  }

  static Future<void> setAllContinuation(String? continuation) async {
    if (continuation == null) {
      await SPUtils.removeForKey('key_all_continuation');
      setAllContinuationDate(nowDate: 0);
    } else {
      await SPUtils.setString('key_all_continuation', continuation);
      setAllContinuationDate();
    }
  }

  String? getAllContinuation() {
    return SPUtils.getString('key_all_continuation');
  }

  static Future<void> setAllContinuationDate({int? nowDate}) async {
    final date = nowDate ?? DateTime.now().millisecondsSinceEpoch;
    SPUtils.setInt('key_all_continuation_date', date);
  }

  int getAllContinuationDate() {
    return SPUtils.getInt('key_all_continuation_date');
  }
}
