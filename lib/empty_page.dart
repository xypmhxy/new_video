import 'package:flutter/material.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/dialog/dialog_download.dart';
import 'package:free_tube_player/utils/dialog_utils.dart';
import 'package:free_tube_player/widget/text_view.dart';

class EmptyPage extends StatefulWidget {
  const EmptyPage({Key? key}) : super(key: key);

  @override
  State<EmptyPage> createState() => _EmptyPageState();
}

class _EmptyPageState extends State<EmptyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {
          DialogUtils.showBottomSheet(DialogDownload(mediaInfo: MediaInfo.create(),));
        }, child: TextView.primary('Click')),
      ),
    );
  }
}
