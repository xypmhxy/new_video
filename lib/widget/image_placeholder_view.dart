/*
* 作者 Ren
* 时间  2023/9/2 08:09
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/resource/color_res.dart';

class ImagePlaceHolderView extends StatelessWidget {
  final double iconSize;
  final double? width;
  final double? height;

  const ImagePlaceHolderView({super.key, this.iconSize = 48, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: ColorRes.colorE0E0E0,
      child: UnconstrainedBox(
        child: Icon(
          Icons.image_rounded,
          size: iconSize,
          color: ColorRes.textPrimaryColor,
        ),
      ),
    );
  }
}
