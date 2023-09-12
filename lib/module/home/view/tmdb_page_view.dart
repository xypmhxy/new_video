/*
* 作者 Ren
* 时间  2023/8/31 07:23
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/module/home/callback/tmdb_page_callback.dart';
import 'package:free_tube_player/module/home/controller/tmdb_page_controller.dart';
import 'package:free_tube_player/widget/base_page_view.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_view.dart';
import 'package:free_tube_player/widget/refresh_header.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class TMDBPageView extends BasePageView<TMDBPageCallback> {
  final _tmdbController = Get.find<TMDBPageController>();

  TMDBPageView({super.key, required super.pageCallback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _content(),
    );
  }

  Widget _content() {
    return Obx(() => _listViewContent());
  }

  Widget _listViewContent() {
    return SmartRefresher(
        controller: _tmdbController.refreshController,
        enablePullDown: true,
        enablePullUp: true,
        scrollDirection: Axis.vertical,
        header: const RefreshHeaderView(),
        onLoading: () {
          pageCallback.loadMoreTrending();
        },
        onRefresh: () {
          pageCallback.refreshTrending();
        },
        child: _gridView());
  }

  Widget _gridView() {
    return GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: _tmdbController.tmdbInfos.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: .6),
        itemBuilder: (_, index) {
          final tmdbInfo = _tmdbController.tmdbInfos[index];
          return GestureDetector(
            onTap: () {
              pageCallback.onClickItem(tmdbInfo);
            },
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
                                decoration:
                                    allRadiusDecoration(4, color: AppThemeController.primaryThemeColor(context)),
                                child: TextView.primary(tmdbInfo.score, fontSize: 14, fontWeight: FontWeight.normal),
                              ))
                        ],
                      )),
                ),
                const Height(6),
                TextView.primary(tmdbInfo.title, fontSize: 14, maxLines: 1, overflow: TextOverflow.ellipsis),
                TextView.primary(tmdbInfo.releaseDate, fontSize: 14)
              ],
            ),
          );
        });
  }
}
