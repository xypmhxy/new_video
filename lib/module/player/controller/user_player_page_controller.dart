import 'package:free_tube_player/api/play_api.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/base/base_controller.dart';
import 'package:free_tube_player/bean/play/author_info.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/module/channel/api/channel_api.dart';
import 'package:get/get.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class UserPlayerPageController extends BaseController {
  final _playApi = PlayApi();
  final _channelApi = ChannelApi();
  final _youtubeExplode = YoutubeExplode();
  final recommendVideos = <MediaInfo>[].obs;
  final authorInfo = Rxn<AuthorInfo>();
  final recommendViewStatus = ViewStatus.none.obs;

  @override
  dispose() {
    _youtubeExplode.close();
    super.dispose();
  }

  Future<void> requestRecommend(String youtubeId) async {
    recommendViewStatus.value = ViewStatus.loading;
    final videos = await _playApi.requestRecommend(youtubeId: youtubeId);
    recommendVideos.clear();
    recommendVideos.addAll(videos);
    if (videos.isEmpty){
      recommendViewStatus.value = ViewStatus.empty;
    }else{
      recommendViewStatus.value = ViewStatus.success;
    }
  }

  Future<void> requestWatchPageInfo(MediaInfo mediaInfo) async {
    final video = await _youtubeExplode.videos.get(mediaInfo.youtubeId);
    if (video.hasWatchPage) {
      final watchPage = video.watchPage;
      mediaInfo.likeCount = watchPage?.videoLikeCount;
      mediaInfo.dislikeCount = watchPage?.videoDislikeCount;
      userPlayerController.refreshMediaInfo();
    }
  }

  Future<void> requestAuthorInfo(String channelId) async {
    final authorInfo = await _channelApi.requestAuthorInfo(channelId);
    if (authorInfo == null) return;
    this.authorInfo.value = authorInfo;
  }
}
