/*
* 作者 Ren
* 时间  2023/8/12 08:07
*/
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:free_tube_player/module/edit/callback/edit_page_callback.dart';
import 'package:free_tube_player/module/edit/controller/edit_page_controller.dart';
import 'package:free_tube_player/module/edit/view/edit_page_view.dart';
import 'package:video_editor/video_editor.dart';

class EditPage extends StatefulWidget {
  final String filePath;

  const EditPage({super.key, required this.filePath});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> implements EditPageCallback {
  final _editPageController = EditPageController();

  @override
  void initState() {
    _editPageController.init(File(widget.filePath));
    super.initState();
  }

  @override
  void dispose() {
    _editPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EditPageView(pageCallback: this, editPageController: _editPageController);
  }

  @override
  void onClickBack() {

  }

  @override
  void exportCover() {
    _editPageController.exportCover();
  }

  @override
  void exportVideo() {
    _editPageController.exportVideo();
  }

  @override
  void rotate90Degrees(RotateDirection direction) {
    _editPageController.rotate90Degrees(direction);
  }
}
