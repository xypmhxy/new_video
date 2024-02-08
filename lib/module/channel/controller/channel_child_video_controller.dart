import 'dart:async';

import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/bean/play/channel_info.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/helper/video_action_helper.dart';
import 'package:free_tube_player/module/channel/api/channel_api.dart';
import 'package:get/get.dart';

class ChannelChildVideoController {
  final _channelApi = ChannelApi();
  final videos = <MediaInfo>[].obs;
  final _videoActionHelper = VideoActionHelper();
  final viewStatus = ViewStatus.none.obs;
  late ChannelInfo channelInfo;
  StreamSubscription? _videoSubscription;
  StreamSubscription? _channelSubscription;

  void setup(ChannelInfo channelInfo) {
    this.channelInfo = channelInfo;
  }

  void dispose() {
    _videoSubscription?.cancel();
    _channelSubscription?.cancel();
  }

  Future<void> requestVideos() async {
    viewStatus.value = ViewStatus.loading;
    final tab = channelInfo.channelTabs.first;
    videos.value = await _channelApi.requestVideos(tab.browseId, tab.params);
    for (final video in videos) {
      video.authorId = channelInfo.authorId;
      video.authorThumbnail = channelInfo.avatar;
    }
    viewStatus.value = videos.isNotEmpty ? ViewStatus.success : ViewStatus.failed;
  }

  Future<void> showMoreAction(final MediaInfo mediaInfo) async {
    _videoActionHelper.showActionDialog(mediaInfo: mediaInfo, from: 'channel_home');
  }
}
