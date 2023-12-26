import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/helper/video_action_helper.dart';

class VideoListPageController {
  final _videoHelper = VideoActionHelper();

  void showMoreDialog(MediaInfo mediaInfo) {
    _videoHelper.showActionDialog(mediaInfo: mediaInfo);
  }
}
