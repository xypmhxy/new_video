/*
* 作者 Ren
* 时间  2023/8/5 15:50
*/
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/utils/log_utils.dart';
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

  static Future<MediaInfo?> requestVideoSource(MediaInfo mediaInfo) async {
    final youtubeExplode = YoutubeExplode();
    if (mediaInfo.videoSources?.isEmpty ?? true) {
      try {
        if (mediaInfo.youtubeId == null) return null;
        List<VideoSource> videoSources = [];
        List<AudioSource> audioSource = [];
        if (mediaInfo.isLive) {
          final liveUrl = await youtubeExplode.videos.streams.getHttpLiveStreamUrl(VideoId(mediaInfo.youtubeId!));
          videoSources.add(VideoSource(url: liveUrl));
        } else {
          final manifest = await youtubeExplode.videos.streams.getManifest(mediaInfo.youtubeId!);

          //解析音频
          for (final audioInfo in manifest.audio) {
            if (audioInfo.codec.mimeType.startsWith('audio') == false) continue;
            audioSource.add(parseAudio(audioInfo));
          }
          audioSource.sort((a, b) {
            if (a.bitrate == null || b.bitrate == null) return 0;
            return a.bitrate! > b.bitrate! ? 1 : 0;
          });

          //解析视频
          for (final mux in manifest.video) {
            final videoSource = parseMuxedVideo(mux);
            if (mediaInfo.isNeedAudioTrack(videoSource: videoSource)) {
              videoSource.childSource = audioSource.last;
            }
            videoSources.add(videoSource);
          }
          videoSources.sort((a, b) {
            if (a.width == null || b.width == null) return 0;
            return a.width! > b.width! ? 1 : 0;
          });
        }
        videoSources.removeWhere((element) => element.format != 'mp4');
        mediaInfo.videoSources = videoSources;
        mediaInfo.audioSources = audioSource;
      } catch (e) {
        LogUtils.e('获取播放链接错误 ${e.toString()}');
      }
    }
    youtubeExplode.close();
    return mediaInfo;
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
    final fps = info.framerate.framesPerSecond.toInt();
    return VideoSource(
        url: url,
        label: label,
        format: format,
        byteSize: byteSize,
        bitrate: bitrate,
        width: width,
        height: height,
        fps: fps,
        isOnlyVideo: runTimeType == 'VideoOnlyStreamInfo');
  }

  static AudioSource parseAudio(AudioStreamInfo info) {
    final url = info.url.toString();
    final format = info.codec.subtype;
    final byteSize = info.size.totalBytes;
    final bitrate = info.bitrate.bitsPerSecond;
    return AudioSource(url: url, format: format, byteSize: byteSize, bitrate: bitrate);
  }

  static VideoSource? getTargetVideoUrl(int target, MediaInfo mediaInfo) {
    final videoSources = mediaInfo.videoSources?.where((videoSource) => videoSource.getResolution() <= target).toList();
    if (videoSources?.isEmpty ?? true) return null;
    return videoSources!.last;
  }
}
