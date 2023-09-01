/*
* 作者 Ren
* 时间  2023/8/5 10:08
*/
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/bean/play/video_group.dart';
import 'package:free_tube_player/db/dao/media_info_dao.dart';
import 'package:free_tube_player/extension/date_time_extension.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/helper/media_info_helper.dart';
import 'package:free_tube_player/module/home/controller/base_android_video_controller.dart';
import 'package:free_tube_player/utils/date_utils.dart';
import 'package:free_tube_player/utils/media_info_utils.dart';
import 'package:free_tube_player/utils/video_utils.dart';
import 'package:photo_gallery/photo_gallery.dart';

class HomeFilePageController extends BaseAndroidVideoController implements OnMediaInfoChangedListener {
  final _mediaInfoDao = MediaInfoDao();

  @override
  Future<void> queryVideos() async {
    setLoading();
    videoGroupList.clear();
    final videoGroupMap = <int, List<MediaInfo>>{};
    final List<Album> videoAlbums = await VideoUtils.getVideoAlbums();
    final nowDateTime = DateTime.now();

    for (final videoAlbum in videoAlbums) {
      if (videoAlbum.isAllAlbum && videoAlbums.length > 1) continue;
      final mediaPages = await videoAlbum.listMedia();
      final items = mediaPages.items;
      for (final medium in items) {
        final dateTime = medium.modifiedDate ?? medium.creationDate ?? nowDateTime;
        final mediaInfoList = videoGroupMap[dateTime.dayStart()] ?? [];
        MediaInfo? mediaInfo = await _mediaInfoDao.queryByAssetId(medium.id);
        if (mediaInfo == null) {
          mediaInfo = await MediaInfoUtils.createMediaInfoByMedium(medium);
          if (mediaInfo == null) continue;
          await _mediaInfoDao.insert(mediaInfo);
        }
        if (mediaInfo.isDelete) continue;
        mediaInfoList.add(mediaInfo);
        videoGroupMap[dateTime.dayStart()] = mediaInfoList;
      }
    }
    final entries = videoGroupMap.entries;
    for (final entry in entries) {
      final key = entry.key;
      final mediaInfoList = entry.value;
      final dateTime = DateTime.fromMillisecondsSinceEpoch(key);
      final formats = nowDateTime.year == dateTime.year ? DateFormats.mo_d : DateFormats.y_mo_d;
      final title = dateTime.isToday() ? S.current.today : dateTime.format(format: formats);
      final videoGroup = VideoGroup(title, mediaInfoList.reversed.toList(), key);
      videoGroupList.value.add(videoGroup);
    }
    videoGroupList.sort((a, b) {
      final aDate = a.date;
      final bDate = b.date;
      return bDate.compareTo(aDate);
    });
    setSuccess();
  }
}
