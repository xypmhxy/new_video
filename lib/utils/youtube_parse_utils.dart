/*
* 作者 Ren
* 时间  2023/9/10 20:30
*/

import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/db/dao/media_info_dao.dart';
import 'package:free_tube_player/utils/log_utils.dart';

class YoutubeParseUtils {
  static Future<List<MediaInfo>> parseVideoRender(List contents) async {
    List<MediaInfo> mediaList = [];
    final mediaDao = MediaInfoDao();
    for (final content in contents) {
      final videoRenderer = content['richItemRenderer']?['content']?['videoRenderer'];
      if (videoRenderer == null) continue;
      final youtubeId = videoRenderer['videoId'];
      if (youtubeId == null) continue;
      final thumbnails = videoRenderer['thumbnail']?['thumbnails'] as List?;
      final thumbnail = thumbnails?.last?['url'] ?? '';

      final titleRuns = videoRenderer['title']?['runs'] as List?;
      final title = titleRuns?.last['text'] ?? MediaInfo.defaultTitle;

      final descriptionRuns = videoRenderer['descriptionSnippet']?['runs'] as List?;
      final description = descriptionRuns?.last['text'] ?? '';

      List? authorRuns = videoRenderer['longBylineText']?['runs'] as List?;
      String author = authorRuns?.last['text'] ?? '';
      if (author.isEmpty) {
        authorRuns = videoRenderer['ownerText']?['runs'] as List?;
        author = authorRuns?.last['text'] ?? '';
        if (author.isEmpty) {
          authorRuns = videoRenderer['shortBylineText']?['runs'] as List?;
          author = authorRuns?.last['text'] ?? '';
        }
      }

      final publishedTimeText = videoRenderer['publishedTimeText']?['simpleText'];

      int duration = 0;
      String durationString = videoRenderer['lengthText']?['simpleText'] ?? '';
      if (durationString.contains(':')) {
        final durationList = durationString.split(':');
        int hour = 0;
        if (durationList.length >= 3) {
          hour = int.tryParse(durationList[0]) ?? 0;
          int min = int.tryParse(durationList[1]) ?? 0;
          int second = int.tryParse(durationList[2]) ?? 0;
          duration = Duration(hours: hour, minutes: min, seconds: second).inMilliseconds;
        } else {
          int min = int.tryParse(durationList[0]) ?? 0;
          int second = int.tryParse(durationList[1]) ?? 0;
          duration = Duration(hours: hour, minutes: min, seconds: second).inMilliseconds;
        }
      }

      final viewCountText = videoRenderer['shortViewCountText']?['simpleText'] ?? '';

      final authorThumbnails = videoRenderer['channelThumbnailSupportedRenderers']?['channelThumbnailWithLinkRenderer']
          ?['thumbnail']?['thumbnails'] as List?;
      final authorThumbnail = authorThumbnails?.last?['url'] ?? '';

      if (duration <= 0) {
        continue;
      }

      final map = {
        'title': title,
        'author': author,
        'youtubeId': youtubeId,
        'thumbnail': thumbnail,
        'description': description,
        'publishedTime': publishedTimeText,
        'duration': duration,
        'viewCountText': viewCountText,
        'authorThumbnail': authorThumbnail,
      };
      final mediaBean = MediaInfo.fromMap(map);
      if (mediaBean.youtubeId != null) {
        MediaInfo? localMediaInfo = await mediaDao.queryYoutubeId(mediaBean.youtubeId!);
        if (localMediaInfo != null) {
          localMediaInfo.createDate = DateTime.now().millisecondsSinceEpoch;
          mediaList.add(localMediaInfo);
          continue;
        }
      }
      mediaList.add(mediaBean);
    }
    return mediaList;
  }
}
