/*
* 作者 Ren
* 时间  2023/8/31 08:09
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/base/base_controller.dart';
import 'package:get/get.dart';

class HomePageController extends BaseController {
  final pageIndex = 0.obs;
  final PageController pageController = PageController();

  void changePage(int index) {
    pageIndex.value = index;
    pageController.jumpToPage(index);
  }
}
