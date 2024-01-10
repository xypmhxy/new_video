/*
* 作者 Ren
* 时间  2024/1/6 15:12
*/

import 'package:free_tube_player/api/short_video_api.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/module/short/controller/short_video_item_controller.dart';
import 'package:free_tube_player/utils/log_utils.dart';
import 'package:free_tube_player/utils/sp_utils.dart';
import 'package:get/get.dart';

class ShortVideoPageController {
  final _shortVideoApi = ShortVideoApi();
  final _repeatMap = <String, String>{};
  final viewStatus = ViewStatus.none.obs;
  final shortVideoItemControllers = <ShortVideoItemController>[].obs;
  ShortVideoItemController? _curPlayingItemController;
  ContinueInfo? _continueInfo;

  Future<void> requestShortVideos() async {
    viewStatus.value = ViewStatus.loading;
    final shortVideos = await _shortVideoApi.requestShortVideos(
        continueInfo: _getCacheContinueInfo(),
        onContinueCallback: (continueInfo) {
          _continueInfo = continueInfo;
          _cacheContinue(continueInfo);
        });
    final shorItemControllers = <ShortVideoItemController>[];
    for (final mediaInfo in shortVideos) {
      final shortItemController = ShortVideoItemController(mediaInfo);
      shorItemControllers.add(shortItemController);
    }
    shortVideoItemControllers.value = shorItemControllers;
    viewStatus.value = shortVideos.isEmpty ? ViewStatus.empty : ViewStatus.success;
  }

  Future<void> loadMoreShortVideos() async {
    if (_continueInfo?.continuationCommand == null || _continueInfo?.clickTrackingParams == null) return;
    final shortVideos = await _shortVideoApi.requestShortVideoSequence(
        continueInfo: _continueInfo,
        onContinueCallback: (continueInfo) {
          _continueInfo = continueInfo;
          _cacheContinue(continueInfo);
        });
    shortVideos.removeWhere((element) => _repeatMap.containsKey(element.identify));
    for (final mediaInfo in shortVideos) {
      _repeatMap[mediaInfo.identify] = mediaInfo.identify;
      final shortItemController = ShortVideoItemController(mediaInfo);
      shortVideoItemControllers.add(shortItemController);
    }
  }

  void _cacheContinue(ContinueInfo continueInfo) {
    SPUtils.setString('cache_short_video_continue', continueInfo.continuationCommand ?? '');
    SPUtils.setString('cache_short_video_click_track', continueInfo.clickTrackingParams ?? '');
  }

  ContinueInfo? _getCacheContinueInfo() {
    final continueComm = SPUtils.getString('cache_short_video_continue') ?? '';
    final clickTrack = SPUtils.getString('cache_short_video_click_track') ?? '';
    if (continueComm.isEmpty || clickTrack.isEmpty) return null;
    return ContinueInfo()
      ..continuationCommand = continueComm
      ..clickTrackingParams = clickTrack;
  }

  ///操作类
  void onPageChanged(int index) {
    if (index == shortVideoItemControllers.length - 2) {
      loadMoreShortVideos();
    }
    _curPlayingItemController?.dispose();
    final preIndex = index - 1;
    if (preIndex >= 0 && preIndex <= shortVideoItemControllers.length - 1) {
      final preItemController = shortVideoItemControllers[preIndex];
      preItemController.preload();
    }

    final curItemController = shortVideoItemControllers[index];
    curItemController.loadAndPlay();
    _curPlayingItemController = curItemController;

    final nextIndex = index + 1;
    if (nextIndex >= 0 && nextIndex <= shortVideoItemControllers.length - 1) {
      final curItemController = shortVideoItemControllers[nextIndex];
      curItemController.preload();
    }
  }
}
