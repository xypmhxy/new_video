import 'dart:async';

import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/bean/play/channel_info.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/helper/video_action_helper.dart';
import 'package:free_tube_player/module/channel/api/channel_api.dart';
import 'package:get/get.dart';

class ChannelChildHomeController {
  final channelInfo = ChannelInfo().obs;
  final videos = <MediaInfo>[].obs;
  final _videoActionHelper = VideoActionHelper();
  StreamSubscription? _streamSubscription;

  ChannelChildHomeController();

  void dispose() {
    _streamSubscription?.cancel();
  }

  void setupChannelInfo(ChannelInfo channelInfo) {
    this.channelInfo.value = channelInfo;
  }

  Future<void> showMoreAction(final MediaInfo mediaInfo) async {
    _videoActionHelper.showActionDialog(mediaInfo: mediaInfo, from: 'channel_home');
  }
}
