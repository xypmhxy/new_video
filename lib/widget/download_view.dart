/*
* 作者 Ren
* 时间  2023/11/12 09:43
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/module/download/controller/global_download_controller.dart';
import 'package:get/get.dart';

class DownloadView extends StatelessWidget {
  final double? padding;
  final MediaInfo mediaInfo;
  final BaseMediaSource? baseMediaSource;
  final VoidCallback? onClickDownload;

  const DownloadView({super.key, required this.mediaInfo, this.baseMediaSource, this.padding, this.onClickDownload});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GlobalDownloadController>(
        id: mediaInfo.identify,
        init: globalDownloadController,
        builder: (_) {
          return GestureDetector(
            onTap: () {
              onClickDownload?.call();
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
                      backgroundColor: AppThemeController.textPrimaryColor(context).withOpacity(.2),
                      color: baseMediaSource?.isSuccess == true
                          ? AppThemeController.primaryThemeColor(context)
                          : AppThemeController.textPrimaryColor(context),
                      value: baseMediaSource?.isInQueue == true ? baseMediaSource?.downloadProgress() : 1.0,
                    ),
                    Visibility(
                        visible: baseMediaSource?.isInQueue != true,
                        child: Center(
                          child: Icon(
                            baseMediaSource?.isSuccess == true
                                ? Icons.file_download_done_rounded
                                : Icons.file_download_outlined,
                            size: 15,
                            color: baseMediaSource?.isSuccess == true
                                ? AppThemeController.primaryThemeColor(context)
                                : AppThemeController.textPrimaryColor(context),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
