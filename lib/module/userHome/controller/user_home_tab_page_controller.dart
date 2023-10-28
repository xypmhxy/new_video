/*
* 作者 Ren
* 时间  2023/9/10 10:27
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserHomeTabPageController {
  final pageController = PageController(initialPage: 2);
  final index = 2.obs;

  void onTapBottomNavigationBar(int index) {
    this.index.value = index;
    pageController.jumpToPage(index);
  }

  bool isSelect(int index) {
    return this.index.value == index;
  }
}
