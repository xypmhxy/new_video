/*
* 作者 Ren
* 时间  2023/8/5 16:30
*/
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/bean/play/video_group.dart';

abstract class HomeFilePageCallback {
  void onItemClick(MediaInfo mediaInfo);

  void onItemMoreClick(MediaInfo mediaInfo, VideoGroup videoGroup);

  void onClickAll(VideoGroup videoGroup);

  void onClickImport();
}
