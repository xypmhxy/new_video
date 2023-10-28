/*
* 作者 Ren
* 时间  2023/10/12 20:53
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/player/controller/comment_controller.dart';
import 'package:free_tube_player/utils/page_navigation.dart';
import 'package:free_tube_player/widget/comment_item_view.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:get/get.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class DialogReplies extends StatefulWidget {
  final Comment comment;
  final CommentController commentController;

  const DialogReplies({super.key, required this.comment, required this.commentController});

  @override
  State<DialogReplies> createState() => _DialogRepliesState();
}

class _DialogRepliesState extends State<DialogReplies> {
  late Comment comment = widget.comment;
  late final _commentController = widget.commentController;

  @override
  void initState() {
    _commentController.requestReplies(comment);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: AppThemeController.bottomSheetColor(context),
        child: Column(
          children: [const Height(8), _indicator(), const Height(20), _title(), _divider(), _listView()],
        ));
  }

  Widget _indicator() {
    return Container(
      width: 42,
      height: 3,
      decoration: allRadiusDecoration(2, color: AppThemeController.dividerColor(context).withOpacity(.2)),
    );
  }

  Widget _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextView.primary(
          S.current.replies,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        GestureDetector(
            onTap: () {
              PageNavigation.back();
            },
            child: const Icon(
              Icons.close_rounded,
              size: 22,
            ))
      ],
    );
  }

  Widget _listView() {
    return Obx(() {
      final comments = <Comment>[comment];
      comments.addAll(_commentController.repliesCommentsList.value?.toList() ?? []);
      return Expanded(
          child: ListView.separated(
              padding: const EdgeInsets.only(bottom: 12),
              itemBuilder: (_, index) {
                if (index == 0) {
                  return _originComment();
                }
                final comment = comments[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: CommentItemView(
                    comment: comment,
                    isShowReplies: false,
                    onClickComment: () {
                      _commentController.showRepliesDialog(context, comment);
                    },
                  ),
                );
              },
              separatorBuilder: (_, index) {
                return Container(
                    height: .15,
                    color: AppThemeController.dividerColor(context),
                    margin: const EdgeInsets.symmetric(vertical: 16));
              },
              itemCount: comments.length));
    });
  }

  Widget _originComment() {
    return Column(
      children: [
        Row(
          children: [
            _avatar(comment.author),
            const Width(12),
            TextView.primary(comment.author, fontSize: 14, fontWeight: FontWeight.bold),
            const Width(10),
            TextView.accent(comment.publishedTime, fontSize: 13, fontWeight: FontWeight.normal),
          ],
        ),
        const Height(12),
        TextView.primary(comment.text, fontSize: 13, fontWeight: FontWeight.normal),
      ],
    );
  }

  Widget _avatar(String userName) {
    String firstText = userName.length >= 2 ? userName.substring(1, 2) : '@';
    firstText = firstText.toUpperCase();
    return Container(
      width: 36,
      height: 36,
      alignment: Alignment.center,
      decoration: allRadiusDecoration(18, color: Colors.blue),
      child: TextView.primary(firstText),
    );
  }

  Widget _divider() {
    return Container(
        height: .15, color: AppThemeController.dividerColor(context), margin: const EdgeInsets.symmetric(vertical: 16));
  }
}
