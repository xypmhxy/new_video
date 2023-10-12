import 'package:free_tube_player/api/play_api.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:get/get.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class CommentController {
  final _youtubeExplode = YoutubeExplode();
  final commentsList = Rxn<CommentsList>();
  final viewStatus = ViewStatus.none.obs;

  Future<void> requestComment(Video? video) async {
    if (video == null) {
      viewStatus.value = ViewStatus.failed;
      return;
    }
    viewStatus.value = ViewStatus.loading;
    commentsList.value = await _youtubeExplode.videos.comments.getComments(video);
    if (commentsList.value == null) {
      viewStatus.value = ViewStatus.failed;
    } else {
      viewStatus.value = ViewStatus.success;
    }
  }
}
