/*
* 作者 Ren
* 时间  2023/9/10 20:32
*/
import 'package:free_tube_player/api/youtube_home_api.dart';
import 'package:free_tube_player/bean/home/youtube_home_tab.dart';
import 'package:get/get.dart';

class UserYoutubeHomeController {
  final _youtubeHomeApi = YoutubeHomeApi();
  final youtubeHomeTabs = <YoutubeHomeTab>[].obs;

  Future<void> requestTabs() async {
    youtubeHomeTabs.value = await _youtubeHomeApi.requestTabs();
    print('object');
  }
}
