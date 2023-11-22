/*
* 作者 Ren
* 时间  2023/8/10 07:14
*/

import 'package:flutter/material.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/bean/play/video_group.dart';
import 'package:free_tube_player/dialog/dialog_confirm.dart';
import 'package:free_tube_player/dialog/dialog_download.dart';
import 'package:free_tube_player/dialog/dialog_more_action.dart';
import 'package:free_tube_player/dialog/dialog_rename.dart';
import 'package:free_tube_player/dialog/dialog_user_more_action.dart';
import 'package:free_tube_player/helper/media_info_helper.dart';
import 'package:free_tube_player/module/edit/page/edit_page.dart';
import 'package:free_tube_player/utils/dialog_utils.dart';
import 'package:free_tube_player/utils/page_navigation.dart';

import '../generated/l10n.dart';

class VideoActionHelper {
  void showActionDialog(
      {required MediaInfo mediaInfo,
      VoidCallback? onDelete,
      VoidCallback? onHistoryDelete,
      ValueChanged<String>? onRename,
      VoidCallback? onClickVideoEditor,
      bool isShowHistory = false}) {
    DialogUtils.showBottomSheet(DialogUserMoreAction(
      onClickDownload: () {
        _showDownloadDialog(mediaInfo);
      },
    ));
  }

  void _showDownloadDialog(MediaInfo mediaInfo, {VoidCallback? onDelete}) {
    DialogUtils.showBottomSheet(DialogDownload(
      mediaInfo: mediaInfo,
      onClickDownload: (mediaSource) {
        if (mediaSource.isInQueue || mediaSource.isSuccess) {
          DialogUtils.showCenterDialog(DialogConfirm(
            title: S.current.removeDownloadConfirmText,
            onConfirm: () {
              globalDownloadController.remove(mediaInfo, mediaSource: mediaSource);
              DialogUtils.dismiss();
            },
          ));
        } else {
          globalDownloadController.downloadMedia(mediaInfo: mediaInfo, mediaSource: mediaSource);
        }
      },
    ));
  }
}
