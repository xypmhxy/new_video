import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/db/dao/media_info_dao.dart';
import 'package:free_tube_player/utils/dialog_utils.dart';
import 'package:free_tube_player/utils/video_utils.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_view.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class DialogDownload extends StatefulWidget {
  final MediaInfo mediaInfo;

  const DialogDownload({Key? key, required this.mediaInfo}) : super(key: key);

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
      constraints: const BoxConstraints(minHeight: 120, maxHeight: 160),
      decoration: allRadiusDecoration(16, color: AppThemeController.backgroundColor(context)),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [const Height(4), _closeButton(), const Height(16), _title()],
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
              size: 36,
            )),
        const Width(12),
        TextView.primary(mediaInfo.title, fontSize: 14)
      ],
    );
  }

  MediaInfo get mediaInfo => widget.mediaInfo;
}

class DownloadDialogController {
  final _mediaDao = MediaInfoDao();
  final viewStatus = ViewStatus.none.obs;

  Future<void> requestVideoSource(MediaInfo mediaInfo) async {
    viewStatus.value = ViewStatus.loading;
    final media = await VideoUtils.requestVideoSource(mediaInfo);
    if (media == null) {
      viewStatus.value = ViewStatus.failed;
      return;
    }
    mediaInfo = media;
    _mediaDao.insert(mediaInfo);
    viewStatus.value = ViewStatus.success;
  }
}
