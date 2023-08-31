/*
* 作者 Ren
* 时间  2023/8/12 08:08
*/
import 'package:video_editor/video_editor.dart';

abstract class EditPageCallback{
  void onClickBack();
  void rotate90Degrees(RotateDirection direction);
  void exportCover();
  void exportVideo();
}