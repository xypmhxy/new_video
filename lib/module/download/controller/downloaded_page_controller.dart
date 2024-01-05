/*
* 作者 Ren
* 时间  2024/1/1 18:12
*/

import 'dart:async';
import 'dart:io';

import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/db/dao/media_info_dao.dart';
import 'package:free_tube_player/dialog/dialog_confirm.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/helper/video_action_helper.dart';
import 'package:free_tube_player/utils/dialog_utils.dart';
import 'package:free_tube_player/utils/file_utils.dart';
import 'package:free_tube_player/utils/log_utils.dart';
import 'package:get/get.dart';

class DownloadedPageController {
  final _mediaDao = MediaInfoDao();
  final _videoHelper = VideoActionHelper();
  final repeatMap = <String, List<DownloadedMediaInfo>>{};
  final downloadGroupList = <List<DownloadedMediaInfo>>[].obs;
  final expandMap = <String, bool>{}.obs;
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
    var downloadList = await _mediaDao.queryDownloadComplete();
    repeatMap.clear();
    downloadGroupList.clear();

    downloadList = downloadList.reversed.toList();
    for (final mediaInfo in downloadList) {
      if (mediaInfo.videoSources == null) continue;
      for (final videoSource in mediaInfo.videoSources!) {
        if (videoSource.isDownloadAvailable == false) continue;
        final mediaInfoList = repeatMap[mediaInfo.identify] ?? <DownloadedMediaInfo>[];
        mediaInfoList.add(DownloadedMediaInfo(mediaInfo: mediaInfo, mediaSource: videoSource));
        repeatMap[mediaInfo.identify] = mediaInfoList;
      }
    }

    for (final entry in repeatMap.values) {
      downloadGroupList.add(entry);
    }
  }

  void togglePanelExpand(DownloadedMediaInfo downloadedMediaInfo) {
    final isExpand = expandMap[downloadedMediaInfo.mediaInfo.identify] ?? false;
    expandMap[downloadedMediaInfo.mediaInfo.identify] = !isExpand;
  }

  void showMoreDialog(DownloadedMediaInfo downloadedMediaInfo,
      {required List<DownloadedMediaInfo> downloadMediaInfoList}) {
    _videoHelper.showActionDialog(
        isShowDownload: false,
        isShowRemove: true,
        mediaInfo: downloadedMediaInfo.mediaInfo,
        onRemove: () {
          DialogUtils.showCenterDialog(DialogConfirm(
            title: S.current.removeDownloadConfirmText,
            onCancel: () {
              DialogUtils.dismiss();
            },
            onConfirm: () async {
              DialogUtils.dismiss();
              DialogUtils.dismiss();
              await removeMedia(downloadedMediaInfo);
              downloadMediaInfoList.remove(downloadedMediaInfo);
              if (downloadMediaInfoList.isEmpty) {
                downloadGroupList.remove(downloadMediaInfoList);
              } else {
                downloadGroupList.refresh();
              }
            },
          ));
        });
  }

  void showDeleteAllDialog(MediaInfo mediaInfo) {
    final downloadedMediaInfoList =
        downloadGroupList.firstWhereOrNull((element) => element.first.mediaInfo.identify == mediaInfo.identify);
    if (downloadedMediaInfoList == null) return;
    DialogUtils.showCenterDialog(DialogConfirm(
      title: S.current.removeAllConfirm,
      onCancel: () {
        DialogUtils.dismiss();
      },
      onConfirm: () async {
        DialogUtils.dismiss();
        DialogUtils.dismiss();
        for (final downloadedMediaInfo in downloadedMediaInfoList) {
          await removeMedia(downloadedMediaInfo);
        }
        downloadGroupList.remove(downloadedMediaInfoList);
      },
    ));
  }

  Future<void> removeMedia(DownloadedMediaInfo downloadedMediaInfo) async {
    final mediaInfo = downloadedMediaInfo.mediaInfo;
    final videoSource = downloadedMediaInfo.mediaSource;
    final videoSourcePath = videoSource.downloadPath;
    if (videoSourcePath == null) {
      videoSource.clearDownload();
      return;
    }
    final filePath = await FileUtils.getDownloadFilePath(videoSourcePath);
    final file = File(filePath);
    if (file.existsSync()) {
      file.deleteSync();
    }

    final audioSourcePath = videoSource.audioSource?.downloadPath;
    if (audioSourcePath != null) {
      final audioFilePath = await FileUtils.getDownloadFilePath(audioSourcePath);
      final audioFile = File(audioFilePath);
      if (audioFile.existsSync()) {
        audioFile.deleteSync();
      }
    }

    videoSource.clearDownload();
    await _mediaDao.insert(mediaInfo);
  }
}

class DownloadedMediaInfo {
  MediaInfo mediaInfo;
  BaseMediaSource mediaSource;

  DownloadedMediaInfo({required this.mediaInfo, required this.mediaSource});
}
