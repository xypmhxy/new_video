/*
* 作者 Ren
* 时间  2023/8/23 07:42
*/

import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/resource/color_res.dart';
import 'package:free_tube_player/generated/assets.dart';
import 'package:free_tube_player/widget/color_button.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/svg_view.dart';
import 'package:free_tube_player/widget/text_view.dart';

class NoDataView extends StatelessWidget {
  final double? iconSize;
  final String text;
  final String? button;
  final VoidCallback? onClick;

  const NoDataView({super.key, required this.text, this.iconSize, this.button, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SVGView(
          assetName: Assets.svgNoData,
          size: iconSize ?? 236,
        ),
        const Height(16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: TextView.primary(text, fontSize: 16, textAlign: TextAlign.center, fontWeight: FontWeight.w500),
        ),
        if (button != null) const Height(16),
        if (button != null)
          ColorButton(
              onPressed: onClick,
              color: ColorRes.themeColor,
              child: TextView.primary(
                button!,
                color: AppThemeController.counterTextPrimaryColor(context),
              ))
      ],
    );
  }
}
