/*
* 作者 Ren
* 时间  2023/9/10 20:32
*/
import 'package:free_tube_player/api/youtube_home_api.dart';
import 'package:free_tube_player/base/base_controller.dart';
import 'package:free_tube_player/bean/home/youtube_home_tab.dart';
import 'package:free_tube_player/firebase/firebase_event.dart';
import 'package:free_tube_player/utils/log_utils.dart';
import 'package:get/get.dart';

import 'user_home_tab_page_controller.dart';

class UserYoutubeHomeController extends BaseController {
  final _youtubeHomeApi = YoutubeHomeApi();
  final youtubeHomeTabs = <YoutubeHomeTab>[].obs;
  bool isAllowRetry = true;
  int lastBackPressTime = 0;

  Future<void> requestTabs() async {
    if (isLoading) return;
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

  Future<bool> onBackPress() async {
    final nowTime = DateTime.now().millisecondsSinceEpoch;
    final intervalTime = nowTime - lastBackPressTime;
    if (intervalTime < 2000) {
      FirebaseEvent.instance.logEvent('back_close');
      return true;
    }
    lastBackPressTime = nowTime;
    if (Get.isRegistered<UserHomeTabPageController>() == false) return true;
    final homeTabPageController = Get.find<UserHomeTabPageController>();
    final index = homeTabPageController.index.value;
    if (index != 0) return false;
    requestTabs();
    FirebaseEvent.instance.logEvent('back_refresh');
    return false;
  }
}
