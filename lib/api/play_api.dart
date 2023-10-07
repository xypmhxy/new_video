/*
* 作者 Ren
* 时间  2023/9/10 20:16
*/

import 'dart:convert';

import 'package:free_tube_player/api/api.dart';
import 'package:free_tube_player/api/base_dio.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/utils/log_utils.dart';
import 'package:free_tube_player/utils/youtube_parse_utils.dart';

class PlayApi extends BaseDio {
  Future<List<MediaInfo>> requestRecommend({String? youtubeId, String? continuation}) async {
    try {
      List<MediaInfo> mediaInfos = [];
      final commonParams = API.getWebCommonParams(visitorData: API.visitorData);
      final params = ({...commonParams}..addAll({
          ...((youtubeId ?? "").isNotEmpty ? {'videoId': youtubeId} : {'continuation': continuation}),
        }));
      final paramsJson = json.encode(params);
      final response = await executePost(url: API.nextUrl, data: paramsJson, header: {
        'X-Goog-Visitor-Id': API.visitorData,
        'Content-Type': 'application/json',
      });
      if (response == null || response.data == null) return mediaInfos;
      Map<String, dynamic> responseJson = response.data as Map<String, dynamic>;
      if (continuation != null) {
        // String youId = YoutubeUtils.instance.nextAudio!.youtubeId ?? "";
        // mediaList = await YoutubeUtils.instance.analyseContinuationResult(responseJson, youtubeId: youId);
      } else if (youtubeId != null) {
        final actions = responseJson["contents"]?["twoColumnWatchNextResults"]?["secondaryResults"]?["secondaryResults"]
                ?["results"] ??
            [];
        if (actions.isEmpty) {
          return [];
        }

        for (final action in actions) {
          final compactVideoRenderer = action['compactVideoRenderer'];
          if (compactVideoRenderer == null) continue;
          final mediaInfo = await YoutubeParseUtils.parseVideo(compactVideoRenderer);
          if (mediaInfo == null) continue;
          mediaInfos.add(mediaInfo);
        }
      }
      return mediaInfos;
    } catch (e) {
      LogUtils.e('requestHomeTab error $e');
    }
    return [];
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
