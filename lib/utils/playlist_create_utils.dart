/*
* 作者 Ren
* 时间  2023/12/10 22:31
*/

import 'package:free_tube_player/bean/play/playlist.dart';
import 'package:free_tube_player/db/dao/playlist_dao.dart';
import 'package:free_tube_player/generated/l10n.dart';

class PlaylistCreateUtils {
  static Future<void> createPlaylist() async {
    final playlistDao = PlaylistDao();

    final nowDate = DateTime.now().millisecondsSinceEpoch;
    Playlist? likeList = await playlistDao.queryByType(PlaylistType.like);
    if (likeList == null) {
      likeList = Playlist.create(title: S.current.like, createTime: nowDate, playlistType: PlaylistType.like);
      await playlistDao.insert(likeList);
    }

    Playlist? watchLaterList = await playlistDao.queryByType(PlaylistType.watchLater);
    if (watchLaterList == null) {
      watchLaterList =
          Playlist.create(title: S.current.watchLater, createTime: nowDate, playlistType: PlaylistType.watchLater);
      await playlistDao.insert(watchLaterList);
    }
  }
}
