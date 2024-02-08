/*
* 作者 Ren
* 时间  2023/9/29 18:07
*/

import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:isar/isar.dart';

class ChannelInfo {
  String name = 'No Name';
  String? authorId;
  String avatar = '';
  String bigAvatar = '';
  String banner = '';
  String subscribeCount = '';
  String description = '';
  String keywords = '';
  String videoCountText = '';
  @ignore
  List<AuthorVideoGroup> authorVideoGroups = [];
  @ignore
  List<ChannelTab> channelTabs = [];
}

class ChannelTab {
  String browseId;
  String params;

  ChannelTab({required this.browseId, required this.params});

  ChannelTab.empty({this.browseId = '', this.params = ''});
}

class AuthorVideoGroup {
  String title;
  List<MediaInfo> mediaInfos;

  AuthorVideoGroup(this.title, this.mediaInfos);
}
