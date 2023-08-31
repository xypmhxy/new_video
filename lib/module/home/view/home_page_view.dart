/*
* 作者 Ren
* 时间  2023/8/5 10:07
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_utils.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/app/resource/color_res.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/home/callback/home_page_callback.dart';
import 'package:free_tube_player/module/home/controller/home_page_controller.dart';
import 'package:free_tube_player/module/home/page/android_home_page.dart';
import 'package:free_tube_player/widget/base_page_view.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_button.dart';
import 'package:get/get.dart';

class HomePageView extends BasePageView<HomePageCallback> {
  final HomePageController homePageController;

  const HomePageView({super.key, required HomePageCallback pageCallback, required this.homePageController})
      : super(pageCallback: pageCallback);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavigation(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(AppUtils.appName),
      actions: [
        ImageButton(
            onPressed: () {
              pageCallback.onClickSetting();
            },
            child: const Icon(
              Icons.settings_rounded,
            )),
        const Width(16)
      ],
    );
  }

  Widget _bottomNavigation() {
    return ClipRRect(
      borderRadius: getTopBorderRadius(20),
      child: Obx(() => BottomNavigationBar(
              currentIndex: homePageController.pageIndex.value,
              onTap: (index) {
                pageCallback.onPageChanged(index);
              },
              selectedIconTheme: const IconThemeData(size: 26),
              items: [
                BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.home_rounded,
                      color: ColorRes.color959595,
                    ),
                    activeIcon: const Icon(Icons.home_rounded),
                    label: S.current.home),
                BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.movie_filter_rounded,
                      color: ColorRes.color959595,
                    ),
                    activeIcon: const Icon(Icons.movie_filter_rounded),
                    label: S.current.movie)
              ])),
    );
  }

  Widget _body() {
    return PageView(
      controller: homePageController.pageController,
      children: const [AndroidHomePage(), AndroidHomePage()],
      onPageChanged: (index) {
        pageCallback.onPageChanged(index);
      },
    );
  }
}
