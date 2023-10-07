/*
* 作者 Ren
* 时间  2023/9/29 16:50
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/player/controller/comment_controller.dart';
import 'package:free_tube_player/module/player/controller/user_player_page_controller.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/loading_view.dart';
import 'package:free_tube_player/widget/no_data_view.dart';
import 'package:free_tube_player/widget/video_item_view.dart';
import 'package:get/get.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class CommentTabPage extends StatefulWidget {
  final Video? video;
  const CommentTabPage({Key? key,required this.video}) : super(key: key);

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
    return Container();
  }
}
