/*
* 作者 Ren
* 时间  2023/9/29 18:07
*/

import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:isar/isar.dart';

class AuthorInfo {
  String name = 'No Name';
  String? authorId;
  String avatar = '';
  String bigAvatar = '';
  String subscribeCount = '';
  String description = '';
  String keywords = '';
  String videoCountText = '';
  @ignore
  List<AuthorVideoGroup> authorVideoGroups = [];
}

class AuthorVideoGroup {
  String title;
  List<MediaInfo> mediaInfos;

  AuthorVideoGroup(this.title, this.mediaInfos);
}
