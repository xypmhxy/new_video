/*
* 作者 Ren
* 时间  2023/7/24 07:27
*/

import 'dart:math';

import 'package:flutter/material.dart';

class ColorRes {
  static const themeColor = Color(0XFFFC3259);
  static const negativeColor = Color(0XFFFFE7EC);
  static const negativeDarkColor = Color(0XFF282A30);
  static const backgroundColor = Color(0XFF131418);
  static const textPrimaryColor = Colors.white;
  static const accentTextColor = Color(0XFF8B8F8D);
  static const colorF5F5F5 = Color(0XFFF5F5F5);
  static const colorE0E0E0 = Color(0xFFE0E0E0);
  static const color959595 = Color(0xFF959595);
  static const randomColors = [
    Colors.green,
    Colors.orange,
    Colors.redAccent,
    Colors.blue,
    Colors.cyanAccent,
    Colors.deepPurpleAccent,
    Colors.purpleAccent,
    Colors.pinkAccent,
    Colors.teal,
  ];

  static Color randomColor() {
    int index = Random.secure().nextInt(randomColors.length);
    return randomColors[index];
  }
}
