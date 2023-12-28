/*
* 作者 Ren
* 时间  2023/12/10 22:07
*/

import 'package:isar/isar.dart';

part 'playlist_wrapper.g.dart';

@collection
class PlaylistWrapper {
  Id id = Isar.autoIncrement;
  int mediaId = 0;
  int playlistId = 0;
  int createDate = 0;
  int updateDate = 0;

  PlaylistWrapper();

  PlaylistWrapper.create({required this.mediaId, required this.playlistId}) {
    createDate = updateDate = DateTime.now().millisecondsSinceEpoch;
  }
}
