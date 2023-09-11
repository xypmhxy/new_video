/*
* 作者 Ren
* 时间  2023/9/10 20:16
*/

import 'dart:convert';

import 'package:free_tube_player/api/api.dart';
import 'package:free_tube_player/api/base_dio.dart';
import 'package:free_tube_player/bean/home/youtube_home_tab.dart';
import 'package:free_tube_player/utils/log_utils.dart';
import 'package:free_tube_player/utils/youtube_parse_utils.dart';

class YoutubeHomeApi extends BaseDio {
  String visitorData = 'CgtxX01fTDF5US1WZyjPzKCkBg%3D%3D';

  Future<List<YoutubeHomeTab>> requestTabs() async {
    try {
      final commonParams = API.getWebCommonParams();
      final params = {...commonParams, 'browseId': API.homeBrowseId};
      final paramsJson = json.encode(params);
      final response = await executePost(url: API.homeUrl, data: paramsJson);
      if (response == null || response.data == null) return [];
      final responseData = response.data;
      final newVisitorData = responseData['responseContext']?['visitorData'] as String?;
      if (newVisitorData != null && newVisitorData.isNotEmpty) {
        visitorData = newVisitorData;
      }
      final tabs = (responseData['contents']?['twoColumnBrowseResultsRenderer']?['tabs'] as List?) ?? [];
      if (tabs.isNotEmpty) {
        final headers = tabs.first['tabRenderer']?['content']?['richGridRenderer']?['header']
                ?['feedFilterChipBarRenderer']?['contents'] ??
            [];
        final homeTabs = _parseTabHeader(headers);
        final contents = tabs.first['tabRenderer']?['content']?['richGridRenderer']?['contents'] ?? [];
        final mediaList = await YoutubeParseUtils.parseVideoRender(contents);
        homeTabs.first.mediaInfos = mediaList;
        return homeTabs;
      }
    } catch (e) {
      LogUtils.e('requestHomeTab error $e');
    }
    return [];
  }

  List<YoutubeHomeTab> _parseTabHeader(List headers) {
    List<YoutubeHomeTab> homeTabs = [];
    int index = 0;
    for (final header in headers) {
      final textRuns = (header['chipCloudChipRenderer']['text']['runs'] as List?) ?? [];
      String title = "";
      if (textRuns.isNotEmpty) {
        title = textRuns.first["text"] ?? "";
      }
      if (title.isEmpty) continue;
      if (title.toLowerCase().contains('live')) {
        print('object');
      }
      final continuationCommand = header['chipCloudChipRenderer']['navigationEndpoint']?['continuationCommand'];
      final token = continuationCommand?['token'] ?? '';
      final clickParams = continuationCommand?['command']?['clickTrackingParams'] ?? '';
      YoutubeHomeTab homeTab = YoutubeHomeTab(text: title, token: token, clickParams: clickParams,isAll: index == 0);
      homeTabs.add(homeTab);
      index++;
    }
    return homeTabs;
  }
}
