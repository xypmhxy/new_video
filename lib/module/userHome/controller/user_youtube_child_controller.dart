/*
* 作者 Ren
* 时间  2023/9/10 20:59
*/
import 'package:free_tube_player/api/youtube_home_api.dart';
import 'package:free_tube_player/bean/home/youtube_home_tab.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:get/get.dart';

class UserYoutubeChildController {
  final _youtubeHomeApi = YoutubeHomeApi();
  final YoutubeHomeTab youtubeHomeTab;
  final mediaInfos = <MediaInfo>[].obs;

  UserYoutubeChildController(this.youtubeHomeTab) {
    if (youtubeHomeTab.mediaInfos?.isNotEmpty ?? false) {
      mediaInfos.value = youtubeHomeTab.mediaInfos!;
    }
  }

  Future<void> queryTabVideos({bool isAll = false}) async {
    if (isAll && mediaInfos.isNotEmpty) return;
    mediaInfos.value = await _youtubeHomeApi.requestHomeChildVideos(
        token: youtubeHomeTab.token, clickParams: youtubeHomeTab.clickParams);
  }
}
