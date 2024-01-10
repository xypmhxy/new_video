/*
* 作者 Ren
* 时间  2024/1/6 15:09
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/module/short/controller/short_video_page_controller.dart';
import 'package:free_tube_player/widget/loading_view.dart';
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
      body: SafeArea(top: false, child: _content()),
    );
  }

  Widget _content() {
    return Obx(() => Visibility(
          visible: _shortVideoPageController.viewStatus.value == ViewStatus.success,
          replacement: _loadingView(),
          child: _pageView(),
        ));
  }

  Widget _loadingView() {
    return const Center(child: LoadingView(size: 38));
  }

  Widget _pageView() {
    return Obx(() => PageView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (_, index) {
            final itemController = _shortVideoPageController.shortVideoItemControllers[index];
            return ShortVideoItem(shortVideoItemController: itemController);
          },
          onPageChanged: _shortVideoPageController.onPageChanged,
          itemCount: _shortVideoPageController.shortVideoItemControllers.length,
        ));
  }
}
