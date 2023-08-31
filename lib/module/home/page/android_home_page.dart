/*
* 作者 Ren
* 时间  2023/8/31 08:05
*/

import 'package:flutter/material.dart';
import 'package:free_tube_player/module/home/view/android_home_page_view.dart';

class AndroidHomePage extends StatefulWidget {
  const AndroidHomePage({super.key});

  @override
  State<AndroidHomePage> createState() => _AndroidHomePageState();
}

class _AndroidHomePageState extends State<AndroidHomePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const AndroidHomePageView();
  }
}
