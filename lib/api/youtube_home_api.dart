/*
* 作者 Ren
* 时间  2023/9/10 20:16
*/

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:free_tube_player/api/api.dart';
import 'package:free_tube_player/api/base_dio.dart';
import 'package:free_tube_player/bean/home/youtube_home_tab.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/firebase/firebase_event.dart';
import 'package:free_tube_player/utils/log_utils.dart';
import 'package:free_tube_player/utils/youtube_parse_utils.dart';
import 'package:get/get.dart';

class YoutubeHomeApi extends BaseDio {
  Future<List<YoutubeHomeTab>> requestTabs() async {
    try {
      FirebaseEvent.instance.logEvent('request_tabs');
      final commonParams = API.getWebCommonParams();
      final params = {...commonParams, 'browseId': API.homeBrowseId};
      final paramsJson = json.encode(params);
      final response = await executePost(url: API.homeUrl, data: paramsJson);
      if (response == null || response.data == null) return [];
      final responseData = response.data;
      final newVisitorData = responseData['responseContext']?['visitorData'] as String?;
      if (newVisitorData != null && newVisitorData.isNotEmpty) {
        API.visitorData = newVisitorData;
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
        final continuation = getContinuation(contents);
        homeTabs.first.continuation = continuation;
        return homeTabs;
      }
    } catch (e) {
      LogUtils.e('requestHomeTab error $e');
      FirebaseEvent.instance.logEvent('request_tabs_error', params: {
        'value': {e.toString()}
      });
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
      final continuationCommand = header['chipCloudChipRenderer']['navigationEndpoint']?['continuationCommand'];
      final token = continuationCommand?['token'] ?? '';
      final clickParams = continuationCommand?['command']?['clickTrackingParams'] ?? '';
      YoutubeHomeTab homeTab =
          YoutubeHomeTab(text: title, continuation: token, clickParams: clickParams, isAll: index == 0);
      homeTabs.add(homeTab);
      index++;
    }
    return homeTabs;
  }

  Future<List<MediaInfo>> requestHomeChildVideos(
      {required String token, String? clickParams, ValueChanged<String?>? onContinuation}) async {
    try {
      FirebaseEvent.instance.logEvent('request_home_child_videos');
      final commonParams = API.getWebCommonParams(visitorData: API.visitorData);
      final params = {
        ...commonParams,
        'continuation': token,
        ...((clickParams ?? "").isNotEmpty
            ? {
                'clickTracking': {'clickTrackingParams': clickParams}
              }
            : {})
      };

      final paramsJson = json.encode(params);
      final response = await executePost(url: API.homeUrl, data: paramsJson, header: {
        'X-Goog-Visitor-Id': API.visitorData,
        'Content-Type': 'application/json',
      });
      if (response == null || response.data == null) return [];
      final responseData = response.data;
      final actions = responseData['onResponseReceivedActions'] ?? [];
      for (final action in actions) {
        var items = action['reloadContinuationItemsCommand']?['continuationItems'] as List?;
        if (items == null || items.isEmpty) {
          items = action['appendContinuationItemsAction']?['continuationItems'] as List?;
        }
        if (items == null || items.isEmpty) continue;
        final mediaList = await YoutubeParseUtils.parseVideoRender(items);
        final continuation = getContinuation(items);
        onContinuation?.call(continuation);
        if (mediaList.isNotEmpty) return mediaList;
      }
      return [];
    } catch (e) {
      LogUtils.e(e.toString());
      FirebaseEvent.instance.logEvent('request_home_child_videos_error', params: {
        'value': {e.toString()}
      });
      return [];
    }
  }

  String getContinuation(List contents) {
    final items = contents.reversed.toList();
    for (final item in items) {
      try {
        final continuation =
            item["continuationItemRenderer"]?["continuationEndpoint"]?["continuationCommand"]?["token"];
        if (continuation != null) {
          return continuation;
        }
      } catch (_) {}
    }
    return '';
  }
}
