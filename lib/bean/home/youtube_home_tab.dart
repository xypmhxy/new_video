/*
* 作者 Ren
* 时间  2023/9/10 20:20
*/

import 'package:free_tube_player/bean/play/media_info.dart';

class YoutubeHomeTab {
  String text = "";
  String continuation = "";
  String clickParams = "";
  List<MediaInfo>? mediaInfos;
  bool isAll = false;
  bool isSearchRecommend = false;
  MediaInfo? recommendMediaInfo;

  YoutubeHomeTab({
    required this.text,
    required this.continuation,
    required this.clickParams,
    this.isAll = false,
    this.isSearchRecommend = false,
    this.recommendMediaInfo,
  });

  YoutubeHomeTab.fromMap(Map info) {
    text = info['text'] ?? "";
    continuation = info['token'] ?? '';
    clickParams = info['clickParams'] ?? '';
    mediaInfos = getMediaInfos(info['videos']);
    isAll = info['isAll'] ?? false;
  }

  Map toJson() {
    return {'text': text, 'token': continuation, 'clickParams': clickParams, 'isAll': isAll, 'videos': videosMapList};
  }

  List<MediaInfo> getMediaInfos(var list) {
    if (list == null) {
      return [];
    }
    List<MediaInfo> beanList = [];
    for (Map<String, dynamic> map in list!) {
      MediaInfo mediaInfo = MediaInfo.fromMap(map);
      beanList.add(mediaInfo);
    }
    return beanList;
  }

  List<Map> get videosMapList {
    if (mediaInfos == null) {
      return [];
    }
    List<Map<dynamic, dynamic>> jsonList = [];
    for (MediaInfo mediaInfo in mediaInfos!) {
      Map map = mediaInfo.toJson();
      jsonList.add(map);
    }
    return jsonList;
  }
}
