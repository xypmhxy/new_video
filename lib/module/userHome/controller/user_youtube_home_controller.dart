/*
* 作者 Ren
* 时间  2023/9/10 20:32
*/
import 'package:free_tube_player/api/youtube_home_api.dart';
import 'package:free_tube_player/base/base_controller.dart';
import 'package:free_tube_player/bean/home/youtube_home_tab.dart';
import 'package:free_tube_player/db/dao/media_info_dao.dart';
import 'package:free_tube_player/firebase/firebase_event.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/utils/log_utils.dart';
import 'package:free_tube_player/utils/sp_utils.dart';
import 'package:get/get.dart';

import 'user_home_tab_page_controller.dart';

class UserYoutubeHomeController extends BaseController {
  final _youtubeHomeApi = YoutubeHomeApi();
  final youtubeHomeTabs = <YoutubeHomeTab>[].obs;
  final _mediaInfoDao = MediaInfoDao();
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
        setEmpty();
        requestTabs();
        return;
      }
      setEmpty();
      FirebaseEvent.instance.logEvent('request_tabs_empty');
    } else {
      final lastRecommendYoutubeId = getRecommendTabYoutubeId() ?? '';
      final historyMediaList = await _mediaInfoDao.queryAllPlayHistory(limit: 20);
      historyMediaList
          .removeWhere((element) => element.youtubeId == lastRecommendYoutubeId || element.youtubeId == null);
      if (historyMediaList.isNotEmpty) {
        final recommendTab = YoutubeHomeTab(
            text: S.current.recommended, recommendMediaInfo: historyMediaList.first, continuation: '', clickParams: '');
        youtubeHomeTabs.insert(1, recommendTab);
      }
      isAllowRetry = true;
      setSuccess();
      final allTabLength = youtubeHomeTabs.first.mediaInfos?.length ?? 0;
      FirebaseEvent.instance.logEvent('request_tabs_success', params: {'value': '$allTabLength'});
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

  Future<void> setRecommendTabYoutubeId(String youtubeId) async {
    await SPUtils.setString('key_recommend_tab_youtube_id', youtubeId);
  }

  String? getRecommendTabYoutubeId() {
    return SPUtils.getString('key_recommend_tab_youtube_id');
  }
}
