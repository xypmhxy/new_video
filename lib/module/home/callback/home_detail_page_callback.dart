/*
* 作者 Ren
* 时间  2023/8/7 20:42
*/
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/bean/play/video_group.dart';

abstract class HomeDetailPageCallback {
  void onClickBack();

  void onItemClick(MediaInfo mediaInfo);

  void onItemMoreClick(VideoGroup videoGroup, MediaInfo mediaInfo);
}
