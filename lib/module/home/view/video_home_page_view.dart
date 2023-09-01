/*
* 作者 Ren
* 时间  2023/8/31 08:06
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/home/page/home_file_page.dart';
import 'package:free_tube_player/module/home/page/home_folder_page.dart';

class VideoHomePageView extends StatelessWidget {
  const VideoHomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_tabBar(), _tabView()],
        ));
  }

  Widget _tabBar() {
    return TabBar(
        isScrollable: true,
        labelStyle: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w500, fontFamily: tubeFontFamily, fontStyle: FontStyle.italic),
        unselectedLabelStyle: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w500, fontFamily: tubeFontFamily, fontStyle: FontStyle.italic),
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
    return const Expanded(child: TabBarView(children: [HomeFilePage(), HomeFolderPage()]));
  }
}
