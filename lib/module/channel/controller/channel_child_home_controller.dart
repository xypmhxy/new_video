import 'dart:async';

import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/bean/play/channel_info.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/helper/video_action_helper.dart';
import 'package:free_tube_player/module/channel/api/channel_api.dart';
import 'package:get/get.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class ChannelChildHomeController {
  final channelInfo = ChannelInfo().obs;
  final _channelApi = ChannelApi();
  final _youtubeExplode = YoutubeExplode();
  final viewStatus = ViewStatus.none.obs;
  final videos = <MediaInfo>[].obs;
  final _videoActionHelper = VideoActionHelper();
  StreamSubscription? _streamSubscription;

  ChannelChildHomeController();

  void dispose() {
    _streamSubscription?.cancel();
    _youtubeExplode.close();
  }

  void initChannelInfo(ChannelInfo channelInfo) {
    this.channelInfo.value = channelInfo;
  }

  Future<void> requestHomeData() async {
    viewStatus.value = ViewStatus.loading;
    final channel = await _channelApi.requestAuthorInfo(channelInfo.value.authorId!, needVideo: true);
    channel?.authorVideoGroups.removeWhere((element) => element.mediaInfos.isEmpty);
    viewStatus.value = channel == null ? ViewStatus.failed : ViewStatus.success;
    if (channel != null) channelInfo.value = channel;
  }

  Future<void> showMoreAction(final MediaInfo mediaInfo) async {
    _videoActionHelper.showActionDialog(mediaInfo: mediaInfo, from: 'channel_home');
  }
}
