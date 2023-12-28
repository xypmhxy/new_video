/*
* 作者 Ren
* 时间  2023/9/10 10:27
*/

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/utils/date_utils.dart';
import 'package:free_tube_player/utils/toast_utils.dart';
import 'package:get/get.dart';

class UserHomeTabPageController {
  final pageController = PageController(initialPage: 0);
  final index = 0.obs;
  int lastBackPressedTime = 0;
  bool isContinuePlay = false;

  final pageChangeStreamController = StreamController<int>.broadcast();

  void onTapBottomNavigationBar(int index) {
    this.index.value = index;
    pageController.jumpToPage(index);
    pageChangeStreamController.add(index);
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
        if (userPlayerController.isPlaying) {
          userPlayerController.pause();
          isContinuePlay = true;
        }
      }
    } else {
      if (isContinuePlay) {
        userPlayerController.play();
        isContinuePlay = false;
      }
    }
  }

  bool backPressed() {
    // final isShowing = DialogUtils.isShowing();
    // if (isShowing){
    //   DialogUtils.dismiss();
    // }
    final nowTime = DateUtil.getNowDateMs();
    final intervalTime = nowTime - lastBackPressedTime;
    if (intervalTime <= 1500) return true;
    lastBackPressedTime = nowTime;
    ToastUtils.show(S.current.backPressedConfirm);
    return false;
  }
}
