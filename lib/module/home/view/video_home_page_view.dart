/*
* 作者 Ren
* 时间  2023/8/31 08:06
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/home/controller/home_file_page_controller.dart';
import 'package:free_tube_player/module/home/controller/home_folder_page_controller.dart';
import 'package:free_tube_player/module/home/page/home_file_page.dart';
import 'package:get/get.dart';

class VideoHomePageView extends StatelessWidget {
  const VideoHomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: isUserMode,
        child: Container(
            margin: EdgeInsets.only(top: isUserMode ? 16 : 0),
            child: DefaultTabController(
                length: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [_tabBar(), _tabView()],
                ))));
  }

  Widget _tabBar() {
    return TabBar(
        isScrollable: true,
        labelStyle: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, fontFamily: tubeFontFamily, fontStyle: FontStyle.italic),
        unselectedLabelStyle: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, fontFamily: tubeFontFamily, fontStyle: FontStyle.italic),
        indicator: const BoxDecoration(),
        tabs: [
          Tab(
            text: S.current.file,
          ),
          Tab(
            text: S.current.folder,
          )
        ]);
  }

  Widget _tabView() {
    return Expanded(
        child: TabBarView(children: [
      HomeFilePage(
        videoController: Get.find<HomeFilePageController>(),
      ),
      HomeFilePage(
        videoController: Get.find<HomeFolderPageController>(),
      ),
      // HomeFolderPage()
    ]));
  }
}
