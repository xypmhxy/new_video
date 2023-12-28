import 'dart:async';

import 'package:flutter/material.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/base/base_controller.dart';
import 'package:free_tube_player/bean/play/author_info.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/bean/play/playlist.dart';
import 'package:free_tube_player/db/dao/playlist_dao.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/helper/video_action_helper.dart';
import 'package:free_tube_player/module/channel/api/channel_api.dart';
import 'package:free_tube_player/module/player/controller/comment_controller.dart';
import 'package:free_tube_player/utils/toast_utils.dart';
import 'package:get/get.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class UserPlayerPageController extends BaseController {
  final _channelApi = ChannelApi();
  final _youtubeExplode = YoutubeExplode();
  final authorInfo = Rxn<AuthorInfo>();
  final video = Rxn<Video>();
  final _videoActionHelper = VideoActionHelper();
  final _playlistDao = PlaylistDao();
  final isLike = false.obs;
  final fetchPlayInfoStatus = 0.0.obs;
  final panelController = PanelController();

  double brightness = 0.3;
  StreamSubscription? _fetchPlayInfoSubs;

  UserPlayerPageController();

  @override
  dispose() {
    _youtubeExplode.close();
    _fetchPlayInfoSubs?.cancel();
    fetchPlayInfoStatus.value = 0.0;
    ScreenBrightness().setScreenBrightness(brightness);
    super.dispose();
  }

  void setup() async {
    _fetchPlayInfoSubs = userPlayerController.fetchPlayInfoProgress.listen((progress) {
      fetchPlayInfoStatus.value = progress;
    });
    Future.delayed(const Duration(seconds: 6)).then((value) => fetchPlayInfoStatus.value = 0.5);

    brightness = await ScreenBrightness().current;
  }

  Future<void> queryLikeStatus() async {
    isLike.value = await VideoActionHelper.queryLikeStatus(userPlayerController.nowPlayingMedia);
  }

  Future<void> requestWatchPageInfo(MediaInfo mediaInfo) async {
    try {
      queryLikeStatus();
      final video = await _youtubeExplode.videos.get(mediaInfo.youtubeId);
      this.video.value = video;
      if (video.hasWatchPage) {
        final watchPage = video.watchPage;
        mediaInfo.likeCount = watchPage?.videoLikeCount;
        mediaInfo.dislikeCount = watchPage?.videoDislikeCount;
        userPlayerController.refreshMediaInfo();
      }
    } catch (_) {}
  }

  Future<void> requestAuthorInfo(String channelId) async {
    final authorInfo = await _channelApi.requestAuthorInfo(channelId);
    if (authorInfo == null) return;
    this.authorInfo.value = authorInfo;
  }

  Future<void> showCommentDialog(BuildContext context, CommentController commentController) async {
    panelController.open();
  }

  Future<void> onClickLike() async {
    final mediaInfo = userPlayerController.nowPlayingMedia;
    if (mediaInfo == null) return;
    final playlist = await _playlistDao.queryByType(PlaylistType.like);
    if (playlist == null) return;
    if (isLike.value) {
      final result = await _videoActionHelper.removeFromPlaylist(playlist, mediaInfo);
      ToastUtils.show(result ? S.current.removePlaylistSuccess : S.current.removePlaylistFailed, isCorrect: result);
    } else {
      final result = await _videoActionHelper.addToPlaylist(playlist, mediaInfo);
      ToastUtils.show(result > 0 ? S.current.addToPlaylistSuccess : S.current.addToPlaylistFailed,
          isCorrect: result > 0);
    }

    queryLikeStatus();
  }
}
