/*
* 作者 Ren
* 时间  2023/11/11 14:09
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/download_view.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:get/get.dart';

class AudioChildTab extends StatefulWidget {
  final MediaInfo mediaInfo;
  final Function(BaseMediaSource mediaSource)? onClickDownload;

  const AudioChildTab({super.key, required this.mediaInfo, this.onClickDownload});

  @override
  State<AudioChildTab> createState() => _AudioChildTabState();
}

class _AudioChildTabState extends State<AudioChildTab> with AutomaticKeepAliveClientMixin {
  List<AudioSource> audioSources = [];
  AudioSource? selectedAudioSource;

  @override
  void initState() {
    dealVideoSources();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AudioChildTab oldWidget) {
    dealVideoSources();
    super.didUpdateWidget(oldWidget);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.separated(
        padding: EdgeInsets.zero,
        itemBuilder: (_, index) {
          final videoSource = audioSources[index];
          return GestureDetector(
              onTap: () {
                selectedAudioSource = videoSource;
                setState(() {});
              },
              child: Container(
                color: Colors.transparent,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 6,
                      children: [
                        ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: screenWidth * .75),
                            child: TextView.primary(
                              mediaInfo.title,
                              fontSize: 16,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold,
                            )),
                        TextView.accent(
                          '${videoSource.formatBitrate()}  ·  ${videoSource.formatSize()}  ·  ${videoSource.format}',
                          fontSize: 14,
                        )
                      ],
                    ),
                    const Width(12),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.only(right: 10),
                        child: DownloadView(
                          mediaInfo: mediaInfo,
                          baseMediaSource: videoSource,
                          onClickDownload: () {
                            widget.onClickDownload?.call(videoSource);
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ));
        },
        separatorBuilder: (_, index) {
          return const Height(2);
        },
        itemCount: audioSources.length);
  }

  void dealVideoSources() {
    this.audioSources.clear();
    final audioSources = mediaInfo.audioSources?.reversed.toList() ?? [];
    for (final audioSource in audioSources) {
      this.audioSources.add(audioSource);
      // if (videoSource.format != 'mp4') continue;
      // final existVideoSource = this.videoSources.firstWhereOrNull((element) => element.label == videoSource.label);
      // if (existVideoSource != null) continue;
      // this.videoSources.add(videoSource);
    }
  }

  MediaInfo get mediaInfo => widget.mediaInfo;
}
