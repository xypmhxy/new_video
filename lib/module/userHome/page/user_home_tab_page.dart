/*
* 作者 Ren
* 时间  2023/9/10 08:06
*/

import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/resource/color_res.dart';
import 'package:free_tube_player/generated/assets.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/home/page/tmdb_page.dart';
import 'package:free_tube_player/module/home/page/video_home_page.dart';
import 'package:free_tube_player/module/userHome/controller/user_home_tab_page_controller.dart';
import 'package:free_tube_player/module/userHome/page/user_youtube_home.dart';
import 'package:free_tube_player/widget/svg_view.dart';
import 'package:get/get.dart';

class UserHomeTabPage extends StatefulWidget {
  const UserHomeTabPage({super.key});

  @override
  State<UserHomeTabPage> createState() => _UserModePageState();
}

class _UserModePageState extends State<UserHomeTabPage> {
  final pageController = Get.put(UserHomeTabPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(),
      body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController.pageController,
          children: const [
            SizedBox(),
            TMDBPage(),
            UserYoutubeHome(),
            VideoHomePage(),
            SizedBox(),
          ]),
    );
  }

  Widget _bottomNavigationBar() {
    return Obx(() => Container(
      padding: const EdgeInsets.only(bottom: 8),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: pageController.index.value,
              onTap: (index) {
                pageController.onTapBottomNavigationBar(index);
              },
              items: [
                _bottomItem(
                  pageController.isSelect(0) ? Assets.svgHomeShortVideoSelect : Assets.svgHomeShortVideoNormal,
                  S.current.shorts,
                  color: pageController.isSelect(0) ? ColorRes.themeColor : ColorRes.accentTextColor,
                ),
                _bottomItem(
                  pageController.isSelect(1) ? Assets.svgHomeMovieSelect : Assets.svgHomeMovieNormal,
                  S.current.movie,
                  color: pageController.isSelect(1) ? ColorRes.themeColor : ColorRes.accentTextColor,
                ),
                _bottomItem(
                  pageController.isSelect(2) ? Assets.svgHomeSelect : Assets.svgHomeNormal,
                  S.current.home,
                  color: pageController.isSelect(2) ? ColorRes.themeColor : ColorRes.accentTextColor,
                ),
                _bottomItem(
                  pageController.isSelect(3) ? Assets.svgHomeLocalFileSelect : Assets.svgHomeLocalFileNormal,
                  S.current.file,
                  color: pageController.isSelect(3) ? ColorRes.themeColor : ColorRes.accentTextColor,
                ),
                _bottomItem(
                  pageController.isSelect(4) ? Assets.svgHomeLibrarySelect : Assets.svgHomeLibraryNormal,
                  S.current.library,
                  color: pageController.isSelect(4) ? ColorRes.themeColor : ColorRes.accentTextColor,
                ),
              ]),
        ));
  }

  BottomNavigationBarItem _bottomItem(String assets, String title, {double size = 22.0, Color? color}) {
    return BottomNavigationBarItem(
        icon: Container(
          width: size,
          height: size,
          margin: const EdgeInsets.only(bottom: 4),
          child: SVGView(
            assetName: assets,
            color: color ?? AppThemeController.textAccentColor(context),
          ),
        ),
        label: title);
  }
}
