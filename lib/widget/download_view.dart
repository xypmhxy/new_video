/*
* 作者 Ren
* 时间  2023/11/12 09:43
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/module/download/bean/download_info.dart';
import 'package:free_tube_player/module/download/controller/global_download_controller.dart';
import 'package:get/get.dart';

class DownloadView extends StatelessWidget {
  final double? padding;
  final MediaInfo mediaInfo;
  final VideoSource? videoSource;
  final AudioSource? audioSource;

  const DownloadView({super.key, required this.mediaInfo, this.videoSource, this.audioSource, this.padding});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GlobalDownloadController>(
        id: mediaInfo.identify,
        builder: (_) {
          return GestureDetector(
            onTap: () {
              globalDownloadController.downloadMedia(mediaInfo, videoSource, audioSource);
            },
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.all(padding ?? 6),
              child: SizedBox(
                width: 20,
                height: 20,
                child: Stack(
                  children: [
                    CircularProgressIndicator(
                      strokeCap: StrokeCap.round,
                      strokeWidth: 2,
                      backgroundColor: AppThemeController.textPrimaryColor(context),
                      color: AppThemeController.primaryThemeColor(context),
                      value: videoSource?.downloadProgress,
                    ),
                    Center(
                      child: Icon(
                        Icons.file_download_outlined,
                        size: 15,
                        color: AppThemeController.textPrimaryColor(context),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
