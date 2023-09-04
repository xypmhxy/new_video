/*
* 作者 Ren
* 时间  2023/8/31 07:22
*/
import 'package:free_tube_player/bean/tmdb/tmdb_info.dart';

abstract class TMDBDetailPageCallback{
  void onClickBack();
  void onClickItem(TMDBInfo tmdbInfo);
}