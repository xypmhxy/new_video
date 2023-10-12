/*
* 作者 Ren
* 时间  2023/9/29 16:50
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/app/resource/color_res.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/player/controller/comment_controller.dart';
import 'package:free_tube_player/module/player/controller/user_player_page_controller.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/loading_view.dart';
import 'package:free_tube_player/widget/no_data_view.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:free_tube_player/widget/video_item_view.dart';
import 'package:get/get.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class CommentTabPage extends StatefulWidget {
  final Video? video;

  const CommentTabPage({Key? key, required this.video}) : super(key: key);

  @override
  State<CommentTabPage> createState() => _CommentTabPageState();
}

class _CommentTabPageState extends State<CommentTabPage> {
  final _commentController = CommentController();

  @override
  void initState() {
    _commentController.requestComment(widget.video);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_commentController.viewStatus.value == ViewStatus.loading) {
        return const Center(
          child: LoadingView(
            size: 40,
          ),
        );
      } else if (_commentController.viewStatus.value == ViewStatus.empty) {
        return GestureDetector(
            onTap: () {
              _commentController.requestComment(widget.video);
            },
            child: NoDataView(
              text: S.current.noDataClickRetry,
              iconSize: 164,
            ));
      }
      final comments = _commentController.commentsList.value?.toList() ?? [];
      return ListView.separated(
          itemBuilder: (_, index) {
            final comment = comments[index];
            return Column(
              children: [
                Row(
                  children: [
                    _avatar(comment.author),
                    const Width(8),
                    TextView.primary(comment.author, fontSize: 13, fontWeight: FontWeight.normal),
                    const Width(10),
                    TextView.accent(comment.publishedTime, fontSize: 12, fontWeight: FontWeight.normal)
                  ],
                ),
                const Height(8),
                TextView.primary(comment.text, fontSize: 14, fontWeight: FontWeight.normal)
              ],
            );
          },
          separatorBuilder: (_, index) {
            return Container(
                height: .13, color: ColorRes.colorE0E0E0, margin: const EdgeInsets.symmetric(vertical: 12));
          },
          itemCount: comments.length);
    });
  }

  Widget _avatar(String userName) {
    String firstText = userName.length >= 2 ? userName.substring(1, 2) : '@';
    firstText = firstText.toUpperCase();
    return Container(
      width: 36,
      height: 36,
      alignment: Alignment.center,
      decoration: allRadiusDecoration(18, color: ColorRes.randomColor()),
      child: TextView.primary(firstText),
    );
  }
}
