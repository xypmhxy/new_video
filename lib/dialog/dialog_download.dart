import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/db/dao/media_info_dao.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/download/view/audio_child_tab.dart';
import 'package:free_tube_player/module/download/view/video_child_tab.dart';
import 'package:free_tube_player/utils/dialog_utils.dart';
import 'package:free_tube_player/utils/video_data_helper.dart';
import 'package:free_tube_player/widget/border_radius_indicator.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_view.dart';
import 'package:free_tube_player/widget/loading_view.dart';
import 'package:free_tube_player/widget/no_data_view.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:get/get.dart';

class DialogDownload extends StatefulWidget {
  final MediaInfo mediaInfo;
  final Function(BaseMediaSource mediaSource)? onClickDownload;

  const DialogDownload({Key? key, required this.mediaInfo, this.onClickDownload}) : super(key: key);

  @override
  State<DialogDownload> createState() => _DialogDownloadState();
}

class _DialogDownloadState extends State<DialogDownload> {
  final _controller = DownloadDialogController();

  @override
  void initState() {
    _controller.requestVideoSource(mediaInfo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 120, maxHeight: screenHeight * .65),
      decoration: allRadiusDecoration(16, color: AppThemeController.backgroundColor(context)),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [const Height(4), _closeButton(), const Height(12), _title(), const Height(20), _content()],
      ),
    );
  }

  Widget _closeButton() {
    return Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
            onTap: () {
              DialogUtils.dismiss();
            },
            child: Container(
              margin: const EdgeInsets.only(right: 4, top: 4),
              padding: const EdgeInsets.all(4),
              child: GestureDetector(
                child: const Icon(
                  Icons.close_rounded,
                ),
              ),
            )));
  }

  Widget _title() {
    return Row(
      children: [
        ClipRRect(
            borderRadius: getBorderRadius(4),
            child: ImageView.network(
              imageUrl: mediaInfo.thumbnail ?? '',
              size: 40,
            )),
        const Width(16),
        Expanded(
            child: TextView.primary(
          mediaInfo.title,
          fontSize: 14,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )),
        const Width(8),
      ],
    );
  }

  Widget _content() {
    return Obx(() {
      if (_controller.viewStatus.value == ViewStatus.success) {
        return Expanded(
          child: VideoChildTab(
            mediaInfo: mediaInfo,
            onClickDownload: widget.onClickDownload,
          ),
        );
      } else if (_controller.viewStatus.value == ViewStatus.failed) {
        return Container(
          margin: const EdgeInsets.only(top: 56),
          child: NoDataView(
            text: S.current.getPlaySourceFailed,
            iconSize: 164,
            onClick: () {
              _controller.requestVideoSource(mediaInfo);
            },
          ),
        );
      }
      return const Expanded(
          child: Center(
        child: LoadingView(size: 35),
      ));
    });
  }

  Widget _tabBar() {
    return TabBar(
        isScrollable: false,
        labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily: tubeFontFamily),
        unselectedLabelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily: tubeFontFamily),
        indicatorColor: AppThemeController.primaryThemeColor(context),
        indicatorWeight: 3,
        indicator: BorderRadiusIndicator(color: AppThemeController.primaryThemeColor(context)),
        tabs: [
          Tab(
            text: S.current.video,
          ),
          Tab(
            text: S.current.audio,
          )
        ]);
  }

  Widget _tabBarView() {
    return Expanded(
        child: TabBarView(children: [
      VideoChildTab(mediaInfo: mediaInfo),
      AudioChildTab(mediaInfo: mediaInfo),
    ]));
  }

  MediaInfo get mediaInfo => widget.mediaInfo;
}

class DownloadDialogController {
  final _mediaDao = MediaInfoDao();
  final viewStatus = ViewStatus.none.obs;

  Future<void> requestVideoSource(MediaInfo mediaInfo) async {
    viewStatus.value = ViewStatus.loading;
    final media = await VideoDataHelper.get.requestVideoSource(mediaInfo, isNeedRetry: true);
    if (media == null) {
      viewStatus.value = ViewStatus.failed;
      return;
    }
    mediaInfo = media;
    _mediaDao.insert(mediaInfo);
    viewStatus.value = ViewStatus.success;
    if (media.videoSources?.isNotEmpty == true) {
      for (final videoSource in media.videoSources!) {
        if ((videoSource.byteSize ?? 0) == 0) {
          videoSource.byteSize = await VideoDataHelper.get.getFileSize(videoSource.url);
          viewStatus.refresh();
        }
      }
      _mediaDao.insert(mediaInfo);
    }
  }
}
