/*
* 作者 Ren
* 时间  2024/1/6 15:09
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/module/userHome/controller/short_video_page_controller.dart';
import 'package:get/get.dart';

import 'short_video_item.dart';

class ShortVideoPage extends StatefulWidget {
  const ShortVideoPage({super.key});

  @override
  State<ShortVideoPage> createState() => _ShortVideoPageState();
}

class _ShortVideoPageState extends State<ShortVideoPage> {
  final _shortVideoPageController = ShortVideoPageController();

  @override
  void initState() {
    _shortVideoPageController.requestShortVideos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(top: false, child: _pageView()),
    );
  }

  Widget _pageView() {
    return Obx(() => PageView.builder(
          allowImplicitScrolling: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (_, index) {
            final mediaInfo = _shortVideoPageController.shorVideos[index];
            return ShortVideoItem(mediaInfo: mediaInfo);
          },
          onPageChanged: (index){
            if (index == _shortVideoPageController.shorVideos.length - 2){
              _shortVideoPageController.loadMoreShortVideos();
            }
          },
          itemCount: _shortVideoPageController.shorVideos.length,
        ));
  }
}
