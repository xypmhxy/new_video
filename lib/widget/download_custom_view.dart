/*
* 作者 Ren
* 时间  2023/12/8 15:01
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/generated/assets.dart';
import 'package:free_tube_player/helper/video_action_helper.dart';
import 'package:free_tube_player/module/download/controller/global_download_controller.dart';
import 'package:free_tube_player/widget/svg_view.dart';
import 'package:get/get.dart';

class DownloadCustomView extends StatelessWidget {
  final MediaInfo? mediaInfo;
  final VideoSource? videoSource;
  final double iconSize;
  final double progressSize;
  final _videoActionHelper = VideoActionHelper();

  DownloadCustomView({
    super.key,
    required this.mediaInfo,
    required this.videoSource,
    this.iconSize = 26.0,
    this.progressSize = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GlobalDownloadController>(
        init: globalDownloadController,
        id: mediaInfo?.identify,
        builder: (_) {
          Widget child = _normalIcon(context);
          if (videoSource?.isSuccess == true) {
            child = Icon(
              Icons.file_download_done_rounded,
              color: AppThemeController.primaryThemeColor(context),
              size: iconSize,
            );
          }
          if (videoSource?.isDownloading == true || videoSource?.isInQueue == true) {
            child = _progress(context);
          }
          if (videoSource?.isFailed == true) {
            child = Icon(
              Icons.running_with_errors_rounded,
              color: AppThemeController.primaryThemeColor(context),
              size: iconSize,
            );
          }
          return GestureDetector(
              onTap: () {
                if (mediaInfo == null || videoSource == null) return;
                _videoActionHelper.onClickDownloadButton(mediaInfo!, videoSource!);
              },
              child: SizedBox(
                width: iconSize,
                height: iconSize,
                child: child,
              ));
        });
  }

  Widget _normalIcon(BuildContext context) {
    return SVGView(
      assetName: Assets.svgDownload,
      size: iconSize,
      color: AppThemeController.textPrimaryColor(context),
    );
  }

  Widget _progress(BuildContext context) {
    return UnconstrainedBox(
      child: SizedBox(
        width: progressSize,
        height: progressSize,
        child: CircularProgressIndicator(
          strokeCap: StrokeCap.round,
          strokeWidth: 2,
          backgroundColor: AppThemeController.textPrimaryColor(context).withOpacity(.2),
          color: videoSource?.isSuccess == true
              ? AppThemeController.primaryThemeColor(context)
              : AppThemeController.textPrimaryColor(context),
          value: videoSource?.isInQueue == true ? (videoSource?.downloadProgress() ?? 0.0) : 1.0,
        ),
      ),
    );
  }
}
