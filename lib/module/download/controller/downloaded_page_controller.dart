/*
* 作者 Ren
* 时间  2024/1/1 18:12
*/

import 'dart:async';

import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/bean/play/playlist.dart';
import 'package:free_tube_player/db/dao/media_info_dao.dart';
import 'package:free_tube_player/dialog/dialog_confirm.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/helper/video_action_helper.dart';
import 'package:free_tube_player/utils/dialog_utils.dart';
import 'package:get/get.dart';

class DownloadedPageController {
  final _mediaDao = MediaInfoDao();
  final downloadedList = <MediaInfo>[].obs;
  final _videoHelper = VideoActionHelper();
  StreamSubscription? _downloadSubscription;

  DownloadedPageController() {
    _downloadSubscription = globalDownloadController.downloadList.listen((_) {
      queryDownloadCompleteVideos();
    });
  }

  void dispose() {
    _downloadSubscription?.cancel();
  }

  Future<void> queryDownloadCompleteVideos() async {
    downloadedList.clear();
    downloadedList.addAll((await _mediaDao.queryDownloadComplete()).reversed);
  }

  void showMoreDialog(MediaInfo mediaInfo, {Playlist? playlist}) {
    _videoHelper.showActionDialog(
        isShowRemove: playlist != null,
        mediaInfo: mediaInfo,
        onRemove: () {
          DialogUtils.showCenterDialog(DialogConfirm(
            title: S.current.removeFromListConfirm,
            onCancel: () {
              DialogUtils.dismiss();
            },
            onConfirm: () async {
              DialogUtils.dismiss();
              DialogUtils.dismiss();
              final result = await _videoHelper.removeFromPlaylist(playlist!, mediaInfo);
              if (result) {
                downloadedList.remove(mediaInfo);
              }
            },
          ));
        });
  }
}
