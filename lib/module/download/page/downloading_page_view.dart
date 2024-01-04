import 'package:flutter/material.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/dialog/dialog_confirm.dart';
import 'package:free_tube_player/generated/assets.dart';
import 'package:free_tube_player/module/download/bean/download_info.dart';
import 'package:free_tube_player/module/download/controller/downloading_page_controller.dart';
import 'package:free_tube_player/module/download/controller/global_download_controller.dart';
import 'package:free_tube_player/module/player/controller/user_player_controller.dart';
import 'package:free_tube_player/utils/dialog_utils.dart';
import 'package:free_tube_player/widget/color_button.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'dart:typed_data';

import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/app/resource/color_res.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/widget/image_button.dart';
import 'package:free_tube_player/widget/image_view.dart';
import 'package:free_tube_player/widget/svg_view.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:get/get.dart';
import 'package:free_tube_player/widget/my_expansion_panel.dart' as my_expansion;

class DownloadingPageView extends StatefulWidget {
  const DownloadingPageView({Key? key}) : super(key: key);

  @override
  State<DownloadingPageView> createState() => _DownloadingPageViewState();
}

class _DownloadingPageViewState extends State<DownloadingPageView> with AutomaticKeepAliveClientMixin {
  final _controller = DownloadingPageController();

  @override
  void initState() {
    _controller.queryDownload();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ColorButton(
                onPressed: () {
                  if (globalDownloadController.hasDownloadingVideo()) {
                    globalDownloadController.pauseAll();
                  } else {
                    globalDownloadController.continueALL();
                  }
                },
                color: AppThemeController.primaryThemeColor(context),
                child: Obx(() {
                  final _ = globalDownloadController.changeNotify.value;
                  return Wrap(
                    spacing: 8,
                    direction: Axis.horizontal,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      SVGView(
                        assetName: globalDownloadController.hasDownloadingVideo() ? Assets.svgPause : Assets.svgPlay,
                        color: ColorRes.textPrimaryColor,
                        size: 14,
                      ),
                      TextView.primary(
                        globalDownloadController.hasDownloadingVideo() ? S.current.pauseAll : S.current.continueAll,
                        fontSize: 14,
                        color: ColorRes.textPrimaryColor,
                      )
                    ],
                  );
                }),
              ),
              ImageButton(
                  onPressed: () {
                    DialogUtils.showCenterDialog(DialogConfirm(
                      title: S.current.removeAllConfirm,
                      onConfirm: () {
                        DialogUtils.dismiss();
                        globalDownloadController.removeAll();
                      },
                    ));
                  },
                  child: SVGView(
                    size: 22,
                    assetName: Assets.svgUserDelete,
                    color: AppThemeController.textPrimaryColor(context),
                  ))
            ],
          ),
        ),
        const Height(16),
        Expanded(
            child: SingleChildScrollView(
          child: Obx(() => my_expansion.ExpansionPanelList(
                dividerColor: Colors.transparent,
                materialGapSize: 8,
                expandedHeaderPadding: EdgeInsets.zero,
                elevation: 0,
                expandIconColor: AppThemeController.textPrimaryColor(context).withOpacity(.2),
                expansionCallback: (index, expand) {
                  _controller.togglePanelExpand(_controller.downloadGroupList[index].first);
                },
                children: _controller.downloadGroupList
                    .map((e) => my_expansion.ExpansionPanel(
                        canTapOnHeader: true,
                        isExpanded: _controller.expandMap[e.first.mediaInfo.identify] ?? false,
                        backgroundColor: Colors.transparent,
                        headerBuilder: (_, expand) {
                          final downloadInfo = e.first;
                          return _itemHeader(downloadInfo, e.length);
                        },
                        body: ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (_, index) {
                              final downloadInfo = e[index];
                              return GetBuilder<GlobalDownloadController>(
                                  init: globalDownloadController,
                                  id: downloadInfo.mediaInfo.identify,
                                  builder: (_) {
                                    return _item(downloadInfo);
                                  });
                            },
                            separatorBuilder: (_, __) {
                              return const Height(12);
                            },
                            itemCount: e.length)))
                    .toList(),
              )),
        ))
      ],
    );
  }

  Widget _itemHeader(DownloadInfo downloadInfo, int count) {
    final mediaInfo = downloadInfo.mediaInfo;
    return Container(
      margin: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: getBorderRadius(4),
            child: AutoImageView(
              imageUrl: mediaInfo.thumbnail ?? '',
              width: 60,
              height: 60,
            ),
          ),
          const Width(12),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextView.primary(
                mediaInfo.title,
                fontSize: 14,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Height(4),
              TextView.accent(
                S.current.paramsVideos(count),
                fontSize: 13,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ))
        ],
      ),
    );
  }

  Widget _item(DownloadInfo downloadInfo) {
    final mediaInfo = downloadInfo.mediaInfo;
    const itemWidth = 120.0;
    const itemHeight = 82.0;

    return GestureDetector(
        onTap: () {
          startUserPlayPage(mediaInfo: mediaInfo);
        },
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            color: AppThemeController.textPrimaryColor(context).withOpacity(.05),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      globalDownloadController.clickDownload(downloadInfo.mediaInfo,
                          mediaSource: downloadInfo.videoSource!);
                    },
                    child: SizedBox(
                        width: itemWidth,
                        height: itemHeight,
                        child: ClipRRect(
                          borderRadius: getBorderRadius(4),
                          child: Stack(
                            children: [
                              AutoImageView(
                                width: itemWidth,
                                height: itemHeight,
                                imageUrl: mediaInfo.thumbnail,
                                imageData: Uint8List.fromList(mediaInfo.localBytesThumbnail ?? []),
                              ),
                              Positioned(
                                  bottom: 2,
                                  right: 2,
                                  child: Container(
                                    decoration: allRadiusDecoration(8, color: ColorRes.backgroundColor),
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                    child: TextView.primary(downloadInfo.videoSource?.label ?? '',
                                        color: Colors.white, fontSize: 12, fontWeight: FontWeight.normal),
                                  )),
                              Center(
                                child: _pauseButton(downloadInfo: downloadInfo),
                              )
                            ],
                          ),
                        ))),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextView.primary(downloadInfo.downloadProgressString(), fontSize: 12),
                                TextView.accent('${downloadInfo.getDownloadSpeed()}/s', fontSize: 12),
                              ],
                            ),
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
                _button(
                    iconData: Icons.close_rounded,
                    onTap: () {
                      DialogUtils.showCenterDialog(DialogConfirm(
                        title: S.current.removeDownloadConfirmText,
                        onConfirm: () {
                          globalDownloadController.remove(downloadInfo.mediaInfo,
                              mediaSource: downloadInfo.videoSource!);
                          DialogUtils.dismiss();
                        },
                      ));
                    }),
              ],
            )));
  }

  Widget _pauseButton({required DownloadInfo downloadInfo, VoidCallback? onTap}) {
    IconData icon = Icons.pause_rounded;
    if (downloadInfo.isDownloading || downloadInfo.isWaiting) {
      icon = Icons.pause_rounded;
    } else if (downloadInfo.isFailed) {
      icon = Icons.running_with_errors_rounded;
    } else if (downloadInfo.isPause) {
      icon = Icons.arrow_downward_rounded;
    }
    return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.black38),
          padding: const EdgeInsets.all(6),
          child: Icon(icon,
              color: downloadInfo.isFailed ? AppThemeController.primaryThemeColor(context) : Colors.white, size: 32),
        ));
  }

  Widget _button({required IconData iconData, VoidCallback? onTap, double size = 18}) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.black38),
          padding: const EdgeInsets.all(6),
          child: Icon(iconData, color: Colors.white, size: size),
        ));
  }
}
