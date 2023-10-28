/*
* 作者 Ren
* 时间  2023/8/5 12:36
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/resource/color_res.dart';

class ImageButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final Widget child;
  final double? splashRadius;
  final double? size;
  final double? width;
  final double? height;

  const ImageButton(
      {super.key,
      required this.child,
      this.onPressed,
      this.padding,
      this.splashRadius,
      this.size,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        padding: padding ?? EdgeInsets.zero,
        splashRadius: splashRadius ?? size ?? width ?? height ?? 24,
        constraints: BoxConstraints(minWidth: size ?? width ?? 24, minHeight: size ?? height ?? 24),
        icon: child);
  }
}
