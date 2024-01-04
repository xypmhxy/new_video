/*
* 作者 Ren
* 时间  2023/8/10 07:14
*/

import 'package:flutter/material.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/bean/play/playlist.dart';
import 'package:free_tube_player/bean/play/playlist_wrapper.dart';
import 'package:free_tube_player/db/dao/media_info_dao.dart';
import 'package:free_tube_player/db/dao/playlist_dao.dart';
import 'package:free_tube_player/dialog/dialog_confirm.dart';
import 'package:free_tube_player/dialog/dialog_download.dart';
import 'package:free_tube_player/dialog/dialog_user_more_action.dart';
import 'package:free_tube_player/helper/media_info_helper.dart';
import 'package:free_tube_player/utils/dialog_utils.dart';
import 'package:free_tube_player/utils/share_utils.dart';
import 'package:free_tube_player/utils/toast_utils.dart';
import 'package:get/get.dart';

import '../generated/l10n.dart';

class VideoActionHelper {
  final _playlistDao = PlaylistDao();
  final _mediaDao = MediaInfoDao();

  void showActionDialog(
      {required MediaInfo mediaInfo,
      VoidCallback? onRemove,
      VoidCallback? onDeleteHistory,
      ValueChanged<String>? onRename,
      VoidCallback? onClickVideoEditor,
      bool isShowDownload = true,
      bool isShowHistory = false,
      bool isShowRemove = false}) {
    DialogUtils.showBottomSheet(
        DialogUserMoreAction(
          mediaInfo: mediaInfo,
          isShowHistory: isShowHistory,
          isShowRemove: isShowRemove,
          isShowDownload: isShowDownload,
          onClickLike: () async {
            await _onClickLike(mediaInfo);
          },
          onClickDownload: () {
            _showDownloadDialog(mediaInfo);
          },
          onClickShare: () {
            if (mediaInfo.youtubeId == null) return;
            ShareUtils.shareText('https://www.youtube.com/watch?v=${mediaInfo.youtubeId}');
          },
          onClickWatchLater: () async {
            await onClickWatchLater(mediaInfo);
          },
          onClickDeleteHistory: () {
            onClickDeleteHistory(mediaInfo, onDelete: onDeleteHistory);
          },
          onClickRemove: onRemove,
        ),
        tag: 'user_action_dialog');
  }

  void _showDownloadDialog(MediaInfo mediaInfo, {VoidCallback? onDelete}) {
    DialogUtils.showBottomSheet(DialogDownload(
      mediaInfo: mediaInfo,
      onClickDownload: (mediaSource) {
        onClickDownloadButton(mediaInfo, mediaSource);
      },
    ));
  }

  Future<void> _onClickLike(MediaInfo mediaInfo) async {
    final playlist = await _playlistDao.queryByType(PlaylistType.like);
    if (playlist == null) return;
    final p = await _playlistDao.queryExistPlaylistMedia(playlist.id, mediaInfo.id);
    if (p == null) {
      await addToPlaylist(playlist, mediaInfo);
    } else {
      await removeFromPlaylist(playlist, mediaInfo);
    }
  }

  void onClickDownloadButton(MediaInfo mediaInfo, BaseMediaSource mediaSource) {
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
  }

  Future<void> onClickWatchLater(MediaInfo mediaInfo) async {
    final playlist = await _playlistDao.queryByType(PlaylistType.watchLater);
    if (playlist == null) return;
    final dbMedia = playlist.mediaInfoList.firstWhereOrNull((element) => element.identify == mediaInfo.identify);
    if (dbMedia == null) {
      final result = await addToPlaylist(playlist, mediaInfo);
      ToastUtils.show(result > 0 ? S.current.addWatchLaterSuccess : S.current.addToPlaylistFailed,
          isCorrect: result > 0);
    } else {
      final result = await removeFromPlaylist(playlist, mediaInfo);
      ToastUtils.show(result ? S.current.removePlaylistSuccess : S.current.removePlaylistFailed, isCorrect: result);
    }
  }

  Future<void> onClickDeleteHistory(MediaInfo mediaInfo, {VoidCallback? onDelete}) async {
    DialogUtils.showCenterDialog(DialogConfirm(
      title: S.current.confirmDeleteHistory,
      onCancel: () {
        DialogUtils.dismiss();
      },
      onConfirm: () async {
        await MediaInfoHelper.get.clearPlayPosition(mediaInfo);
        DialogUtils.dismiss();
        DialogUtils.dismiss(tag: 'user_action_dialog');
        onDelete?.call();
      },
    ));
  }

  Future<void> onClickRemove(MediaInfo mediaInfo, {VoidCallback? onRemove}) async {
    DialogUtils.showCenterDialog(DialogConfirm(
      title: S.current.removeFromListConfirm,
      onCancel: () {
        DialogUtils.dismiss();
      },
      onConfirm: () async {
        await MediaInfoHelper.get.clearPlayPosition(mediaInfo);
        DialogUtils.dismiss();
        DialogUtils.dismiss(tag: 'user_action_dialog');
        onRemove?.call();
      },
    ));
  }

  Future<int> addToPlaylist(Playlist playlist, MediaInfo mediaInfo) async {
    if (mediaInfo.id < 0) {
      final result = await _mediaDao.insert(mediaInfo);
      if (result <= 0) return -1;
    }
    final nowDate = DateTime.now().millisecondsSinceEpoch;
    playlist.createTime ??= nowDate;
    playlist.updateTime = nowDate;
    await _playlistDao.insert(playlist);
    final p = await _playlistDao.queryExistPlaylistMedia(playlist.id, mediaInfo.id);
    if (p != null) return p.id;
    final playlistWrapper = PlaylistWrapper.create(mediaId: mediaInfo.id, playlistId: playlist.id);
    return _playlistDao.insertMedia(playlistWrapper);
  }

  Future<bool> removeFromPlaylist(Playlist playlist, MediaInfo mediaInfo) async {
    if (mediaInfo.id < 0) return false;
    final playlistWrapper = await _playlistDao.queryExistPlaylistMedia(playlist.id, mediaInfo.id);
    if (playlistWrapper == null) return false;
    return _playlistDao.removeMedia(playlistWrapper);
  }

  static Future<bool> queryLikeStatus(MediaInfo? mediaInfo) async {
    if (mediaInfo == null || mediaInfo.id < 0) return false;
    final playlistDao = PlaylistDao();
    final playlist = await playlistDao.queryByType(PlaylistType.like);
    if (playlist != null) {
      final result = await playlistDao.queryExistPlaylistMedia(playlist.id, mediaInfo.id);
      return result != null;
    }
    return false;
  }

  static Future<bool> queryWatchLaterStatus(MediaInfo? mediaInfo) async {
    if (mediaInfo == null || mediaInfo.id < 0) return false;
    final playlistDao = PlaylistDao();
    final playlist = await playlistDao.queryByType(PlaylistType.watchLater);
    if (playlist != null) {
      final result = await playlistDao.queryExistPlaylistMedia(playlist.id, mediaInfo.id);
      return result != null;
    }
    return false;
  }
}
