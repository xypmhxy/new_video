/*
* 作者 Ren
* 时间  2023/8/6 16:09
*/
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SVGView extends StatelessWidget {
  final String assetName;
  final double? size;
  final double? width;
  final double? height;
  final BoxFit? boxFit;
  final Color? color;

  const SVGView({super.key, required this.assetName, this.color,this.size, this.width, this.height, this.boxFit});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      width: size ?? width,
      height: size ?? height,
      color: color,
    );
  }
}
