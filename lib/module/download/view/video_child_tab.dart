/*
* 作者 Ren
* 时间  2023/11/11 14:05
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/download/bean/download_info.dart';
import 'package:free_tube_player/module/download/controller/global_download_controller.dart';
import 'package:free_tube_player/widget/color_button.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/download_view.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:get/get.dart';

class VideoChildTab extends StatefulWidget {
  final MediaInfo mediaInfo;

  const VideoChildTab({super.key, required this.mediaInfo});

  @override
  State<VideoChildTab> createState() => _VideoChildTabState();
}

class _VideoChildTabState extends State<VideoChildTab> with AutomaticKeepAliveClientMixin {
  List<VideoSource> videoSources = [];
  VideoSource? selectedVideoSource;

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
                        selectedVideoSource = videoSource;
                        setState(() {});
                      },
                      child: Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            // SizedBox(
                            //   width: 22,
                            //   height: 22,
                            //   child: Radio(
                            //     value: selectedVideoSource?.label ?? '',
                            //     groupValue: videoSource.label ?? '',
                            //     onChanged: (value) {
                            //       selectedVideoSource = videoSource;
                            //       setState(() {});
                            //     },
                            //     activeColor: AppThemeController.primaryThemeColor(context),
                            //     fillColor: MaterialStateProperty.all(AppThemeController.primaryThemeColor(context)),
                            //   ),
                            // ),
                            const Width(12),
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
                                    margin: EdgeInsets.only(right: 10),
                                    child: DownloadView(
                                      mediaInfo: mediaInfo,
                                    )))
                          ],
                        ),
                      ));
                },
                separatorBuilder: (_, index) {
                  return const Height(2);
                },
                itemCount: videoSources.length)),
        // const Height(12),
        // ColorButton(
        //     onPressed: () {
        //       if (selectedVideoSource == null) return;
        //       String? audioUrl;
        //       if (selectedVideoSource!.isOnlyVideo == false) {
        //         audioUrl = mediaInfo.audioSources?.first.url;
        //       }
        //       globalDownloadController
        //           .addToDownloadList(DownloadInfo(mediaInfo, videoUrl: selectedVideoSource?.url, audioUrl: audioUrl));
        //     },
        //     size: Size(screenWidth * .7, 44),
        //     child: TextView.primary(
        //       S.current.confirm,
        //       color: AppThemeController.counterTextPrimaryColor(context),
        //     )),
        const Height(12)
      ],
    );
  }

  void dealVideoSources() {
    this.videoSources.clear();
    final videoSources = mediaInfo.videoSources?.reversed.toList() ?? [];
    for (final videoSource in videoSources) {
      if (videoSource.format != 'mp4') continue;
      final existVideoSource = this.videoSources.firstWhereOrNull((element) => element.label == videoSource.label);
      if (existVideoSource != null) continue;
      this.videoSources.add(videoSource);
    }
  }

  MediaInfo get mediaInfo => widget.mediaInfo;
}
