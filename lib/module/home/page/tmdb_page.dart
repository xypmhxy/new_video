/*
* 作者 Ren
* 时间  2023/8/31 07:21
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/module/home/callback/tmdb_page_callback.dart';
import 'package:free_tube_player/module/home/view/tmdb_page_view.dart';

class TMDBPage extends StatefulWidget {
  const TMDBPage({super.key});

  @override
  State<TMDBPage> createState() => _TMDBPageState();
}

class _TMDBPageState extends State<TMDBPage> implements TMDBPageCallback {
  @override
  Widget build(BuildContext context) {
    return TMDBPageView(pageCallback: this);
  }
}
