/*
* 作者 Ren
* 时间  2023/12/10 22:11
*/

import 'package:free_tube_player/bean/play/playlist.dart';
import 'package:free_tube_player/bean/play/playlist_wrapper.dart';
import 'package:free_tube_player/db/dao/media_info_dao.dart';
import 'package:free_tube_player/db/database_manager.dart';
import 'package:isar/isar.dart';

class PlaylistDao {
  final _isar = DatabaseManager.get.isar;
  final _mediaDao = MediaInfoDao();

  Future<int> insert(Playlist playlist) async {
    return _isar.writeTxn(() => _isar.playlists.put(playlist));
  }

  Future<Playlist?> queryById(int id) async {
    final playlist = await _isar.playlists.filter().idEqualTo(id).findFirst();
    await linkMedias(playlist);
    return playlist;
  }

  Future<Playlist?> queryByType(PlaylistType playlistType) async {
    final playlist = await _isar.playlists.filter().playlistTypeEqualTo(playlistType).findFirst();
    await linkMedias(playlist);
    return playlist;
  }

  Future<List<Playlist>> queryAllPlaylist() async {
    final playlists = await _isar.playlists.where().findAll();
    for (final playlist in playlists) {
      await linkMedias(playlist);
    }
    return playlists;
  }

  Future<bool> delete(int id) async {
    return _isar.writeTxn(() => _isar.playlists.delete(id));
  }

  //以下操作歌单具体歌曲
  Future<int> insertMedia(PlaylistWrapper playlistWrapper) async {
    return _isar.writeTxn(() => _isar.playlistWrappers.put(playlistWrapper));
  }

  Future<PlaylistWrapper?> queryExistPlaylistMedia(int playlistId, int mediaId) async {
    return await _isar.playlistWrappers
        .filter()
        .playlistIdEqualTo(playlistId)
        .and()
        .mediaIdEqualTo(mediaId)
        .findFirst();
  }

  Future<bool> removeMedia(PlaylistWrapper playlistWrapper) async {
    return _isar.writeTxn(() => _isar.playlistWrappers.delete(playlistWrapper.id));
  }

  Future<List<PlaylistWrapper>> queryPlaylistMedia(int playlistId) async {
    return await _isar.playlistWrappers.filter().playlistIdEqualTo(playlistId).sortByCreateDateDesc().findAll();
  }

  Future<void> linkMedias(Playlist? playlist) async {
    if (playlist == null) return;
    final playlistWrappers = await queryPlaylistMedia(playlist.id);
    for (final playlistWrapper in playlistWrappers) {
      final mediaInfo = await _mediaDao.queryById(playlistWrapper.mediaId);
      if (mediaInfo != null) playlist.mediaInfoList.add(mediaInfo);
    }
  }
}
