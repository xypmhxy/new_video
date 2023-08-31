/*
* 作者 Ren
* 时间  2023/8/6 17:19
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/generated/assets.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/utils/dialog_utils.dart';
import 'package:free_tube_player/widget/color_button.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_view.dart';
import 'package:free_tube_player/widget/text_view.dart';

class DialogConfirm extends StatelessWidget {
  final String? title;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;

  const DialogConfirm({super.key, this.title, this.onConfirm, this.onCancel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth - 48,
      height: 210,
      child: Stack(
        children: [
          Positioned(
              top: 20,
              child: Container(
                width: screenWidth - 48,
                decoration: allRadiusDecoration(16, color: AppThemeController.backgroundColor(context)),
                child: Column(
                  children: [
                    _closeButton(),
                    const Height(18),
                    _title(),
                    const Height(24),
                    _buttons(context),
                    const Height(16)
                  ],
                ),
              )),
          Align(
            alignment: Alignment.topCenter,
            child: ClipOval(
              child: Container(
                color: Colors.white,
                child: ImageView.asset(
                  Assets.imagesWarning,
                  size: 54,
                ),
              ),
            ),
          ),
        ],
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

  Widget _title() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextView.primary(
          title ?? '',
          textAlign: TextAlign.center,
          fontSize: 15,
        ));
  }

  Widget _buttons(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      NegativeTextButton(
        size: Size((screenWidth - 48) / 3, 36),
        text: S.current.cancel,
        onPressed: onCancel,
      ),
      ColorTextButton(
        size: Size((screenWidth - 48) / 3, 36),
        text: S.current.confirm,
        onPressed: onConfirm,
      )
    ]);
  }
}
