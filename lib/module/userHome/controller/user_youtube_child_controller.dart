/*
* 作者 Ren
* 时间  2023/9/10 20:59
*/
import 'package:free_tube_player/bean/home/youtube_home_tab.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:get/get.dart';

class UserYoutubeChildController {
  final YoutubeHomeTab youtubeHomeTab;
  final mediaInfos = <MediaInfo>[].obs;

  UserYoutubeChildController(this.youtubeHomeTab) {
    if (youtubeHomeTab.mediaInfos?.isNotEmpty ?? false) {
      mediaInfos.value = youtubeHomeTab.mediaInfos!;
    }
  }

  Future<void> queryTabVideos({bool isForce = false}) async {
    if (isForce == false && mediaInfos.isNotEmpty) return;
  }
}
