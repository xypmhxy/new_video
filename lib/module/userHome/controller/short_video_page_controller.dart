/*
* 作者 Ren
* 时间  2024/1/6 15:12
*/

import 'package:free_tube_player/api/short_video_api.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/utils/log_utils.dart';
import 'package:get/get.dart';

class ShortVideoPageController {
  final _shortVideoApi = ShortVideoApi();
  final shorVideos = <MediaInfo>[].obs;
  ContinueInfo? _continueInfo;

  Future<void> requestShortVideos() async {
    shorVideos.value = await _shortVideoApi.requestShortVideos(onContinueCallback: (continueInfo) {
      _continueInfo = continueInfo;
    });
  }

  Future<void> loadMoreShortVideos() async {
    if (_continueInfo?.continuationCommand == null || _continueInfo?.clickTrackingParams == null) return;
    final shorVideos = await _shortVideoApi.requestShortVideoSequence(
        continueInfo: _continueInfo,
        onContinueCallback: (continueInfo) {
          _continueInfo = continueInfo;
        });
    for (final video in shorVideos) {
      for (final video1 in this.shorVideos) {
        if (video.youtubeId == video1.youtubeId) {
          LogUtils.i('一样的视频 ${video.title} ${video.youtubeId}');
        }
      }
    }
    // LogUtils.i('加载更多短视频 ${shorVideos.length}');
    this.shorVideos.addAll(shorVideos);
  }
}
