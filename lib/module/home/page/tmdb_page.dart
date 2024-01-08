/*
* 作者 Ren
* 时间  2023/8/31 07:21
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/ad/ad_utils.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/bean/tmdb/tmdb_info.dart';
import 'package:free_tube_player/firebase/firebase_event.dart';
import 'package:free_tube_player/module/home/callback/tmdb_page_callback.dart';
import 'package:free_tube_player/module/home/controller/tmdb_page_controller.dart';
import 'package:free_tube_player/module/home/page/tmdb_detail_page.dart';
import 'package:free_tube_player/module/home/view/tmdb_page_view.dart';
import 'package:free_tube_player/utils/page_navigation.dart';
import 'package:get/get.dart';

class TMDBPage extends StatefulWidget {
  const TMDBPage({super.key});

  @override
  State<TMDBPage> createState() => _TMDBPageState();
}

class _TMDBPageState extends State<TMDBPage> with AutomaticKeepAliveClientMixin implements TMDBPageCallback {
  final _tmdbController = Get.put(TMDBPageController());

  @override
  void initState() {
    FirebaseEvent.instance.logEvent('tmdb_page_expose');
    onBuildWidgetFinish(() {
      _tmdbController.refreshController.requestRefresh();
    });
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return TMDBPageView(pageCallback: this);
  }

  @override
  void refreshTrending() {
    _tmdbController.requestTrending();
  }

  @override
  void loadMoreTrending() {
    _tmdbController.requestTrending(isRefresh: false);
  }

  @override
  void onClickItem(TMDBInfo tmdbInfo) {
    ADUtils.instance.showPlaylistAD();
    PageNavigation.startNewPage(TMDBDetailPage(
      tmdbInfo: tmdbInfo,
    ));
  }
}
