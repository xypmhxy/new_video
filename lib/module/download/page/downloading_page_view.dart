import 'package:flutter/material.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/extension/number_extension.dart';
import 'package:free_tube_player/generated/assets.dart';
import 'package:free_tube_player/module/download/bean/download_info.dart';
import 'package:free_tube_player/module/download/controller/global_download_controller.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'dart:typed_data';

import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/app/resource/color_res.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/widget/image_view.dart';
import 'package:free_tube_player/widget/svg_view.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:get/get.dart';

class DownloadingPageView extends StatefulWidget {
  const DownloadingPageView({Key? key}) : super(key: key);

  @override
  State<DownloadingPageView> createState() => _DownloadingPageViewState();
}

class _DownloadingPageViewState extends State<DownloadingPageView> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Obx(() => ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemBuilder: (_, index) {
          final downloadInfo = globalDownloadController.downloadList[index];
          return GetBuilder<GlobalDownloadController>(
              id: downloadInfo.mediaInfo.identify,
              init: globalDownloadController,
              builder: (_) {
                return _item(downloadInfo);
              });
        },
        separatorBuilder: (_, index) {
          return const Height(12);
        },
        itemCount: globalDownloadController.downloadList.length));
  }

  Widget _item(DownloadInfo downloadInfo) {
    final mediaInfo = downloadInfo.mediaInfo;
    const itemWidth = 120.0;
    const itemHeight = 82.0;
    String icon = Assets.imagesDownloadPause;
    if (downloadInfo.isDownloading || downloadInfo.isWaiting) {
      icon = Assets.imagesDownloadPause;
    } else if (downloadInfo.isFailed) {
      icon = Assets.imagesDownloadError;
    } else if (downloadInfo.isPause) {
      icon = Assets.imagesDownloadStart;
    }
    return GestureDetector(
        onTap: () {},
        child: Container(
            color: Colors.transparent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: getBorderRadius(4),
                      child: AutoImageView(
                        width: itemWidth,
                        height: itemHeight,
                        imageUrl: mediaInfo.thumbnail,
                        imageData: Uint8List.fromList(mediaInfo.localBytesThumbnail ?? []),
                      ),
                    ),
                  ],
                ),
                const Width(10),
                Expanded(
                    child: SizedBox(
                  height: itemHeight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView.primary(
                        mediaInfo.title,
                        fontSize: 13,
                        maxLines: 2,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Height(4),
                      Expanded(
                          child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextView.primary(downloadInfo.downloadProgressString(), fontSize: 12),
                            const Height(6),
                            LinearProgressIndicator(
                              minHeight: 3,
                              borderRadius: getBorderRadius(2),
                              value: downloadInfo.videoSource?.downloadProgress() ?? 0.0,
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                )),
                const Width(12),
                SizedBox(
                  height: itemHeight,
                  child: Column(
                    children: [
                      _button(
                          image: Assets.imagesDownloadDelete,
                          onTap: () {
                            globalDownloadController.removeDownloadInfo(downloadInfo);
                          }),
                      const Height(16),
                      _button(
                          image: icon,
                          onTap: () {
                            globalDownloadController.pause(downloadInfo.mediaInfo);
                          }),
                    ],
                  ),
                )
              ],
            )));
  }

  Widget _button({required String image, VoidCallback? onTap}) {
    return GestureDetector(onTap: onTap, child: ImageView.asset(image, size: 26));
  }
}