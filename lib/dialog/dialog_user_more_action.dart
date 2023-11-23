import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/generated/assets.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/utils/dialog_utils.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/svg_view.dart';
import 'package:free_tube_player/widget/text_view.dart';

class DialogUserMoreAction extends StatelessWidget {
  final VoidCallback? onClickAddList;
  final VoidCallback? onClickDownload;
  final VoidCallback? onClickLike;

  const DialogUserMoreAction({Key? key, this.onClickAddList, this.onClickDownload, this.onClickLike}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 120, maxHeight: 180),
      decoration: allRadiusDecoration(16, color: AppThemeController.backgroundColor(context)),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [const Height(4), _closeButton(), _content(context)],
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
            child: Container(
              margin: const EdgeInsets.only(right: 4, top: 4),
              padding: const EdgeInsets.all(4),
              child: GestureDetector(
                child: const Icon(
                  Icons.close_rounded,
                ),
              ),
            )));
  }

  Widget _content(BuildContext context) {
    return Expanded(
        child: GridView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
          ),
          children: [
            _item(context, svg: Assets.svgLikeNormal, title: S.current.like, size: 29, onPressed: onClickLike),
            _item(context, svg: Assets.svgDownload, title: S.current.download, onPressed: onClickDownload),
            // _item(context, svg: Assets.svgAddToList, title: S.current.playlist, onPressed: onClickAddList),
            // _item(context, svg: Assets.svgShare, title: S.current.share, onPressed: onClickAddList,size: 29),
          ],
        ));
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
                width: 44,
                height: 44,
                decoration: allRadiusDecoration(12, color: AppThemeController.onPrimaryColor(context)),
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
