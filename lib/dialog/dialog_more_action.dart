/*
* 作者 Ren
* 时间  2023/8/6 15:54
*/

import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/generated/assets.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/utils/dialog_utils.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/svg_view.dart';
import 'package:free_tube_player/widget/text_view.dart';

class DialogMoreAction extends StatelessWidget {
  final VoidCallback? onClickRename;
  final VoidCallback? onClickDelete;
  final VoidCallback? onClickVideoEditor;
  final VoidCallback? onClickDeleteHistory;

  const DialogMoreAction(
      {super.key, this.onClickRename, this.onClickDelete, this.onClickVideoEditor, this.onClickDeleteHistory});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 120, maxHeight: 160),
      decoration: allRadiusDecoration(16, color: AppThemeController.backgroundColor(context)),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
                onTap: () {
                  DialogUtils.dismiss();
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 4, top: 4),
                  padding: const EdgeInsets.all(4),
                  child: GestureDetector(
                    child: const Icon(
                      Icons.close_rounded,
                    ),
                  ),
                ))),
        Expanded(
            child: GridView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
          ),
          children: [
            _item(context, svg: Assets.svgEditor, title: S.current.rename, size: 29, onPressed: onClickRename),
            _item(context, svg: Assets.svgDelete, title: S.current.delete, onPressed: onClickDelete),
            _item(context, svg: Assets.svgVideoEditor, title: S.current.edit, onPressed: onClickVideoEditor),
            _item(context,
                svg: Assets.svgDeleteHistory, title: S.current.clearHistory, size: 29, onPressed: onClickDeleteHistory),
          ],
        ))
      ]),
    );
  }

  Widget _item(BuildContext context,
      {required String svg, required String title, VoidCallback? onPressed, double size = 32}) {
    return GestureDetector(
        onTap: onPressed,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: allRadiusDecoration(12, color: AppThemeController.colorF5F5F5(context)),
                child: UnconstrainedBox(
                  child: SVGView(
                    assetName: svg,
                    size: size,
                    color: AppThemeController.textPrimaryColor(context),
                  ),
                ),
              ),
              const Height(8),
              TextView.primary(
                title,
                fontSize: 12,
                color: AppThemeController.textPrimaryColor(context),
              )
            ],
          ),
        ));
  }
}
