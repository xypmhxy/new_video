/*
* 作者 Ren
* 时间  2023/8/10 07:14
*/

import 'package:flutter/material.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/bean/play/video_group.dart';
import 'package:free_tube_player/dialog/dialog_confirm.dart';
import 'package:free_tube_player/dialog/dialog_more_action.dart';
import 'package:free_tube_player/dialog/dialog_rename.dart';
import 'package:free_tube_player/helper/media_info_helper.dart';
import 'package:free_tube_player/module/edit/page/edit_page.dart';
import 'package:free_tube_player/utils/dialog_utils.dart';
import 'package:free_tube_player/utils/page_navigation.dart';

import '../generated/l10n.dart';

class ImpMoreAction {

  void showDialog(
      {required VideoGroup videoGroup,
      required MediaInfo mediaInfo,
      PlayHistory? playHistory,
      VoidCallback? onDelete,
      VoidCallback? onHistoryDelete,
      ValueChanged<String>? onRename,
      VoidCallback? onClickVideoEditor,
      bool isShowHistory = false}) {
    DialogUtils.showBottomSheet(
        DialogMoreAction(
          onClickDelete: () {
            _showConfirmDialog(videoGroup, mediaInfo, onDelete: onDelete);
          },
          onClickRename: () async {
            _showRenameDialog(mediaInfo, onRename: onRename);
          },
          onClickVideoEditor: onClickVideoEditor ??
              () {
                PageNavigation.startNewPage(EditPage(filePath: mediaInfo.localPath!));
                DialogUtils.dismiss();
              },
          onClickDeleteHistory: () {
            _showDeleteHistoryConfirmDialog(videoGroup, mediaInfo, onDelete: onHistoryDelete);
          },
        ),
        tag: 'dialogMoreAction');
  }

  void _showConfirmDialog(VideoGroup videoGroup, MediaInfo mediaInfo, {VoidCallback? onDelete}) {
    DialogUtils.showCenterDialog(DialogConfirm(
      title: S.current.confirmDelete,
      onCancel: () {
        DialogUtils.dismiss();
      },
      onConfirm: () async {
        await MediaInfoHelper.get.delete(mediaInfo);
        DialogUtils.dismiss();
        DialogUtils.dismiss(tag: 'dialogMoreAction');
        onDelete?.call();
      },
    ));
  }

  void _showRenameDialog(MediaInfo mediaInfo, {ValueChanged<String>? onRename}) {
    DialogUtils.showCenterDialog(DialogRename(
        nowName: mediaInfo.title,
        onConfirm: (newName) async {
          await MediaInfoHelper.get.rename(mediaInfo, newName);
          DialogUtils.dismiss();
          DialogUtils.dismiss(tag: 'dialogMoreAction');
          onRename?.call(newName);
        }));
  }

  void _showDeleteHistoryConfirmDialog(VideoGroup videoGroup, MediaInfo mediaInfo, {VoidCallback? onDelete}) {
    DialogUtils.showCenterDialog(DialogConfirm(
      title: S.current.confirmDelete,
      onCancel: () {
        DialogUtils.dismiss();
      },
      onConfirm: () async {
        await MediaInfoHelper.get.clearPlayPosition(mediaInfo);
        DialogUtils.dismiss();
        DialogUtils.dismiss(tag: 'dialogMoreAction');
        onDelete?.call();
      },
    ));
  }
}
