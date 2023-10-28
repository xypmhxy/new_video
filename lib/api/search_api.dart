/*
* 作者 Ren
* 时间  2023/10/15 17:41
*/
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:free_tube_player/api/api.dart';
import 'package:free_tube_player/api/base_dio.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/utils/youtube_parse_utils.dart';

class SearchApi extends BaseDio {
  Future<List<MediaInfo>> search({String? keyword, ValueChanged<String?>? onContinuation}) async {
    final commonParams = API.getWebCommonParams(visitorData: API.visitorData);
    final params = ({...commonParams}..addAll({'query': keyword}));
    final paramsJson = json.encode(params);
    final response = await executePost(url: API.searchUrl, data: paramsJson, header: {
      'X-Goog-Visitor-Id': API.visitorData,
      'Content-Type': 'application/json',
    });
    if (response?.data == null) return [];
    final responseData = response!.data;
    final contents = responseData['contents']?['twoColumnSearchResultsRenderer']?['primaryContents']
            ?['sectionListRenderer']?['contents'] as List? ??
        [];
    if (contents.isEmpty) return [];
    final videoRenders = contents.first['itemSectionRenderer']?['contents'] as List? ?? [];
    if (contents.length >= 2) {
      final continuationToken =
          contents[1]['continuationItemRenderer']?['continuationEndpoint']?['continuationCommand']?['token'];
      onContinuation?.call(continuationToken);
    }
    final mediaInfoList = <MediaInfo>[];
    for (final videoRender in videoRenders) {
      final videoRenderer = videoRender?['videoRenderer'];
      if (videoRenderer == null) continue;
      final mediaInfo = await YoutubeParseUtils.parseVideo(videoRenderer);
      if (mediaInfo == null) continue;
      mediaInfoList.add(mediaInfo);
    }
    return mediaInfoList;
  }

  Future<List<MediaInfo>> searchMore({String? continuation, ValueChanged<String?>? onContinuation}) async {
    final commonParams = API.getWebCommonParams(visitorData: API.visitorData);
    final params = ({...commonParams}..addAll({
        ...{'continuation': continuation},
      }));
    final paramsJson = json.encode(params);
    final response = await executePost(url: API.searchUrl, data: paramsJson, header: {
      'X-Goog-Visitor-Id': API.visitorData,
      'Content-Type': 'application/json',
    });
    if (response?.data == null) return [];
    final responseData = response!.data;
    final contents =
        responseData['onResponseReceivedCommands']?.first?['appendContinuationItemsAction']?['continuationItems'] as List? ??
            [];
    if (contents.isEmpty) return [];
    final videoRenders = contents.first['itemSectionRenderer']?['contents'] as List? ?? [];
    if (contents.length >= 2) {
      final continuationToken =
          contents[1]['continuationItemRenderer']?['continuationEndpoint']?['continuationCommand']?['token'];
      onContinuation?.call(continuationToken);
    }
    final mediaInfoList = <MediaInfo>[];
    for (final videoRender in videoRenders) {
      final videoRenderer = videoRender?['videoRenderer'];
      if (videoRenderer == null) continue;
      final mediaInfo = await YoutubeParseUtils.parseVideo(videoRenderer);
      if (mediaInfo == null) continue;
      mediaInfoList.add(mediaInfo);
    }
    return mediaInfoList;
  }
}
