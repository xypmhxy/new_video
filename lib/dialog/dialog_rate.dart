/*
* 作者 Ren
* 时间  2024/1/20 09:51
*/

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/app/resource/color_res.dart';
import 'package:free_tube_player/generated/assets.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/utils/dialog_utils.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/svg_view.dart';
import 'package:free_tube_player/widget/text_view.dart';

class DialogRate extends StatelessWidget {
  final ValueChanged<double>? onRatingUpdate;

  const DialogRate({super.key, this.onRatingUpdate});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth - 48,
      decoration: allRadiusDecoration(16, color: AppThemeController.backgroundColor(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [const Height(8), _image(), const Height(8), _title(), const Height(12), _rate(), const Height(16)],
      ),
    );
  }

  Widget _closeButton() {
    return Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: () {
            DialogUtils.dismiss();
          },
          child: const Padding(padding: EdgeInsets.all(10), child: Icon(Icons.close_rounded)),
        ));
  }

  Widget _image() {
    return const SVGView(assetName: Assets.svgRate, width: 156);
  }

  Widget _title() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: TextView.primary(
          S.current.rateTitle,
          fontSize: 15,
          textAlign: TextAlign.center,
        ));
  }

  Widget _rate() {
    return RatingBar.builder(
      initialRating: 5,
      minRating: 1,
      itemSize: 30,
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4),
      itemBuilder: (context, _) => const SVGView(assetName: Assets.svgLikeSelect, color: ColorRes.themeColor),
      onRatingUpdate: (rating) {
        onRatingUpdate?.call(rating);
      },
    );
  }
}
