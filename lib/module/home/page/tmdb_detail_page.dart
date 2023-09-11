/*
* 作者 Ren
* 时间  2023/9/2 10:44
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:free_tube_player/bean/tmdb/tmdb_info.dart';
import 'package:free_tube_player/module/home/callback/tmdb_detail_page_callback.dart';
import 'package:free_tube_player/module/home/controller/tmdb_detail_page_controller.dart';
import 'package:free_tube_player/module/home/view/tbdm_detail_page_view.dart';
import 'package:free_tube_player/utils/page_navigation.dart';

class TMDBDetailPage extends StatefulWidget {
  final TMDBInfo tmdbInfo;

  const TMDBDetailPage({super.key, required this.tmdbInfo});

  @override
  State<TMDBDetailPage> createState() => _TMDBDetailPageState();
}

class _TMDBDetailPageState extends State<TMDBDetailPage> implements TMDBDetailPageCallback {
  final _tmdbController = TMDBDetailPageController();

  @override
  void initState() {
    _tmdbController.requestDetails(widget.tmdbInfo);
    super.initState();
  }

  @override
  void dispose() {
    _tmdbController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TMDBDetailPageView(pageCallback: this, tmdbController: _tmdbController);
  }

  @override
  void onClickBack() {
    PageNavigation.back();
  }

  @override
  void onClickItem(TMDBInfo tmdbInfo) {
    PageNavigation.startSamePage(TMDBDetailPage(tmdbInfo: tmdbInfo));
  }
}
