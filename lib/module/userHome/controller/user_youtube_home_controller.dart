/*
* 作者 Ren
* 时间  2023/9/10 20:32
*/
import 'package:free_tube_player/api/youtube_home_api.dart';
import 'package:free_tube_player/base/base_controller.dart';
import 'package:free_tube_player/bean/home/youtube_home_tab.dart';
import 'package:free_tube_player/utils/log_utils.dart';
import 'package:get/get.dart';

class UserYoutubeHomeController extends BaseController {
  final _youtubeHomeApi = YoutubeHomeApi();
  final youtubeHomeTabs = <YoutubeHomeTab>[].obs;
  bool isAllowRetry = true;

  Future<void> requestTabs() async {
    setLoading();
    youtubeHomeTabs.value = await _youtubeHomeApi.requestTabs();
    if (youtubeHomeTabs.isEmpty) {
      if (isAllowRetry) {
        await Future.delayed(const Duration(seconds: 2));
        isAllowRetry = false;
        LogUtils.i('获取首页tab出错了准备重试');
        requestTabs();
        return;
      }
      setEmpty();
    } else {
      isAllowRetry = true;
      setSuccess();
    }
  }
}
