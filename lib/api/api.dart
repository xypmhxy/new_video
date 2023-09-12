/*
* 作者 Ren
* 时间  2023/9/10 20:16
*/

import 'package:free_tube_player/app/app_utils.dart';

class API {
  static const String rootHost = "https://www.youtube.com";

  static const String v1Host = "$rootHost/youtubei/v1";
  static const String homeUrl = "$v1Host/browse";
  static const String nextUrl = "$v1Host/next";
  static const String searchUrl = "$v1Host/search";

  // static const String searchSuggestion = 'https://music.youtube.com/youtubei/v1/music/get_search_suggestions';
  static const String searchSuggestion =
      'https://suggestqueries-clients6.youtube.com/complete/search?client=youtube&hl=en';
  static const String homeBrowseId = "FEwhat_to_watch";
  static const String webVersion = "2.20230831.09.00";
  static String visitorData = 'CgtxX01fTDF5US1WZyiVtfunBjIICgJISxICGgA%3D';

  static Map<String, dynamic> getWebCommonParams({Map? hlgl, String? visitorData}) {
    hlgl ??= {'hl': AppUtils.language, 'gl': AppUtils.localCountryCode};
    return {
      'context': {
        'client': {
          ...hlgl,
          'clientName': 'WEB',
          'clientVersion': webVersion,
          ...(visitorData != null ? {'visitorData': visitorData} : {}),
        }
      }
    };
  }
}
