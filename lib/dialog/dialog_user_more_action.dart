import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/generated/assets.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/helper/video_action_helper.dart';
import 'package:free_tube_player/utils/dialog_utils.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_view.dart';
import 'package:free_tube_player/widget/svg_view.dart';
import 'package:free_tube_player/widget/text_view.dart';

class DialogUserMoreAction extends StatefulWidget {
  final MediaInfo mediaInfo;
  final VoidCallback? onClickShare;
  final VoidCallback? onClickDownload;
  final AsyncCallback? onClickLike;
  final VoidCallback? onClickWatchLater;
  final VoidCallback? onClickDeleteHistory;
  final bool isShowHistory;

  const DialogUserMoreAction({
    super.key,
    required this.mediaInfo,
    this.onClickShare,
    this.onClickDownload,
    this.onClickLike,
    this.onClickWatchLater,
    this.onClickDeleteHistory,
    this.isShowHistory = false,
  });

  @override
  State<DialogUserMoreAction> createState() => _DialogUserMoreActionState();
}

class _DialogUserMoreActionState extends State<DialogUserMoreAction> {
  bool isLike = false;

  @override
  void initState() {
    query();
    super.initState();
  }

  Future<void> query() async {
    final like = await VideoActionHelper.queryLikeStatus(widget.mediaInfo);
    isLike = like;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: allRadiusDecoration(16, color: AppThemeController.backgroundColor(context)),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [const Height(16), _info(), _content(context), const Height(20)],
      ),
    );
  }

  Widget _info() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
            borderRadius: getBorderRadius(4),
            child: ImageView.network(
              imageUrl: widget.mediaInfo.thumbnail ?? '',
              size: 40,
            )),
        const Width(16),
        Expanded(
            child: TextView.primary(
          widget.mediaInfo.title,
          fontSize: 14,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )),
        const Width(8),
        GestureDetector(
            onTap: () {
              DialogUtils.dismiss();
            },
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.only(left: 4, right: 4, bottom: 4),
              child: GestureDetector(
                child: const Icon(
                  Icons.close_rounded,
                ),
              ),
            ))
      ],
    );
  }

  Widget _content(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      children: [
        _item(context,
            svg: isLike ? Assets.svgLikeSelect : Assets.svgLikeNormal,
            title: S.current.like,
            size: 29,
            color: isLike ? AppThemeController.primaryThemeColor(context) : null, onPressed: () async {
          widget.onClickLike?.call().then((value) => query());
        }),
        _item(context, svg: Assets.svgDownload, title: S.current.download, onPressed: widget.onClickDownload),
        // _item(context, svg: Assets.svgAddToList, title: S.current.playlist, onPressed: onClickAddList),
        _item(context, svg: Assets.svgShare, title: S.current.share, onPressed: widget.onClickShare, size: 29),
        _item(context,
            svg: Assets.svgWatchLater, title: S.current.watchLater, onPressed: widget.onClickWatchLater, size: 27),
        if (widget.isShowHistory)
          _item(context,
              svg: Assets.svgUserDelete, title: S.current.clearHistory, onPressed: widget.onClickDeleteHistory, size: 27),
      ],
    );
  }

  Widget _item(
    BuildContext context, {
    required String svg,
    required String title,
    VoidCallback? onPressed,
    double size = 32,
    Color? color,
  }) {
    return GestureDetector(
        onTap: onPressed,
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
                  color: color ?? AppThemeController.textPrimaryColor(context),
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
        ));
  }
}
