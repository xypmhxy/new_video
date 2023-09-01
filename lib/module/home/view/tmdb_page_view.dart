/*
* 作者 Ren
* 时间  2023/8/31 07:23
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/module/home/callback/tmdb_page_callback.dart';
import 'package:free_tube_player/module/home/controller/tmdb_page_controller.dart';
import 'package:free_tube_player/widget/base_page_view.dart';
import 'package:free_tube_player/widget/image_view.dart';
import 'package:free_tube_player/widget/loading_view.dart';
import 'package:get/get.dart';

class TMDBPageView extends BasePageView<TMDBPageCallback> {
  final _tmdbController = Get.find<TMDBPageController>();

  TMDBPageView({super.key, required super.pageCallback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          _tmdbController.requestTrending();
        },
        child: _content(),
      ),
    );
  }

  Widget _content() {
    return Obx(() => Visibility(
          visible: _tmdbController.tmdbInfos.isNotEmpty,
          replacement: _loadingWidget(),
          child: _listViewContent(),
        ));
  }

  Widget _loadingWidget() {
    return const Center(
      child: LoadingView(),
    );
  }

  Widget _listViewContent() {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
        itemCount: _tmdbController.tmdbInfos.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: .62),
        itemBuilder: (_, index) {
          final tmdbInfo = _tmdbController.tmdbInfos[index];
          return GestureDetector(
            child: ClipRRect(
              borderRadius: getBorderRadius(10),
              child: Stack(
                children: [
                  Positioned.fill(
                      child: ImageView.network(
                    imageUrl: tmdbInfo.posterPath,
                    placeholderBuilder: (_, __) {
                      return Container(
                        color: Colors.grey[200],
                      );
                    },
                  ))
                ],
              ),
            ),
          );
        });
  }
}
