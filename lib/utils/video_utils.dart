/*
* 作者 Ren
* 时间  2023/8/5 15:50
*/
import 'package:photo_gallery/photo_gallery.dart';

class VideoUtils {
  static Future<List<Album>> getVideoAlbums() {
    return PhotoGallery.listAlbums(
      mediumType: MediumType.video,
      newest: false,
      hideIfEmpty: true,
    );
  }

}
