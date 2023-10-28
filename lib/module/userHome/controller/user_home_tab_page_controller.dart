/*
* 作者 Ren
* 时间  2023/9/10 10:27
*/

import 'package:flutter/material.dart';
import 'package:free_tube_player/app/common/common.dart';
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

  Future<void> onAppLifecycleChange(isBackground) async {
    if (isBackground) {
      final isBackgroundPlay = userPlayerController.isBackgroundPlayback.value;
      if (isBackgroundPlay) {
        if (userPlayerController.isPlaying) {
          if (isIOS) await Future.delayed(const Duration(milliseconds: 400));
          userPlayerController.play();
        }
      } else {
        userPlayerController.pause();
      }
    } else {
      ///
    }
  }
}
