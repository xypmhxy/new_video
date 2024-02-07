import 'dart:async';

import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/bean/play/channel_info.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/module/channel/api/channel_api.dart';
import 'package:get/get.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class ChannelDetailController {
  final channelInfo = ChannelInfo().obs;
  final _channelApi = ChannelApi();
  final _youtubeExplode = YoutubeExplode();
  final infoLoadStatus = ViewStatus.none.obs;
  final videos = <MediaInfo>[].obs;
  StreamSubscription? _streamSubscription;

  ChannelDetailController();

  void dispose() {
    _streamSubscription?.cancel();
    _youtubeExplode.close();
  }

  void initChannelInfo(ChannelInfo channelInfo) {
    this.channelInfo.value = channelInfo;
  }

  Future<void> requestDetail() async {
    infoLoadStatus.value = ViewStatus.loading;
    final channel = await _channelApi.requestAuthorInfo(channelInfo.value.authorId!, needVideo: true);
    infoLoadStatus.value = channel == null ? ViewStatus.failed : ViewStatus.success;
    if (channel != null) channelInfo.value = channel;
    // _streamSubscription = _youtubeExplode.channels.getUploads(channelInfo.value.authorId!).listen((video) {
    //   final mediaInfo = MediaInfo();
    //   mediaInfo.youtubeId = video.id.value;
    //   mediaInfo.title = video.title;
    //   mediaInfo.author = video.author;
    //   mediaInfo.authorId = video.channelId.value;
    //   mediaInfo.thumbnail = video.thumbnails.highResUrl;
    //   mediaInfo.authorThumbnail = channelInfo.value.bigAvatar;
    //   videos.add(mediaInfo);
    // });
  }
}
