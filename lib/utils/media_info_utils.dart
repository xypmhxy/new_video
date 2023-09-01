/*
* 作者 Ren
* 时间  2023/8/5 16:02
*/
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:photo_gallery/photo_gallery.dart';

class MediaInfoUtils {
  static Future<MediaInfo?> createMediaInfoByMedium(Medium medium) async {
    try {
      final path = (await medium.getFile()).path;
      final thumbnail = await medium.getThumbnail(width: 512, height: 512);
      return MediaInfo.create(
        title: medium.title ?? medium.filename ?? MediaInfo.defaultTitle,
        assetsId: medium.id,
        width: medium.width,
        height: medium.height,
        byteSize: medium.size,
        duration: medium.duration,
        createDate: medium.creationDate?.millisecondsSinceEpoch ?? 0,
        assetsCreateDate: medium.creationDate?.millisecondsSinceEpoch ?? 0,
        updateDate: medium.modifiedDate?.millisecondsSinceEpoch ?? 0,
        localPath: path,
        localBytesThumbnail: thumbnail,
      );
    } catch (_) {}
    return null;
  }
}
