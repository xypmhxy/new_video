/*
* 作者 Ren
* 时间  2023/8/6 16:59
*/

import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/db/dao/media_info_dao.dart';
import 'package:free_tube_player/utils/date_utils.dart';
import 'package:get/get.dart';

enum DBChangeType { insert, delete, update }

class MediaInfoChangeWatcher {
  MediaInfo mediaInfo;
  DBChangeType type;
  String? tag;

  MediaInfoChangeWatcher({required this.mediaInfo, required this.type, this.tag});
}

class MediaInfoHelper {
  static final get = MediaInfoHelper._();

  MediaInfoHelper._() {
    _mediaInfoChangeWatcher.listen((mediaInfoChangeWatcher) {
      if (mediaInfoChangeWatcher == null) return;
      for (final listener in _listeners) {
        listener.onMediaInfoChange(mediaInfoChangeWatcher);
      }
    });
  }

  final _mediaInfoDao = MediaInfoDao();
  final _mediaInfoChangeWatcher = Rxn<MediaInfoChangeWatcher>();
  final _listeners = <OnMediaInfoChangedListener>[];

  Future<int> rename(MediaInfo mediaInfo, String newName) {
    mediaInfo.title = newName;
    return _mediaInfoDao.insert(mediaInfo);
  }

  Future<int> delete(MediaInfo mediaInfo) {
    mediaInfo.isDelete = true;
    return _mediaInfoDao.insert(mediaInfo);
  }

  Future<int> savePlayPosition(MediaInfo mediaInfo, int position) {
    final nowDateMs = DateUtil.getNowDateMs();
    mediaInfo.playHistory ??= PlayHistory();
    mediaInfo.playHistory?.playPosition = position;
    mediaInfo.playHistory?.firstPlayDate ??= nowDateMs;
    mediaInfo.playHistory?.recentPlayDate = nowDateMs;
    return _mediaInfoDao.insert(mediaInfo);
  }

  Future<int> clearPlayPosition(MediaInfo mediaInfo) {
    mediaInfo.playHistory = null;
    return _mediaInfoDao.insert(mediaInfo);
  }

  ///
  void addWatcher(OnMediaInfoChangedListener listener) {
    _listeners.add(listener);
  }

  void removeWatcher(OnMediaInfoChangedListener listener) {
    _listeners.remove(listener);
  }

  void sendChangeEvent(MediaInfoChangeWatcher watcher) {
    _mediaInfoChangeWatcher.value = watcher;
  }
}

class OnMediaInfoChangedListener {
  void onMediaInfoChange(MediaInfoChangeWatcher mediaInfoChangeWatcher) {}
}
