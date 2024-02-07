/*
* 作者 Ren
* 时间  2023/9/29 18:15
*/

import 'dart:convert';

import 'package:free_tube_player/api/api.dart';
import 'package:free_tube_player/api/base_dio.dart';
import 'package:free_tube_player/app/app_utils.dart';
import 'package:free_tube_player/bean/play/channel_info.dart';
import 'package:free_tube_player/utils/log_utils.dart';
import 'package:free_tube_player/utils/video_data_helper.dart';
import 'package:free_tube_player/utils/youtube_parse_utils.dart';
import 'package:get/get.dart';

import '../../../utils/duration_utils.dart';

class ChannelApi extends BaseDio {
  Future<ChannelInfo?> requestAuthorInfo(String channelId, {bool needVideo = false}) async {
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
      ChannelInfo authorInfo = ChannelInfo();
      final channelRender = responseData['header']?['c4TabbedHeaderRenderer'];
      final authorId = channelRender?['channelId'] ?? channelId;
      final title = channelRender?['title'] ?? '';
      final subscriberCountText = channelRender?['subscriberCountText']?['simpleText'] ?? '';
      final thumbnails = channelRender?['avatar']?['thumbnails'] as List? ?? [];
      if (thumbnails.isNotEmpty) {
        final thumbnail = thumbnails.last['url'] ?? '';
        authorInfo.avatar = thumbnail;
      }

      var bannerThumb = channelRender?['mobileBanner']?['thumbnails'] as List? ?? [];
      if (bannerThumb.isEmpty) {
        bannerThumb = channelRender?['banner']?['thumbnails'] as List? ?? [];
      }
      authorInfo.banner = bannerThumb.last['url'] ?? '';

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
      if (needVideo) {
        final tabs = responseData['contents']?['twoColumnBrowseResultsRenderer']?['tabs'] ?? [];
        final homeTab = tabs.first;
        List contents = homeTab['tabRenderer']?['content']?['sectionListRenderer']?['contents'] ?? [];
        for (final content in contents) {
          List contents = content['itemSectionRenderer']?['contents'] ?? [];
          if (contents.isEmpty) continue;
          final shelfRenderer = contents.first;
          if (shelfRenderer == null) continue;
          List items = shelfRenderer?['shelfRenderer']?['content']?['horizontalListRenderer']?['items'] ?? [];
          if (items.isEmpty) continue;
          final authorVideoGroup = AuthorVideoGroup('', []);
          authorInfo.authorVideoGroups.add(authorVideoGroup);

          List titleRuns = shelfRenderer['shelfRenderer']?['title']?['runs'] ?? [];
          if (titleRuns.isNotEmpty) {
            final title = titleRuns.last['text'] ?? '';
            authorVideoGroup.title = title;
          }

          for (final item in items) {
            final renderer = item['gridVideoRenderer'];
            if (renderer == null) continue;
            final mediaInfo = await YoutubeParseUtils.parseVideo(renderer);
            if (mediaInfo == null) continue;
            List thumbnailOverlays = renderer['thumbnailOverlays'] ?? [];
            if (thumbnailOverlays.isNotEmpty) {
              final timeOverlay = thumbnailOverlays
                  .firstWhereOrNull((element) => element['thumbnailOverlayTimeStatusRenderer'] != null);
              if (timeOverlay != null) {
                final simpleText = timeOverlay?['thumbnailOverlayTimeStatusRenderer']['text']?['simpleText'];
                if (simpleText != null) {
                  final duration = DurationUtils.parseDurationText(simpleText);
                  mediaInfo.duration = duration;
                }
              }
            }
            mediaInfo.author = authorInfo.name;
            mediaInfo.authorThumbnail = authorInfo.avatar;
            mediaInfo.authorId = authorInfo.authorId;
            authorVideoGroup.mediaInfos.add(mediaInfo);
          }
        }
      }

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
