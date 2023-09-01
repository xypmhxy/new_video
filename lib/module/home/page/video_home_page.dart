/*
* 作者 Ren
* 时间  2023/8/31 08:05
*/

import 'package:flutter/material.dart';
import 'package:free_tube_player/module/home/controller/android_home_page_controller.dart';
import 'package:free_tube_player/module/home/view/video_home_page_view.dart';
import 'package:get/get.dart';

class VideoHomePage extends StatefulWidget {
  const VideoHomePage({super.key});

  @override
  State<VideoHomePage> createState() => _VideoHomePageState();
}

class _VideoHomePageState extends State<VideoHomePage> with AutomaticKeepAliveClientMixin {
  final _ = Get.put(AndroidHomePageController());

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const VideoHomePageView();
  }
}
