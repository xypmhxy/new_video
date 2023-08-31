/*
* 作者 Ren
* 时间  2023/8/6 11:30
*/
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/db/database_manager.dart';
import 'package:isar/isar.dart';

class MediaInfoDao {
  final _isar = DatabaseManager.get.isar;

  Future<int> insert(MediaInfo mediaInfo) {
    return _isar.writeTxn(() => _isar.mediaInfos.put(mediaInfo));
  }

  Future<MediaInfo?> queryByAssetId(String assetId) {
    return _isar.mediaInfos.where().filter().assetsIdEqualTo(assetId).findFirst();
  }

  Future<MediaInfo?> queryIdentify(String identify) {
    return _isar.mediaInfos.filter().identifyEqualTo(identify).findFirst();
  }

  Future<List<MediaInfo>> queryAllPlayHistory() {
    return _isar.mediaInfos.filter().playHistoryIsNotNull().findAll();
  }

  Future<bool> delete(int id) {
    return _isar.mediaInfos.delete(id);
  }
}
