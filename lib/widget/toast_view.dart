import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/widget/divider.dart';

class ToastView extends StatelessWidget {
  ///信息
  final String msg;

  ///toast显示位置
  final AlignmentGeometry alignment;

  const ToastView({
    Key? key,
    required this.msg,
    this.alignment = Alignment.bottomCenter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
        child: Container(
      alignment: alignment,
      child: UnconstrainedBox(
          child: Container(
        constraints: BoxConstraints(maxWidth: screenWidth - 60),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
            color: AppThemeController.primaryThemeColor(context), borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.error_rounded,
              color: AppThemeController.counterTextPrimaryColor(context),
              size: 25,
            ),
            const Width(10),
            Flexible(
                child: Text(
              msg,
              style: const TextStyle(fontSize: 15,color: Colors.white),
            ))
          ],
        ),
      )),
    ));
  }
}
