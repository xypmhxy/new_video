/*
* 作者 Ren
* 时间  2023/9/29 18:15
*/

import 'dart:convert';

import 'package:free_tube_player/api/api.dart';
import 'package:free_tube_player/api/base_dio.dart';
import 'package:free_tube_player/app/app_utils.dart';
import 'package:free_tube_player/bean/play/author_info.dart';
import 'package:free_tube_player/utils/log_utils.dart';
import 'package:get/get.dart';

class ChannelApi extends BaseDio {
  Future<AuthorInfo?> requestAuthorInfo(String channelId) async {
    try {
      final commonParams = getWebCommonParams(visitorData: API.visitorData);
      final params = {...commonParams, 'browseId': channelId};
      final paramsJson = json.encode(params);
      final response = await executePost(url: API.homeUrl, data: paramsJson, header: {
        'X-Goog-Visitor-Id': API.visitorData,
        'Content-Type': 'application/json',
      });
      if (response == null || response.data == null) return null;
      final responseData = response.data;
      AuthorInfo authorInfo = AuthorInfo();
      final channelRender = responseData['header']?['c4TabbedHeaderRenderer'];
      final authorId = channelRender?['channelId'] ?? channelId;
      final title = channelRender?['title'] ?? '';
      final subscriberCountText = channelRender?['subscriberCountText']?['simpleText'] ?? '';
      final thumbnails = channelRender?['avatar']?['thumbnails'] as List? ?? [];
      if (thumbnails.isNotEmpty) {
        final thumbnail = thumbnails.last['url'] ?? '';
        authorInfo.avatar = thumbnail;
      }
      final videosCountTextRuns = channelRender?['videosCountText']?['runs'] as List? ?? [];
      if (videosCountTextRuns.isNotEmpty) {
        final videosCountText = videosCountTextRuns.first['text'] ?? '';
        authorInfo.videoCountText = videosCountText;
      }

      final channelTitle = title ?? responseData['metadata']?['channelMetadataRenderer']?['title'] ?? '';
      final description = title ?? responseData['metadata']?['channelMetadataRenderer']?['description'] ?? '';
      final keywords = title ?? responseData['metadata']?['channelMetadataRenderer']?['keywords'] ?? '';
      final bigThumbnails =
          responseData['metadata']?['channelMetadataRenderer']?['avatar']?['thumbnails'] as List? ?? [];
      if (bigThumbnails.isNotEmpty) {
        final bigThumbnail = bigThumbnails.first['url'] ?? '';
        authorInfo.bigAvatar = bigThumbnail;
      }
      authorInfo.name = channelTitle;
      authorInfo.authorId = authorId;
      authorInfo.subscribeCount = subscriberCountText;
      authorInfo.description = description;
      authorInfo.keywords = keywords;
      return authorInfo;
    } catch (e) {
      LogUtils.e('获取作者信息异常 $e');
    }
    return null;
  }

  static Map<String, dynamic> getWebCommonParams({Map? hlgl, String? visitorData}) {
    hlgl ??= {'hl': AppUtils.language};
    return {
      'context': {
        'client': {
          ...hlgl,
          'clientName': 'WEB',
          'clientVersion': API.webVersion,
          ...(visitorData != null ? {'visitorData': visitorData} : {}),
        }
      }
    };
  }
}
