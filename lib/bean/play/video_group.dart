/*
* 作者 Ren
* 时间  2023/8/5 16:17
*/
import 'package:free_tube_player/bean/play/media_info.dart';

class VideoGroup {
  List<MediaInfo> mediaInfoList = [];
  String title;
  int date;

  VideoGroup(this.title, this.mediaInfoList, this.date);
}
