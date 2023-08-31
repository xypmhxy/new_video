import 'package:flutter/material.dart';

BorderRadius getBorderRadius(double radius) {
  return BorderRadius.all(Radius.circular(radius));
}

BorderRadius getTopBorderRadius(double radius) {
  return BorderRadius.only(
      topLeft: Radius.circular(radius), topRight: Radius.circular(radius));
}

BorderRadius getBottomBorderRadius(double radius) {
  return BorderRadius.only(
      bottomLeft: Radius.circular(radius),
      bottomRight: Radius.circular(radius));
}

BorderRadius getLeftBorderRadius(double radius) {
  return BorderRadius.only(
      topLeft: Radius.circular(radius), bottomLeft: Radius.circular(radius));
}

BorderRadius getRightBorderRadius(double radius) {
  return BorderRadius.only(
      topRight: Radius.circular(radius), bottomRight: Radius.circular(radius));
}

BorderRadius getRadius(
    {double leftTopRadius = 0,
    double rightTopRadius = 0,
    double leftBottomRadius = 0,
    double rightBottomRadius = 0}) {
  return BorderRadius.only(
      topLeft: Radius.circular(leftTopRadius),
      topRight: Radius.circular(rightTopRadius),
      bottomLeft: Radius.circular(leftBottomRadius),
      bottomRight: Radius.circular(rightBottomRadius));
}

BoxDecoration radiusDecoration(
    {BorderRadiusGeometry? radius, Color color = Colors.white}) {
  return BoxDecoration(borderRadius: radius, color: color);
}

BoxDecoration allRadiusDecoration(double radius, {Color color = Colors.white}) {
  return radiusDecoration(radius: getBorderRadius(radius), color: color);
}

BoxDecoration outLineRadiusDecoration(double radius,
    {Color color = Colors.white,double width = 1.0}) {
  return BoxDecoration(
      borderRadius: getBorderRadius(radius), border: Border.all(color: color,width: width));
}

BoxDecoration gradientDecoration(Gradient gradient, {double radius = 0}) {
  return BoxDecoration(
      gradient: gradient, borderRadius: getBorderRadius(radius));
}
