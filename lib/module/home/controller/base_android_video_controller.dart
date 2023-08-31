import 'package:app_settings/app_settings.dart';
import 'package:free_tube_player/base/base_controller.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/bean/play/video_group.dart';
import 'package:free_tube_player/db/dao/media_info_dao.dart';
import 'package:free_tube_player/extension/date_time_extension.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/helper/media_info_helper.dart';
import 'package:free_tube_player/utils/date_utils.dart';
import 'package:free_tube_player/utils/media_info_utils.dart';
import 'package:free_tube_player/utils/permission_utils.dart';
import 'package:free_tube_player/utils/toast_utils.dart';
import 'package:free_tube_player/utils/video_utils.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_gallery/photo_gallery.dart';

class BaseAndroidVideoController extends BaseController implements OnMediaInfoChangedListener {
  static const tag = 'HomeFilePageController';
  final videoGroupList = RxList<VideoGroup>();
  final _mediaInfoHelper = MediaInfoHelper.get;
  final hasPermission = false.obs;

  BaseAndroidVideoController() {
    _mediaInfoHelper.addWatcher(this);
  }

  Future<void> checkPermission() async {
    final hasPermission = await PermissionUtils.hasVideoStorage();
    if (hasPermission) {
      this.hasPermission.value = hasPermission;
      queryVideos();
    } else {
      final permissionStatus = await PermissionUtils.requestVideoStorage();
      if (permissionStatus.isGranted) {
        queryVideos();
      } else {
        ToastUtils.show(S.current.noPermissionToast);
      }
    }
  }

  Future<void> queryVideos() async {
  }

  Future<void> rename(MediaInfo mediaInfo, String newName) async {
    videoGroupList.refresh();
    _mediaInfoHelper.sendChangeEvent(MediaInfoChangeWatcher(mediaInfo: mediaInfo, type: DBChangeType.update, tag: tag));
  }

  Future<void> delete(MediaInfo mediaInfo, VideoGroup videoGroup) async {
    videoGroup.mediaInfoList.remove(mediaInfo);
    if (videoGroup.mediaInfoList.isEmpty) {
      videoGroupList.remove(videoGroup);
    }
    videoGroupList.refresh();
    _mediaInfoHelper.sendChangeEvent(MediaInfoChangeWatcher(mediaInfo: mediaInfo, type: DBChangeType.delete, tag: tag));
  }

  Future<void> clearHistory(MediaInfo mediaInfo, VideoGroup videoGroup) async {
    update([mediaInfo.identify]);
    _mediaInfoHelper.sendChangeEvent(MediaInfoChangeWatcher(mediaInfo: mediaInfo, type: DBChangeType.update, tag: tag));
  }

  Future<void> openSetting() async {
    AppSettings.openDateSettings();
  }

  @override
  void onMediaInfoChange(MediaInfoChangeWatcher mediaInfoChangeWatcher) {
    if (mediaInfoChangeWatcher.tag == tag) return;
    final dbType = mediaInfoChangeWatcher.type;
    final mediaInfo = mediaInfoChangeWatcher.mediaInfo;

    int videoGroupIndex = 0;
    int mediaInfoIndex = 0;
    videoGroupIndex = videoGroupList.indexWhere((videoGroup) {
      mediaInfoIndex = videoGroup.mediaInfoList.indexWhere((media) => media.isSame(mediaInfo));
      return mediaInfoIndex >= 0;
    });
    if (videoGroupIndex == -1 || mediaInfoIndex == -1) {
      int groupIndex = videoGroupList.indexWhere((videoGroup) => videoGroup.mediaInfoList.isEmpty);
      if (groupIndex >= 0) {
        videoGroupList.removeAt(groupIndex);
        update([videoGroupList[groupIndex].title]);
      } else {
        update([mediaInfo.identify]);
      }
      return;
    }
    if (dbType == DBChangeType.delete) {
      videoGroupList[videoGroupIndex].mediaInfoList.removeAt(mediaInfoIndex);
      if (videoGroupList[videoGroupIndex].mediaInfoList.isEmpty) {
        videoGroupList.removeAt(videoGroupIndex);
        update([videoGroupList[videoGroupIndex].title]);
      } else {
        update([mediaInfo.identify]);
      }
      videoGroupList.refresh();
    } else if (dbType == DBChangeType.update) {
      videoGroupList[videoGroupIndex].mediaInfoList[mediaInfoIndex] = mediaInfo;
      update([mediaInfo.identify]);
    }
  }
}
