/*
* 作者 Ren
* 时间  2023/11/11 14:05
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/download_view.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:get/get.dart';

class VideoChildTab extends StatefulWidget {
  final MediaInfo mediaInfo;
  final Function(BaseMediaSource mediaSource)? onClickDownload;

  const  VideoChildTab({super.key, required this.mediaInfo, this.onClickDownload});

  @override
  State<VideoChildTab> createState() => _VideoChildTabState();
}

class _VideoChildTabState extends State<VideoChildTab> with AutomaticKeepAliveClientMixin {
  List<VideoSource> videoSources = [];

  @override
  void initState() {
    dealVideoSources();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant VideoChildTab oldWidget) {
    dealVideoSources();
    super.didUpdateWidget(oldWidget);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Expanded(
            child: ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (_, index) {
                  final videoSource = videoSources[index];
                  return GestureDetector(
                      onTap: () {
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
                                TextView.primary(
                                  videoSource.label ?? '',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                TextView.accent(
                                  '${videoSource.resolution}  ·  ${videoSource.formatSize()}',
                                  fontSize: 14,
                                )
                              ],
                            ),
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
                itemCount: videoSources.length)),
        const Height(12)
      ],
    );
  }

  void dealVideoSources() {
    videoSources.clear();
    videoSources.addAll(mediaInfo.videoSources ?? []);
  }

  MediaInfo get mediaInfo => widget.mediaInfo;
}
