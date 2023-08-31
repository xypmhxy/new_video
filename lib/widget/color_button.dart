/*
* 作者 Ren
* 时间  2023/8/6 18:16
*/

import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/decoration.dart';

import 'text_view.dart';

class ColorButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Size? size;
  final Color? color;
  final BorderRadius? borderRadius;

  const ColorButton({super.key, this.onPressed, required this.child, this.color, this.size, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            elevation: MaterialStateProperty.all(0),
            minimumSize: MaterialStateProperty.all(size),
            shape:
                MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: borderRadius ?? getBorderRadius(32)))),
        child: child);
  }
}

class NegativeTextButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final Size? size;
  final Color? color;
  final BorderRadius? borderRadius;

  const NegativeTextButton({super.key, this.text, this.onPressed, this.color, this.size, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    var textColor = AppThemeController.textPrimaryColor(context);
    if (AppThemeController.isLight(context)) {
      textColor = AppThemeController.primaryThemeColor(context);
    }
    return ColorButton(
      onPressed: onPressed,
      size: size,
      borderRadius: borderRadius,
      color: AppThemeController.disableColor(context),
      child: TextView.primary(
        text ?? '',
        color: textColor,
        fontSize: 15,
      ),
    );
  }
}

class ColorTextButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final Size? size;
  final Color? color;
  final BorderRadius? borderRadius;

  const ColorTextButton({super.key, this.text, this.onPressed, this.color, this.size, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return ColorButton(
      onPressed: onPressed,
      size: size,
      borderRadius: borderRadius,
      child: TextView.primary(
        text ?? '',
        color: Colors.white,
        fontSize: 15,
      ),
    );
  }
}
