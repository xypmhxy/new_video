import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/bean/play/playlist.dart';
import 'package:free_tube_player/dialog/dialog_confirm.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/helper/video_action_helper.dart';
import 'package:free_tube_player/utils/dialog_utils.dart';
import 'package:get/get.dart';

class VideoListPageController {
  final _videoHelper = VideoActionHelper();
  final videos = <MediaInfo>[].obs;

  void showMoreDialog(MediaInfo mediaInfo, {Playlist? playlist}) {
    _videoHelper.showActionDialog(
        isShowRemove: playlist != null,
        mediaInfo: mediaInfo,
        from: 'video_list',
        onRemove: () {
          DialogUtils.showCenterDialog(DialogConfirm(
            title: S.current.removeFromListConfirm,
            onCancel: () {
              DialogUtils.dismiss();
            },
            onConfirm: () async {
              DialogUtils.dismiss();
              DialogUtils.dismiss();
              final result = await _videoHelper.removeFromPlaylist(playlist!, mediaInfo);
              if (result) {
                videos.remove(mediaInfo);
              }
            },
          ));
        });
  }

  void onClickDeleteAll({Playlist? playlist}) {
    DialogUtils.showCenterDialog(DialogConfirm(
      title: S.current.removeAllConfirm,
      onCancel: () {
        DialogUtils.dismiss();
      },
      onConfirm: () async {
        DialogUtils.dismiss();
        for (final video in videos) {
          await _videoHelper.removeFromPlaylist(playlist!, video);
          videos.remove(video);
        }
      },
    ));
  }
}
