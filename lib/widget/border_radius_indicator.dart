/*
* 作者 Ren
* 时间  2023/11/6 21:02
*/

import 'package:flutter/material.dart';

/// A customizable [Decoration] which can define
/// the appearance of the selected tab indicator.
class BorderRadiusIndicator extends Decoration {
  final double? height;
  final Color? color;
  final Radius? radius;

  const BorderRadiusIndicator({
    this.height,
    this.color = const Color(0xFF2196F3),
    this.radius,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _ContainerTabPainter(indicator: this, height: height, color: color, radius: radius);
  }
}

class _ContainerTabPainter extends BoxPainter {
  final double? height;
  final Color? color;
  final Radius? radius;

  _ContainerTabPainter({
    required this.indicator,
    this.height,
    this.color = const Color(0xFF2196F3),
    this.radius,
  });

  final BorderRadiusIndicator indicator;
  final Paint _paint = Paint();

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null); // todo ?!
    final width = configuration.size?.width ?? 100;
    final left = offset.dx;
    final top = configuration.size!.height - 6;
    final right = left + width;
    final bottom = top + (height ?? 3);
    _paint.style = PaintingStyle.fill;
    _paint.color = color ?? Colors.white;
    canvas.drawRRect(RRect.fromLTRBR(left, top, right, bottom, radius ?? const Radius.circular(2)), _paint);
  }
}
