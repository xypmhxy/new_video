import 'package:free_tube_player/api/play_api.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:get/get.dart';

class RecommendController {
  final _playApi = PlayApi();
  final recommendVideos = <MediaInfo>[].obs;
  final viewStatus = ViewStatus.none.obs;

  Future<void> requestRecommend(String youtubeId) async {
    viewStatus.value = ViewStatus.loading;
    final videos = await _playApi.requestRecommend(youtubeId: youtubeId);
    recommendVideos.clear();
    recommendVideos.addAll(videos);
    if (videos.isEmpty) {
      viewStatus.value = ViewStatus.empty;
    } else {
      viewStatus.value = ViewStatus.success;
    }
  }
}