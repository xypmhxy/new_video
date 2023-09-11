/*
* 作者 Ren
* 时间  2023/9/10 20:16
*/

class API{
  static const String rootHost = "https://www.youtube.com";

  static const String v1Host = "$rootHost/youtubei/v1";
  static const String homeUrl = "$v1Host/browse";
  static const String nextUrl = "$v1Host/next";
  static const String searchUrl = "$v1Host/search";
  // static const String searchSuggestion = 'https://music.youtube.com/youtubei/v1/music/get_search_suggestions';
  static const String searchSuggestion = 'https://suggestqueries-clients6.youtube.com/complete/search?client=youtube&hl=en';

  static const String homeBrowseId = "FEwhat_to_watch";

  static const String webVersion = "2.20230104.01.00";

  static Map<String, dynamic> getWebCommonParams({Map? hlgl, String? visitorData}) {
    hlgl ??= {'hl': 'en', 'gl': 'US'};
    return {
      'context': {
        'client': {
          ...hlgl,
          'clientName': 'WEB',
          'clientVersion': '2.20230607.06.00',
          ...(visitorData != null ? {'visitorData': visitorData} : {}),
        }
      }
    };
  }

  static Map<String, dynamic> getSuggestionParams() {
    Map hlgl = {'hl': 'en', 'gl': 'US'};
    return {
      'context': {
        'client': {
          ...hlgl,
          'clientName': 'WEB_REMIX',
          'browserName': 'Chrome',
          'browserVersion': '110.0.0.0',
          'platform': 'DESKTOP',
          'clientVersion': '1.20230313.00.00',
        }
      }
    };
  }
}