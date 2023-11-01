import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/db/dao/media_info_dao.dart';
import 'package:free_tube_player/utils/dialog_utils.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_view.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class DialogDownload extends StatefulWidget {
  final MediaInfo mediaInfo;

  const DialogDownload({Key? key, required this.mediaInfo}) : super(key: key);

  @override
  State<DialogDownload> createState() => _DialogDownloadState();
}

class _DialogDownloadState extends State<DialogDownload> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 120, maxHeight: 160),
      decoration: allRadiusDecoration(16, color: AppThemeController.backgroundColor(context)),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [const Height(4), _closeButton(), const Height(16), _title()],
      ),
    );
  }

  Widget _closeButton() {
    return Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
            onTap: () {
              DialogUtils.dismiss();
            },
            child: Container(
              margin: const EdgeInsets.only(right: 4, top: 4),
              padding: const EdgeInsets.all(4),
              child: GestureDetector(
                child: const Icon(
                  Icons.close_rounded,
                ),
              ),
            )));
  }

  Widget _title() {
    return Row(
      children: [
        ClipRRect(
            borderRadius: getBorderRadius(4),
            child: ImageView.network(
              imageUrl: mediaInfo.thumbnail ?? '',
              size: 36,
            )),
        const Width(12),
        TextView.primary(mediaInfo.title, fontSize: 14)
      ],
    );
  }

  MediaInfo get mediaInfo => widget.mediaInfo;
}

class DownloadDialogController {
  final _youtubeExplode = YoutubeExplode();
  final _mediaDao = MediaInfoDao();

  Future<void> requestVideoSource(MediaInfo mediaInfo) async {
    if (mediaInfo.videoSources?.isEmpty ?? true) {
      try {
        if (mediaInfo.youtubeId == null) return;
        List<VideoSource> videoSources = [];
        List<AudioSource> audioSource = [];
        if (mediaInfo.isLive) {
          final liveUrl = await _youtubeExplode.videos.streams.getHttpLiveStreamUrl(VideoId(mediaInfo.youtubeId!));
          videoSources.add(VideoSource(url: liveUrl));
        } else {
          final manifest = await _youtubeExplode.videos.streams.getManifest(mediaInfo.youtubeId!);
          for (final mux in manifest.video) {
            videoSources.add(VideoUtils.parseMuxedVideo(mux));
          }
          videoSources.sort((a, b) {
            if (a.width == null || b.width == null) return 0;
            return a.width! > b.width! ? 1 : 0;
          });

          for (final audioInfo in manifest.audio) {
            audioSource.add(VideoUtils.parseAudio(audioInfo));
          }
          audioSource.sort((a, b) {
            if (a.bitrate == null || b.bitrate == null) return 0;
            return a.bitrate! > b.bitrate! ? 1 : 0;
          });
        }
        mediaInfo.videoSources = videoSources;
        mediaInfo.audioSources = audioSource;
      } catch (e) {
        LogUtils.e('获取播放链接错误 ${e.toString()}');
      }
    }
  }
}
