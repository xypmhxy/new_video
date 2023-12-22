import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:free_tube_player/widget/toast_view.dart';

class ToastUtils {
  static show(String text,
      {Alignment alignment = Alignment.center,
      bool isDefaultDismissType = false,
      int milliseconds = 3000,
      bool isCorrect = true}) {
    SmartDialog.showToast("", animationType: SmartAnimationType.fade, animationTime: const Duration(milliseconds: 500),
        builder: (context) {
      return ToastView(
        msg: text,
        alignment: alignment,
        isCorrect: isCorrect,
      );
    },
        displayTime: Duration(milliseconds: milliseconds),
        displayType: SmartToastType.onlyRefresh,
        alignment: alignment);
  }
}
