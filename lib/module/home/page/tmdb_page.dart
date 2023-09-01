/*
* 作者 Ren
* 时间  2023/8/31 07:21
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/module/home/callback/tmdb_page_callback.dart';
import 'package:free_tube_player/module/home/controller/tmdb_page_controller.dart';
import 'package:free_tube_player/module/home/view/tmdb_page_view.dart';
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
    _tmdbController.requestTrending();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return TMDBPageView(pageCallback: this);
  }
}
