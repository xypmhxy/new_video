/*
* 作者 Ren
* 时间  2023/8/5 10:07
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/module/home/callback/home_page_callback.dart';
import 'package:free_tube_player/module/home/controller/home_page_controller.dart';
import 'package:free_tube_player/module/home/view/home_page_view.dart';
import 'package:free_tube_player/module/setting/setting_page.dart';
import 'package:free_tube_player/utils/page_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements HomePageCallback {
  final _homePageController = HomePageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomePageView(pageCallback: this, homePageController: _homePageController);
  }

  @override
  void onClickSetting() {
    PageNavigation.startNewPage(const SettingPage());
  }

  @override
  void onPageChanged(int index) {
    _homePageController.changePage(index);
  }
}
