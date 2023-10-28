/*
* 作者 Ren
* 时间  2023/8/6 17:19
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/utils/dialog_utils.dart';
import 'package:free_tube_player/widget/color_button.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/text_view.dart';

class DialogRename extends StatelessWidget {
  final String nowName;
  final ValueChanged<String>? onConfirm;
  final TextEditingController _textEditingController = TextEditingController();

  DialogRename({super.key, required this.nowName, this.onConfirm}) {
    _textEditingController.text = nowName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: screenWidth - 48,
          height: 210,
          decoration: allRadiusDecoration(16, color: AppThemeController.backgroundColor(context)),
          child: Column(
            children: [
              _closeButton(),
              _title(),
              const Height(24),
              _editTextView(context),
              const Height(16),
              _confirmButton(context)
            ],
          ),
        ),
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
          child: const Padding(padding: EdgeInsets.all(8), child: Icon(Icons.close_rounded)),
        ));
  }

  Widget _title() {
    return TextView.primary(
      S.current.rename,
    );
  }

  Widget _editTextView(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: allRadiusDecoration(16, color: AppThemeController.onPrimaryColor(context)),
        child: TextField(
          focusNode: FocusNode()..requestFocus(),
          cursorHeight: 18,
          cursorWidth: 2,
          textInputAction: TextInputAction.done,
          controller: _textEditingController,
          onSubmitted: (text) {
            onConfirm?.call(text);
          },
          style: TextStyle(
            color: AppThemeController.textPrimaryColor(context),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          decoration: const InputDecoration(
              border: InputBorder.none, isCollapsed: false, contentPadding: EdgeInsets.symmetric(horizontal: 8)),
        ));
  }

  Widget _confirmButton(BuildContext context) {
    return ColorButton(
        onPressed: () {
          onConfirm?.call(_textEditingController.text);
        },
        size: Size((screenWidth - 48) / 3, 40),
        child: TextView.primary(
          S.current.confirm,
          color: AppThemeController.counterTextPrimaryColor(context),
        ));
  }
}
