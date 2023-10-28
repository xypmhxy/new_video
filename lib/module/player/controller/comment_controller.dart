import 'package:flutter/material.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/dialog/dialog_replies.dart';
import 'package:get/get.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

enum CommentSortType { top, mostLike, mostReplies }

class CommentController {
  final _youtubeExplode = YoutubeExplode();
  final commentsList = Rxn<CommentsList>();
  final comments = <Comment>[].obs;
  final viewStatus = ViewStatus.none.obs;

  final repliesCommentsList = Rxn<CommentsList>();
  final repliesViewStatus = ViewStatus.none.obs;
  final commentSortType = CommentSortType.top.obs;

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
      comments.value = commentsList.value?.toList() ?? [];
      viewStatus.value = ViewStatus.success;
    }
  }

  Future<void> showRepliesDialog(BuildContext context, Comment comment) async {
    if (comment.replyCount == 0) return;
    final result = showBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        constraints: BoxConstraints(maxHeight: screenHeight * .71),
        builder: (context) {
          return DialogReplies(comment: comment, commentController: this);
        });
    await result.closed;
    repliesCommentsList.value = null;
  }

  Future<void> requestReplies(Comment comment) async {
    repliesViewStatus.value = ViewStatus.loading;
    final commentList = await _youtubeExplode.videos.comments.getReplies(comment);
    repliesViewStatus.value = ViewStatus.failed;
    if (commentList == null) return;
    repliesViewStatus.value = ViewStatus.success;
    repliesCommentsList.value = commentList;
  }

  void changeCommentSorType(CommentSortType sortType) {
    commentSortType.value = sortType;
    if (sortType == CommentSortType.mostLike) {
      comments.sort((a, b) {
        return a.likeCount > b.likeCount ? 0 : 1;
      });
    } else if (sortType == CommentSortType.mostReplies) {
      comments.sort((a, b) {
        return a.replyCount > b.replyCount ? 0 : 1;
      });
    }
    if (sortType == CommentSortType.top) {
      comments.clear();
      comments.addAll(commentsList.value?.toList() ?? []);
    }
  }
}
