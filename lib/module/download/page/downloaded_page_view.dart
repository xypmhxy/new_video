import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/app/resource/color_res.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/generated/assets.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/download/controller/downloaded_page_controller.dart';
import 'package:free_tube_player/module/player/controller/user_player_controller.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_button.dart';
import 'package:free_tube_player/widget/image_view.dart';
import 'package:free_tube_player/widget/my_expansion_panel.dart' as my_expansion;
import 'package:free_tube_player/widget/svg_view.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:get/get.dart';

class DownloadedPageView extends StatefulWidget {
  const DownloadedPageView({super.key});

  @override
  State<DownloadedPageView> createState() => _DownloadedPageViewState();
}

class _DownloadedPageViewState extends State<DownloadedPageView> with AutomaticKeepAliveClientMixin {
  final _controller = DownloadedPageController();

  @override
  void initState() {
    _controller.queryDownloadCompleteVideos();
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
    return SingleChildScrollView(
      child: Obx(() => my_expansion.ExpansionPanelList(
            dividerColor: Colors.transparent,
            materialGapSize: 8,
            expandedHeaderPadding: EdgeInsets.zero,
            elevation: 0,
            isShowExpandIcon: false,
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
                      final mediaInfo = e.first.mediaInfo;
                      return _itemHeader(mediaInfo, e.length);
                    },
                    body: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                            color: AppThemeController.textPrimaryColor(context).withOpacity(.05),
                            child: _item(e, index),
                          );
                        },
                        separatorBuilder: (_, __) {
                          return const Height(12);
                        },
                        itemCount: e.length)))
                .toList(),
          )),
    );
  }

  Widget _itemHeader(MediaInfo mediaInfo, int count) {
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
          )),
          const Width(12),
          ImageButton(
              onPressed: () {
                _controller.showDeleteAllDialog(mediaInfo);
              },
              child: SVGView(
                assetName: Assets.svgUserDelete,
                color: AppThemeController.textPrimaryColor(context),
                size: 20,
              ))
        ],
      ),
    );
  }

  Widget _item(List<DownloadedMediaInfo> downloadedMediaInfoList, int index) {
    final downloadedMediaInfo = downloadedMediaInfoList[index];
    final mediaInfo = downloadedMediaInfo.mediaInfo;
    return GestureDetector(
        onTap: () {
          startUserPlayPage(mediaInfo: mediaInfo,videoSource: downloadedMediaInfo.mediaSource as VideoSource);
        },
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
                        width: 144,
                        height: 86,
                        imageUrl: mediaInfo.thumbnail,
                        imageData: Uint8List.fromList(mediaInfo.localBytesThumbnail ?? []),
                      ),
                    ),
                    Positioned(
                        bottom: 2,
                        right: 2,
                        child: Container(
                          decoration: allRadiusDecoration(8,
                              color: mediaInfo.isLive ? ColorRes.themeColor : ColorRes.backgroundColor),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: TextView.primary(downloadedMediaInfo.mediaSource.label ?? '',
                              color: Colors.white, fontSize: 12, fontWeight: FontWeight.normal),
                        )),
                    if (mediaInfo.isLive == false &&
                        mediaInfo.historyProgress != null &&
                        mediaInfo.historyProgress! > 0)
                      Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: ClipRRect(
                            borderRadius: getBorderRadius(2),
                            child: LinearProgressIndicator(
                              minHeight: 2,
                              value: mediaInfo.historyProgress!,
                              backgroundColor: Colors.black26,
                            ),
                          ))
                  ],
                ),
                const Width(10),
                Expanded(
                    child: SizedBox(
                  height: 86,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: TextView.primary(
                            mediaInfo.title,
                            fontSize: 14,
                            maxLines: 2,
                            fontWeight: FontWeight.w500,
                          )),
                          GestureDetector(
                            onTap: () {
                              _controller.showMoreDialog(downloadedMediaInfoList[index],
                                  downloadMediaInfoList: downloadedMediaInfoList);
                            },
                            child: Container(
                                color: Colors.transparent,
                                padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 8),
                                child: const Icon(
                                  Icons.more_vert_rounded,
                                  color: Colors.white,
                                  size: 16,
                                )),
                          )
                        ],
                      ),
                      TextView.primary(
                        mediaInfo.isLive ? S.current.live : mediaInfo.durationFormat,
                        fontSize: 12,
                        color: AppThemeController.textPrimaryColor(context).withOpacity(.7),
                      ),
                      const Height(4),
                      TextView.primary(
                        downloadedMediaInfo.mediaSource.downloadFinishFormatDate,
                        fontSize: 12,
                        color: AppThemeController.textPrimaryColor(context).withOpacity(.7),
                      ),
                    ],
                  ),
                ))
              ],
            )));
  }
}
