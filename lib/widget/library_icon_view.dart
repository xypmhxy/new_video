/*
* 作者 Ren
* 时间  2023/12/18 21:08
*/

import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/generated/assets.dart';
import 'package:free_tube_player/widget/svg_view.dart';

class LibraryIconView extends StatelessWidget {
  final String icon;
  final double? size;

  const LibraryIconView({super.key, required this.icon, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: AppThemeController.primaryThemeColor(context).withOpacity(.1)),
      child: Image.asset(
        icon,
        width: size ?? 20,
        height: size ?? 20,
      ),
    );
  }
}
