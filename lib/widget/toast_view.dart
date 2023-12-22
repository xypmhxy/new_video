import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/app/resource/color_res.dart';
import 'package:free_tube_player/generated/assets.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/svg_view.dart';

class ToastView extends StatelessWidget {
  ///信息
  final String msg;

  ///toast显示位置
  final AlignmentGeometry alignment;

  ///toast图标
  final bool isCorrect;

  const ToastView({
    Key? key,
    required this.msg,
    this.alignment = Alignment.bottomCenter,
    this.isCorrect = true,
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
        decoration:
            BoxDecoration(color: AppThemeController.backgroundColor(context), borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SVGView(assetName: isCorrect ? Assets.svgToastCorrect : Assets.svgToastAttention, size: 26),
            const Height(6),
            Text(
              msg,
              style: TextStyle(fontSize: 15, color: AppThemeController.textPrimaryColor(context)),
            )
          ],
        ),
      )),
    ));
  }
}
