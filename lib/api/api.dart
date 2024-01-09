/*
* 作者 Ren
* 时间  2023/9/10 20:16
*/

import 'package:free_tube_player/app/app_utils.dart';
import 'package:free_tube_player/utils/log_utils.dart';
import 'package:free_tube_player/utils/sp_utils.dart';

class API {
  static const String rootHost = "https://www.youtube.com";

  static const String v1Host = "$rootHost/youtubei/v1";
  static const String homeUrl = "$v1Host/browse";
  static const String nextUrl = "$v1Host/next";
  static const String searchUrl = "$v1Host/search";
  static const String shortVideoParams = "$v1Host/reel/reel_item_watch";
  static const String shortVideoSequence = "$v1Host/reel/reel_watch_sequence";

  static const String homeBrowseId = "FEwhat_to_watch";
  static const String webVersion = "2.20230831.09.00";
  static String _visitorData = getCacheVisitorData();

  static String get visitorData => _visitorData;

  static Map<String, dynamic> getWebCommonParams({Map? hlgl, String? visitorData}) {
    hlgl ??= {'hl': AppUtils.language};
    return {
      'context': {
        'client': {
          ...hlgl,
          'clientName': 'WEB',
          'clientVersion': webVersion,
          'visitorData': API.visitorData,
        }
      }
    };
  }

  static void setCacheVisitorData(String visitorData) {
    if (visitorData.isNotEmpty) {
      _visitorData = visitorData;
    }
    LogUtils.i('更新visitorData $visitorData');
    SPUtils.setString('cache_visitor_data', visitorData);
  }

  static String getCacheVisitorData() {
    return SPUtils.getString('cache_visitor_data') ?? '';
  }
}
