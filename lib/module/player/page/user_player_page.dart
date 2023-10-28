/*
* 作者 Ren
* 时间  2023/9/13 07:49
*/
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/extension/comment_extension.dart';
import 'package:free_tube_player/generated/assets.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/player/controller/comment_controller.dart';
import 'package:free_tube_player/module/player/controller/player_controller.dart';
import 'package:free_tube_player/module/player/controller/user_player_page_controller.dart';
import 'package:free_tube_player/module/player/page/dialog_comment.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_view.dart';
import 'package:free_tube_player/widget/loading_view.dart';
import 'package:free_tube_player/widget/svg_view.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'recommend_tab_page.dart';

class UserPlayerPage extends StatefulWidget {
  const UserPlayerPage({super.key});

  @override
  State<UserPlayerPage> createState() => _UserPlayerPageState();
}

class _UserPlayerPageState extends State<UserPlayerPage> {
  final _userPlayerPageController = UserPlayerPageController();
  final _commentController = CommentController();

  @override
  void initState() {
    _userPlayerPageController
        .requestWatchPageInfo(userPlayerController.nowPlayingMedia!)
        .then((value) => _commentController.requestComment(_userPlayerPageController.video.value));
    _userPlayerPageController.requestAuthorInfo(userPlayerController.nowPlayingMedia?.authorId ?? '');
    super.initState();
  }

  @override
  void dispose() {
    _userPlayerPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SlidingUpPanel(
      minHeight: 0,
      maxHeight: screenHeight * .71,
      color: Colors.transparent,
      controller: _userPlayerPageController.panelController,
      panelBuilder: (scrollController) {
        return DialogComment(
          commentController: _commentController,
          video: _userPlayerPageController.video.value,
          scrollController: scrollController,
          onClickClose: () {
            _userPlayerPageController.panelController.close();
          },
        );
      },
      body: SafeArea(
        child: Column(children: [
          _playerWidget(),
          _videoInfoRecommend(),
        ]),
      ),
    ));
  }

  Widget _videoInfoRecommend() {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DefaultTabController(
                length: 2,
                child: NestedScrollView(
                  headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                    return [
                      _height(16),
                      _title(),
                      _height(16),
                      _controlBar(),
                      _height(16),
                      _authorInfo(),
                      _height(4),
                      SliverAppBar(
                          leading: const SizedBox(),
                          backgroundColor: AppThemeController.backgroundColor(context),
                          toolbarHeight: 48,
                          pinned: true,
                          flexibleSpace: _commentsView()),
                    ];
                  },
                  body: const RecommendTabPage(),
                ))));
  }

  Widget _playerWidget() {
    return Container(
      width: screenWidth,
      height: screenWidth * .562,
      alignment: Alignment.center,
      child: Obx(() {
        if (userPlayerController.playStatus.value == PlayStatus.loading ||
            userPlayerController.playStatus.value == PlayStatus.none) {
          final ratio = userPlayerController.nowPlayingMedia?.getVideoRatio() ?? 1.78;
          return Stack(
            children: [
              Center(
                child: Hero(
                    tag: userPlayerController.nowPlayingMedia?.identify ?? '?',
                    child: AutoImageView(
                      imageUrl: userPlayerController.nowPlayingMedia?.thumbnail,
                      fit: BoxFit.cover,
                      width: screenWidth,
                      height: screenWidth / ratio,
                    )),
              ),
              const Center(
                child: LoadingView(size: 36),
              )
            ],
          );
        }
        return Chewie(
          controller: userPlayerController.chewieController,
        );
      }),
    );
  }

  Widget _title() {
    return SliverToBoxAdapter(
      child: Obx(() {
        final mediaInfo = userPlayerController.nowPlayingMedia;
        final viewCountText = mediaInfo?.viewCountText ?? '';
        final publishedTime = mediaInfo?.publishedTime ?? '';
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView.primary(
              mediaInfo?.title ?? '',
              fontSize: 18,
              maxLines: 3,
              fontWeight: FontWeight.w600,
              overflow: TextOverflow.ellipsis,
            ),
            const Height(6),
            TextView.accent('$viewCountText  ·  $publishedTime',
                color: AppThemeController.textPrimaryColor(context).withOpacity(.7),
                fontWeight: FontWeight.normal,
                fontSize: 12)
          ],
        );
      }),
    );
  }

  Widget _controlBar() {
    return SliverToBoxAdapter(
      child: Obx(() {
        final mediaInfo = userPlayerController.nowPlayingMedia;
        final isLike = mediaInfo?.isLike ?? false;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _controlItem(isLike ? Assets.svgLikeSelect : Assets.svgLikeNormal, mediaInfo?.formatLikeCount() ?? '-',
                color: isLike ? AppThemeController.primaryThemeColor(context) : null),
            _controlItem(isLike ? Assets.svgLoopSelect : Assets.svgLoopNormal, S.current.loop,
                color: isLike ? AppThemeController.primaryThemeColor(context) : null),
            _controlItem(Assets.svgDownload, S.current.download),
            _controlItem(Assets.svgShare, S.current.share),
          ],
        );
      }),
    );
  }

  Widget _controlItem(String svg, String text, {Color? color}) {
    return Wrap(
      spacing: 6,
      crossAxisAlignment: WrapCrossAlignment.center,
      direction: Axis.vertical,
      children: [
        SVGView(
          assetName: svg,
          size: 24,
          color: color ?? AppThemeController.textPrimaryColor(context),
        ),
        TextView.primary(text, fontSize: 12)
      ],
    );
  }

  Widget _authorInfo() {
    return SliverToBoxAdapter(
      child: Obx(() {
        final mediaInfo = userPlayerController.nowPlayingMedia;
        final authorInfo = _userPlayerPageController.authorInfo;
        final subscribeCount = authorInfo.value?.subscribeCount;
        final videoCount = authorInfo.value?.videoCountText;
        return Row(
          children: [
            ClipOval(
              child: AutoImageView(
                imageUrl: mediaInfo?.authorThumbnail ?? '',
                size: 50,
              ),
            ),
            const Width(12),
            Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: screenWidth * .7),
                child: TextView.primary(
                  mediaInfo?.author ?? '',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Height(4),
              Visibility(
                  visible: subscribeCount != null || videoCount != null,
                  child: TextView.accent(
                    '${subscribeCount ?? ''}  ·  ${S.current.paramsVideos('$videoCount')}',
                    fontSize: 12,
                  ))
            ])
          ],
        );
      }),
    );
  }

  Widget _commentsView() {
    return GestureDetector(
        onTap: () {
          _userPlayerPageController.showCommentDialog(context, _commentController);
        },
        child: Container(
            height: 48,
            color: Colors.transparent,
            alignment: Alignment.centerLeft,
            child: Obx(() => Row(
                  children: [
                    TextView.primary(S.current.comments, fontSize: 15, fontWeight: FontWeight.normal),
                    const Width(8),
                    TextView.primary(
                      _commentController.commentsList.value?.formatTotalCount() ?? '',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 8),
                      child: SVGView(
                        assetName: Assets.svgExpandComment,
                        color: AppThemeController.textPrimaryColor(context),
                        size: 18,
                      ),
                    ))
                  ],
                ))));
  }

  Widget _height(double height) {
    return SliverToBoxAdapter(child: Height(height));
  }
}
