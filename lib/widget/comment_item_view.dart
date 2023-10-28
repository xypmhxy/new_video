/*
* 作者 Ren
* 时间  2023/10/12 21:36
*/

import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/extension/comment_extension.dart';
import 'package:free_tube_player/generated/assets.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_view.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import 'svg_view.dart';

class CommentItemView extends StatefulWidget {
  final Comment comment;
  final VoidCallback? onClickComment;
  final bool isShowReplies;

  const CommentItemView({super.key, required this.comment, this.onClickComment, this.isShowReplies = true});

  @override
  State<CommentItemView> createState() => _CommentItemViewState();
}

class _CommentItemViewState extends State<CommentItemView> {

  @override
  Widget build(BuildContext context) {
    Comment comment = widget.comment;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _avatar(comment.channelThumbnail),
            const Width(12),
            ConstrainedBox(
                constraints: BoxConstraints(maxWidth: screenWidth * .4),
                child: TextView.primary(
                  comment.author,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
            const Width(10),
            ConstrainedBox(
                constraints: BoxConstraints(maxWidth: screenWidth * .33),
                child: TextView.accent(
                  comment.publishedTime,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
          ],
        ),
        const Height(12),
        TextView.primary(comment.text, fontSize: 14, fontWeight: FontWeight.normal),
        const Height(16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _commentInfoItem(context, Assets.svgLikeNormal, comment.formatLikeCount()),
            const Width(32),
            Visibility(
                visible:  widget.isShowReplies,
                child: GestureDetector(
                    onTap:  widget.onClickComment,
                    child: _commentInfoItem(context, Assets.svgComment, comment.formatReplyCount()))),
          ],
        )
      ],
    );
  }

  Widget _avatar(String url) {
    return ClipOval(
      child: ImageView.network(
        imageUrl: url,
        size: 36,
        placeholderIconSize: 36,
      ),
    );
  }

  Widget _commentInfoItem(BuildContext context, String svg, String text) {
    return Container(
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SVGView(
            assetName: svg,
            size: 20,
            color: AppThemeController.textPrimaryColor(context),
          ),
          const Width(8),
          TextView.primary(text, fontSize: 13, fontWeight: FontWeight.normal),
        ],
      ),
    );
  }
}
