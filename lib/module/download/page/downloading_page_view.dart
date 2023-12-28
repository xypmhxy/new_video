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
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
          return const Height(8);
        },
        itemCount: globalDownloadController.downloadList.length));
  }

  Widget _item(DownloadInfo downloadInfo) {
    final mediaInfo = downloadInfo.mediaInfo;
    const itemHeight = 64.0;
    return GestureDetector(
        onTap: () {},
        child: Container(
            color: Colors.transparent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: getBorderRadius(4),
                      child: AutoImageView(
                        width: itemHeight,
                        height: itemHeight,
                        imageUrl: mediaInfo.thumbnail,
                        imageData: Uint8List.fromList(mediaInfo.localBytesThumbnail ?? []),
                      ),
                    ),
                  ],
                ),
                const Width(10),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView.primary(
                      mediaInfo.title,
                      fontSize: 14,
                      maxLines: 1,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [TextView.primary('${downloadInfo.videoSource?.downloadLength?.parseUnit()}')],
                    )
                  ],
                ))
              ],
            )));
  }

  Widget _button() {
    return Container(
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: AppThemeController.textPrimaryColor(context).withOpacity(.1)),
      padding: EdgeInsets.all(8),
      child: SVGView(
        size: 12,
        assetName: Assets.svgPause,
        color: Colors.white,
      ),
    );
  }
}
