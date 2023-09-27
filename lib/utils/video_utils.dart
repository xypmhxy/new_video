/*
* 作者 Ren
* 时间  2023/8/5 15:50
*/
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class VideoUtils {
  static Future<List<Album>> getVideoAlbums() {
    return PhotoGallery.listAlbums(
      mediumType: MediumType.video,
      newest: false,
      hideIfEmpty: true,
    );
  }

  static VideoSource parseMuxedVideo(VideoStreamInfo info) {
    final runTimeType = info.runtimeType.toString();
    final url = info.url.toString();
    final label = info.qualityLabel;
    final format = info.container.name;
    final byteSize = info.size.totalBytes;
    final bitrate = info.bitrate.bitsPerSecond;
    final width = info.videoResolution.width;
    final height = info.videoResolution.height;
    return VideoSource(
        url: url,
        label: label,
        format: format,
        byteSize: byteSize,
        bitrate: bitrate,
        width: width,
        height: height,
        isOnlyVideo: runTimeType == 'VideoOnlyStreamInfo');
  }

  static AudioSource parseAudio(AudioStreamInfo info) {
    final url = info.url.toString();
    final byteSize = info.size.totalBytes;
    final bitrate = info.bitrate.bitsPerSecond;
    return AudioSource(url: url, byteSize: byteSize, bitrate: bitrate);
  }

  static VideoSource? getTargetVideoUrl(int target, MediaInfo mediaInfo) {
    bool isOnlyVideo = false;
    if (target >= 1080) {
      isOnlyVideo = true;
    }
    final videoSources = mediaInfo.videoSources
        ?.where((videoSource) => videoSource.getResolution() <= target && videoSource.isOnlyVideo == isOnlyVideo)
        .toList();
    if (videoSources?.isEmpty ?? true) return null;
    return videoSources!.last;
  }
}
