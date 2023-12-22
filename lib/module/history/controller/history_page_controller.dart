/*
* 作者 Ren
* 时间  2023/8/12 18:20
*/
import 'package:free_tube_player/base/base_controller.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/bean/play/video_group.dart';
import 'package:free_tube_player/db/dao/media_info_dao.dart';
import 'package:free_tube_player/extension/date_time_extension.dart';
import 'package:free_tube_player/helper/media_info_helper.dart';
import 'package:free_tube_player/utils/date_utils.dart';
import 'package:get/get.dart';

class HistoryPageController extends BaseController {
  static const tag = 'HistoryPageController';
  final videoGroupList = RxList<VideoGroup>();
  final _mediaInfoDao = MediaInfoDao();
  final _mediaInfoHelper = MediaInfoHelper.get;

  Future<void> queryAllHistory() async {
    List<VideoGroup> tempList = [];
    setLoading();
    final histories = await _mediaInfoDao.queryAllPlayHistory();
    if (histories.isEmpty) {
      setEmpty();
      return;
    }
    final videoGroupMap = <int, List<MediaInfo>>{};
    for (final mediaInfo in histories) {
      if (mediaInfo.historyPosition == null) continue;
      final dateTime = DateTime.fromMillisecondsSinceEpoch(mediaInfo.playHistory!.recentPlayDate!);
      final mediaInfoList = videoGroupMap[dateTime.dayStart()] ?? [];
      final dbMedia = await _mediaInfoDao.queryIdentify(mediaInfo.identify);
      if (dbMedia == null || dbMedia.isDelete) continue;
      mediaInfoList.add(mediaInfo);
      videoGroupMap[dateTime.dayStart()] = mediaInfoList;
    }

    final entries = videoGroupMap.entries;
    for (final entry in entries) {
      final key = entry.key;
      final value = entry.value;
      final dateTime = DateTime.fromMillisecondsSinceEpoch(key);
      final videoGroup = VideoGroup(dateTime.format(format: DateFormats.mo_d), value, key);
      tempList.add(videoGroup);
    }
    tempList.sort((a, b) {
      final aDate = a.date;
      final bDate = b.date;
      return bDate.compareTo(aDate);
    });
    videoGroupList.value = tempList;
  }

  Future<void> rename(MediaInfo mediaInfo, String newName) async {
    videoGroupList.refresh();
    _mediaInfoHelper
        .sendChangeEvent(MediaInfoChangeWatcher(mediaInfo: mediaInfo, type: DBChangeType.update, tag: tag));
  }

  Future<void> delete(MediaInfo mediaInfo, VideoGroup videoGroup) async {
    videoGroup.mediaInfoList.remove(mediaInfo);
    if (videoGroup.mediaInfoList.isEmpty) {
      videoGroupList.remove(videoGroup);
    }
    videoGroupList.refresh();
    _mediaInfoHelper
        .sendChangeEvent(MediaInfoChangeWatcher(mediaInfo: mediaInfo, type: DBChangeType.delete, tag: tag));
  }

  Future<void> deleteHistory(MediaInfo mediaInfo, VideoGroup videoGroup) async {
    videoGroup.mediaInfoList.remove(mediaInfo);
    if (videoGroup.mediaInfoList.isEmpty) {
      videoGroupList.remove(videoGroup);
    }
    videoGroupList.refresh();
    _mediaInfoHelper
        .sendChangeEvent(MediaInfoChangeWatcher(mediaInfo: mediaInfo, type: DBChangeType.update, tag: tag));
  }
}
