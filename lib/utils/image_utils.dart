/*
* 作者 Ren
* 时间  2023/8/12 10:57
*/

import 'package:image_gallery_saver/image_gallery_saver.dart';

class ImageUtils {
  static Future<dynamic> saveImageFromFile(String file) {
    return ImageGallerySaver.saveFile(file);
  }
}
