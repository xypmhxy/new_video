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

  Future<MediaInfo?> queryYoutubeId(String youtubeId) {
    return _isar.mediaInfos.filter().youtubeIdEqualTo(youtubeId).findFirst();
  }

  Future<List<MediaInfo>> queryAllPlayHistory({int limit = 150}) async {
    return _isar.mediaInfos
        .filter()
        .playHistory((q) => q.playPositionIsNotNull())
        .sortByRecentPlayDateDesc()
        .limit(limit)
        .findAll();
  }

  Future<MediaInfo?> queryById(int id) {
    return _isar.mediaInfos.filter().idEqualTo(id).findFirst();
  }

  Future<List<MediaInfo>> queryAllDownloading() async {
    return _isar.mediaInfos
        .filter()
        .videoSourcesElement((q) => q
            .downloadStatusEqualTo(DownloadStatus.pause)
            .or()
            .downloadStatusEqualTo(DownloadStatus.failed)
            .or()
            .downloadStatusEqualTo(DownloadStatus.waiting)
            .or()
            .downloadStatusEqualTo(DownloadStatus.downloading))
        .findAll();
  }

  Future<List<MediaInfo>> queryDownloadComplete() async {
    return _isar.mediaInfos
        .filter()
        .videoSourcesElement((q) => q.downloadStatusEqualTo(DownloadStatus.success).and().downloadPathIsNotEmpty())
        .findAll();
  }

  Future<bool> delete(int id) {
    return _isar.mediaInfos.delete(id);
  }
}
