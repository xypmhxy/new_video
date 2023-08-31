import 'package:flutter/material.dart';

enum TextThemeType { primary, accent }

class TextView extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final double? height;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextStyle? textStyle;
  final TextThemeType themeType;

  const TextView(this.text,
      {Key? key,
      required this.themeType,
      this.fontFamily,
      this.textAlign,
      this.maxLines,
      this.fontSize,
      this.height,
      this.color,
      this.fontWeight,
      this.overflow,
      this.textStyle})
      : super(key: key);

  const TextView.primary(this.text,
      {super.key,
      this.themeType = TextThemeType.primary,
      this.fontFamily,
      this.textAlign,
      this.maxLines,
      this.fontSize,
      this.height,
      this.color,
      this.fontWeight,
      this.overflow,
      this.textStyle});

  const TextView.accent(this.text,
      {super.key,
      this.themeType = TextThemeType.accent,
      this.fontFamily,
      this.textAlign,
      this.maxLines,
      this.fontSize,
      this.height,
      this.color,
      this.fontWeight,
      this.overflow,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: textStyle ??
          _getTextStyle(context).copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontFamily: fontFamily,
              height: height),
    );
  }

  TextStyle _getTextStyle(BuildContext context) {
    TextStyle? textStyle = const TextStyle();
    switch (themeType) {
      case TextThemeType.primary:
        textStyle = Theme.of(context).textTheme.titleLarge;
        break;
      case TextThemeType.accent:
        textStyle = Theme.of(context).textTheme.titleMedium;
        break;
    }
    return textStyle ?? const TextStyle();
  }
}
