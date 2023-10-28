/*
* 作者 Ren
* 时间  2023/9/29 16:50
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/player/controller/comment_controller.dart';
import 'package:free_tube_player/widget/comment_item_view.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_button.dart';
import 'package:free_tube_player/widget/loading_view.dart';
import 'package:free_tube_player/widget/no_data_view.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:get/get.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class DialogComment extends StatefulWidget {
  final Video? video;
  final CommentController commentController;
  final ScrollController scrollController;
  final VoidCallback? onClickClose;

  const DialogComment(
      {Key? key,
      required this.commentController,
      required this.video,
      required this.scrollController,
      this.onClickClose})
      : super(key: key);

  @override
  State<DialogComment> createState() => _DialogCommentState();
}

class _DialogCommentState extends State<DialogComment> with AutomaticKeepAliveClientMixin {
  late final _commentController = widget.commentController;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: AppThemeController.bottomSheetColor(context),
        child: Column(
          children: [
            const Height(8),
            _indicator(),
            const Height(20),
            _title(),
            _divider(),
            _sort(),
            const Height(20),
            _content()
          ],
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
          S.current.comments,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        GestureDetector(
            onTap: () {
              widget.onClickClose?.call();
            },
            child: const Icon(
              Icons.close_rounded,
              size: 22,
            ))
      ],
    );
  }

  Widget _sort() {
    return Obx(() => Row(
          children: [
            _sortItem(
              S.current.top,
              _commentController.commentSortType.value == CommentSortType.top,
              CommentSortType.top,
            ),
            const Width(12),
            _sortItem(
              S.current.mostLike,
              _commentController.commentSortType.value == CommentSortType.mostLike,
              CommentSortType.mostLike,
            ),
            const Width(12),
            _sortItem(
              S.current.mostReplies,
              _commentController.commentSortType.value == CommentSortType.mostReplies,
              CommentSortType.mostReplies,
            )
          ],
        ));
  }

  Widget _sortItem(String text, bool isSelected, CommentSortType sortType) {
    return GestureDetector(
        onTap: () {
          _commentController.changeCommentSorType(sortType);
        },
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
            decoration: BoxDecoration(
                color: isSelected ? AppThemeController.primaryThemeColor(context) : Colors.transparent,
                border: isSelected ? null : Border.all(color: AppThemeController.primaryThemeColor(context), width: 1),
                borderRadius: getBorderRadius(28)),
            child: TextView.primary(text,
                color: isSelected ? null : AppThemeController.primaryThemeColor(context),
                fontWeight: FontWeight.normal)));
  }

  Widget _content() {
    return Obx(() {
      if (_commentController.viewStatus.value == ViewStatus.loading) {
        return const Expanded(
            child: Center(
          child: LoadingView(
            size: 40,
          ),
        ));
      } else if (_commentController.viewStatus.value == ViewStatus.failed) {
        return Expanded(
            child: Center(
                child: GestureDetector(
                    onTap: () {
                      _commentController.requestComment(widget.video);
                    },
                    child: NoDataView(
                      text: S.current.noDataClickRetry,
                      iconSize: 164,
                    ))));
      }
      final comments = _commentController.comments;
      return Expanded(
          child: ListView.separated(
              controller: widget.scrollController,
              padding: const EdgeInsets.only(bottom: 12),
              itemBuilder: (_, index) {
                final comment = comments[index];
                return CommentItemView(
                  comment: comment,
                  onClickComment: () {
                    _commentController.showRepliesDialog(context, comment);
                  },
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

  Widget _divider() {
    return Container(
        height: .15, color: AppThemeController.dividerColor(context), margin: const EdgeInsets.symmetric(vertical: 20));
  }
}
