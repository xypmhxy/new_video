/*
* 作者 Ren
* 时间  2023/8/5 10:08
*/
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/bean/play/video_group.dart';
import 'package:free_tube_player/db/dao/media_info_dao.dart';
import 'package:free_tube_player/module/home/controller/base_video_controller.dart';
import 'package:free_tube_player/utils/media_info_utils.dart';
import 'package:free_tube_player/utils/video_data_helper.dart';
import 'package:photo_gallery/photo_gallery.dart';

class HomeFolderPageController extends BaseVideoController {
  final _mediaInfoDao = MediaInfoDao();

  @override
  Future<void> queryVideos() async {
    setLoading();
    videoGroupList.clear();
    final List<Album> videoAlbums = await VideoDataHelper.get.getVideoAlbums();
    final date = DateTime.now().millisecondsSinceEpoch;
    for (final videoAlbum in videoAlbums) {
      if (videoAlbum.isAllAlbum && videoAlbums.length > 1) continue;
      final mediaPages = await videoAlbum.listMedia();
      final items = mediaPages.items;
      final mediaInfoList = <MediaInfo>[];
      for (final medium in items) {
        MediaInfo? mediaInfo = await _mediaInfoDao.queryByAssetId(medium.id);
        if (mediaInfo == null) {
          mediaInfo = await MediaInfoUtils.createMediaInfoByMedium(medium);
          if (mediaInfo == null) continue;
          await _mediaInfoDao.insert(mediaInfo);
        }
        if (mediaInfo.isDelete) continue;
        mediaInfoList.add(mediaInfo);
      }
      VideoGroup videoGroup =
      VideoGroup(videoAlbum.name ?? MediaInfo.defaultTitle, mediaInfoList.reversed.toList(), date);
      if (videoGroup.mediaInfoList.isNotEmpty) {
        videoGroupList.add(videoGroup);
      }
    }
    setSuccess();
  }
}
