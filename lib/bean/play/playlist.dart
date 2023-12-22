/*
* 作者 Ren
* 时间  2023/12/10 22:01
*/
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:isar/isar.dart';

part 'playlist.g.dart';

enum PlaylistType { normal, like, watchLater }

@collection
class Playlist {
  static const defaultTitle = 'Unknown name';
  static const defaultSubtitle = '';

  Id id = Isar.autoIncrement;
  String title = defaultTitle;
  String subTitle = defaultSubtitle;
  int? createTime = 0;
  int updateTime = 0;
  int recentEnterTime = 0;
  @enumerated
  PlaylistType playlistType = PlaylistType.normal;
  @ignore
  List<MediaInfo> mediaInfoList = [];
  String? thumbImage;

  Playlist();

  Playlist.create({
    this.title = defaultTitle,
    this.subTitle = defaultSubtitle,
    this.createTime = 0,
    this.updateTime = 0,
    this.recentEnterTime = 0,
    this.thumbImage,
    this.playlistType = PlaylistType.normal,
  });

  String getDisplayTitle() {
    switch (playlistType) {
      case PlaylistType.like:
        return S.current.like;
      case PlaylistType.watchLater:
        return S.current.watchLater;
      default:
        return title;
    }
  }
}
