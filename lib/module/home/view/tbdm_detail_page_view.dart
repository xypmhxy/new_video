/*
* 作者 Ren
* 时间  2023/9/2 10:44
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/home/callback/tmdb_detail_page_callback.dart';
import 'package:free_tube_player/module/home/controller/tmdb_detail_page_controller.dart';
import 'package:free_tube_player/widget/base_page_view.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_button.dart';
import 'package:free_tube_player/widget/image_view.dart';
import 'package:free_tube_player/widget/no_data_view.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:get/get.dart';

class TMDBDetailPageView extends BasePageView<TMDBDetailPageCallback> {
  final TMDBDetailPageController tmdbController;

  const TMDBDetailPageView({super.key, required super.pageCallback, required this.tmdbController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => SingleChildScrollView(
              child: Column(
            children: [
              _headerImage(),
              const Height(16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _title(),
                    const Height(16),
                    _info(),
                    const Height(16),
                    _genres(),
                    const Height(16),
                    _introduce(),
                    const Height(16),
                    _cast(),
                    const Height(16),
                    _recommend(),
                    const Height(16),
                    _listView(),
                    const Height(8),
                  ],
                ),
              )
            ],
          ))),
    );
  }

  Widget _headerImage() {
    return Stack(
      children: [
        ImageView.network(
          imageUrl: tmdbController.tmdbInfo.backdropPath,
          width: screenWidth,
          height: screenHeight * .33,
        ),
        Positioned(
            left: 16,
            top: statusBarHeight + 12,
            child: ImageButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  pageCallback.onClickBack();
                },
                child: const Icon(
                  Icons.arrow_back_rounded,
                  size: 26,
                ))),
      ],
    );
  }

  Widget _title() {
    return Row(
      children: [
        Expanded(
            child: TextView.primary(
          tmdbController.tmdbInfo.title,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ))
      ],
    );
  }

  Widget _info() {
    return Row(
      children: [
        Icon(
          Icons.star_rounded,
          size: 24,
          color: AppThemeController.primaryThemeColor(context),
        ),
        const Width(4),
        TextView.primary(
          tmdbController.tmdbInfo.score,
          fontSize: 15,
          color: AppThemeController.primaryThemeColor(context),
        ),
        const Width(12),
        TextView.primary(
          tmdbController.tmdbInfo.releaseDate,
          fontSize: 15,
        ),
        const Width(12),
        TextView.primary(
          tmdbController.tmdbInfo.moveDuration,
          fontSize: 15,
        )
        // _genres()
      ],
    );
  }

  Widget _genres() {
    return SizedBox(
        height: 20,
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final genre = tmdbController.tmdbInfo.genres[index];
              return Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius: getBorderRadius(6),
                      border: Border.all(width: 1, color: AppThemeController.primaryThemeColor(context))),
                  child: TextView.primary(
                    genre,
                    color: AppThemeController.primaryThemeColor(context),
                    fontSize: 13,
                    height: 1.1,
                  ));
            },
            separatorBuilder: (_, index) {
              return const Width(8);
            },
            itemCount: tmdbController.tmdbInfo.genres.length));
  }

  Widget _introduce() {
    return TextView.primary(tmdbController.tmdbInfo.overview, fontSize: 15, fontWeight: FontWeight.normal, height: 1.4);
  }

  Widget _cast() {
    return SizedBox(
        height: 64,
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final cast = tmdbController.tmdbInfo.casts[index];
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                      borderRadius: getBorderRadius(32),
                      clipBehavior: Clip.hardEdge,
                      child: ImageView.network(imageUrl: cast.profilePath, placeholderIconSize: 32, size: 64)),
                  const Width(8),
                  SizedBox(width: 48, child: TextView.primary(cast.name, fontSize: 12, fontWeight: FontWeight.normal))
                ],
              );
            },
            separatorBuilder: (_, index) {
              return const Width(6);
            },
            itemCount: tmdbController.tmdbInfo.casts.length));
  }

  Widget _recommend() {
    return TextView.primary(S.current.recommended);
  }

  Widget _listView() {
    return Obx(() {
      if (tmdbController.tmdbInfos.isEmpty) {
        return Center(
          child: NoDataView(
            text: S.current.noRecommended,
            iconSize: 196,
          ),
        );
      }
      return SizedBox(
          width: screenWidth - 20,
          height: (screenWidth - 20) / 2 / .6,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: tmdbController.tmdbInfos.length,
              itemBuilder: (_, index) {
                final tmdbInfo = tmdbController.tmdbInfos[index];
                return GestureDetector(
                  onTap: () {
                    pageCallback.onClickItem(tmdbInfo);
                  },
                  child: SizedBox(
                      width: (screenWidth - 30) / 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: getBorderRadius(10),
                            child: AspectRatio(
                                aspectRatio: .725,
                                child: Stack(
                                  children: [
                                    Positioned.fill(child: ImageView.network(imageUrl: tmdbInfo.posterPath)),
                                    Positioned(
                                        left: 8,
                                        top: 8,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                                          decoration: allRadiusDecoration(4,
                                              color: AppThemeController.primaryThemeColor(context)),
                                          child: TextView.primary(tmdbInfo.score,
                                              fontSize: 14, fontWeight: FontWeight.normal),
                                        ))
                                  ],
                                )),
                          ),
                          const Height(6),
                          TextView.primary(tmdbInfo.title, fontSize: 14, maxLines: 1, overflow: TextOverflow.ellipsis),
                          TextView.primary(tmdbInfo.releaseDate, fontSize: 14)
                        ],
                      )),
                );
              },
              separatorBuilder: (_, index) {
                return const Width(10);
              }));
    });
  }
}
