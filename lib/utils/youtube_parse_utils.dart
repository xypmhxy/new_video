/*
* 作者 Ren
* 时间  2023/9/10 20:30
*/

import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/db/dao/media_info_dao.dart';
import 'package:free_tube_player/utils/duration_utils.dart';
import 'package:free_tube_player/utils/log_utils.dart';

class YoutubeParseUtils {
  static final mediaDao = MediaInfoDao();

  static Future<List<MediaInfo>> parseVideoRender(List contents) async {
    List<MediaInfo> mediaList = [];
    for (final content in contents) {
      final videoRenderer = content['richItemRenderer']?['content']?['videoRenderer'];
      if (videoRenderer == null) continue;
      final mediaInfo = await parseVideo(videoRenderer);
      if (mediaInfo == null) continue;
      mediaList.add(mediaInfo);
    }
    return mediaList;
  }

  static Future<MediaInfo?> parseVideo(dynamic videoRenderer) async {
    final youtubeId = videoRenderer['videoId'];
    if (youtubeId == null) return null;
    MediaInfo? dbMediaInfo = await mediaDao.queryYoutubeId(youtubeId).catchError((_) {});
    if (dbMediaInfo != null) return dbMediaInfo;
    final thumbnails = videoRenderer['thumbnail']?['thumbnails'] as List?;
    final thumbnail = thumbnails?.last?['url'] ?? '';

    final titleRuns = videoRenderer['title']?['runs'] as List?;
    var title = titleRuns?.last['text'] as String?;
    title ??= videoRenderer['title']?['simpleText'] ?? MediaInfo.defaultTitle;

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
    duration = DurationUtils.parseDurationText(durationString);

    final viewCountText = videoRenderer['shortViewCountText']?['simpleText'] ?? '';

    final authorThumbnails = videoRenderer['channelThumbnailSupportedRenderers']?['channelThumbnailWithLinkRenderer']
        ?['thumbnail']?['thumbnails'] as List?;
    var authorThumbnail = authorThumbnails?.last?['url'] ?? '';

    if (authorThumbnail == '') {
      final authorThumbnails = videoRenderer['channelThumbnail']?['thumbnails'] as List?;
      authorThumbnail = authorThumbnails?.last?['url'] ?? '';
    }

    final authorId = videoRenderer['channelThumbnailSupportedRenderers']?['channelThumbnailWithLinkRenderer']
        ?['navigationEndpoint']?['browseEndpoint']?['browseId'] as String?;

    final map = {
      'title': title,
      'author': author,
      'authorId': authorId,
      'youtubeId': youtubeId,
      'thumbnail': thumbnail,
      'description': description,
      'publishedTime': publishedTimeText,
      'duration': duration,
      'viewCountText': viewCountText,
      'authorThumbnail': authorThumbnail,
    };
    final mediaInfo = MediaInfo.fromMap(map);
    return mediaInfo;
  }
}
