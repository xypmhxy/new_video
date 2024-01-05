/*
* 作者 Ren
* 时间  2023/12/17 11:03
*/
import 'dart:async';

import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/bean/play/playlist.dart';
import 'package:free_tube_player/db/dao/media_info_dao.dart';
import 'package:free_tube_player/db/dao/playlist_dao.dart';
import 'package:free_tube_player/helper/video_action_helper.dart';
import 'package:get/get.dart';

import 'user_home_tab_page_controller.dart';

class UserLibraryPageController {
  final _mediaDao = MediaInfoDao();
  final _playlistDao = PlaylistDao();
  final historyVideos = <MediaInfo>[].obs;
  final likedVideos = <MediaInfo>[].obs;
  final watchLaterVideos = <MediaInfo>[].obs;
  final downloadedCount = 0.obs;
  final historyViewStatus = ViewStatus.none.obs;
  final _videoActionHelper = VideoActionHelper();

  Playlist? watchLaterList;
  Playlist? likePlaylist;
  UserHomeTabPageController? _homeTabPageController;

  void setup() {
    final hasUserHomeController = Get.isRegistered<UserHomeTabPageController>();
    if (hasUserHomeController) {
      _homeTabPageController = Get.find<UserHomeTabPageController>();
      _homeTabPageController?.pageChangeStreamController.stream.listen((index) {
        if (index == 3) {
          queryHistory();
          queryLikedAndLater();
        }
      });
    }
    globalDownloadController.prepareDownloadingList();
  }

  Future<void> queryHistory() async {
    bool needRefresh = historyViewStatus.value != ViewStatus.none;
    if (historyViewStatus.value == ViewStatus.none) {
      historyViewStatus.value = ViewStatus.loading;
    }
    historyVideos.value = await _mediaDao.queryAllPlayHistory(limit: 15);
    if (historyVideos.isEmpty) {
      historyViewStatus.value = ViewStatus.empty;
    } else {
      historyViewStatus.value = ViewStatus.success;
    }
    if (needRefresh) historyViewStatus.refresh();
  }

  Future<void> queryLikedAndLater() async {
    final likePlaylist = await _playlistDao.queryByType(PlaylistType.like);
    if (likePlaylist != null) {
      this.likePlaylist = likePlaylist;
      likedVideos.clear();
      likedVideos.addAll(likePlaylist.mediaInfoList);
    }

    final watchLaterList = await _playlistDao.queryByType(PlaylistType.watchLater);
    if (watchLaterList != null) {
      this.watchLaterList = watchLaterList;
      watchLaterVideos.clear();
      watchLaterVideos.addAll(watchLaterList.mediaInfoList);
    }
  }

  Future<void> queryDownloadComplete() async {
    final downloadList = await _mediaDao.queryDownloadComplete();
    downloadedCount.value = 0;
    for (final download in downloadList) {
      final videoSources = download.videoSources;
      if (videoSources == null) continue;
      for (final videoSource in videoSources) {
        if (videoSource.isDownloadAvailable) downloadedCount.value++;
      }
    }
  }

  Future<void> showMoreDialog(MediaInfo mediaInfo) async {
    _videoActionHelper.showActionDialog(
        mediaInfo: mediaInfo,
        from: 'lib_history',
        isShowHistory: true,
        onDeleteHistory: () {
          historyVideos.removeWhere((element) => element.identify == mediaInfo.identify);
          historyViewStatus.refresh();
        });
  }
}
