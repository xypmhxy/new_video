/*
* 作者 Ren
* 时间  2023/8/5 09:59
*/

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_utils.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/db/database_manager.dart';
import 'package:free_tube_player/generated/assets.dart';
import 'package:free_tube_player/helper/clock_helper.dart';
import 'package:free_tube_player/helper/network_change_helper.dart';
import 'package:free_tube_player/module/home/page/home_page.dart';
import 'package:free_tube_player/utils/page_navigation.dart';
import 'package:free_tube_player/utils/permission_utils.dart';
import 'package:free_tube_player/utils/x_screen.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_view.dart';
import 'package:free_tube_player/widget/text_view.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  StreamSubscription? _networkChangeSubs;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: isDebug ? 3 : 6), value: 0);
    _animationController.forward();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        PageNavigation.startNewPageAndCloseAll(const HomePage());
      }
    });
    initImportant();
    super.initState();
  }

  Future<void> initImportant() async {
    await AppUtils.initAppInfo();
    initOther();
  }

  Future<void> initOther() async {
    DatabaseManager.get.setup().whenComplete(() {});
    ClockHelper.instance.requestClock();
    _networkChangeSubs = NetworkChangeHelper.get.watchNetworkChange.listen((event) {
      ClockHelper.instance.requestClock();
    });
    Future.delayed(const Duration(seconds: 3)).then((value) => PermissionUtils.requestIDFA());
  }

  @override
  void dispose() {
    _networkChangeSubs?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = XScreen.getScreenW(context);
    final screenHeight = XScreen.getScreenH(context);
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ImageView.asset(
                  Assets.imagesSplashAppIcon,
                  width: 56,
                  height: 56,
                ),
                const Width(16),
                TextView.primary(AppUtils.appName, fontSize: 40, fontWeight: FontWeight.w500)
              ],
            ),
          ),
          Positioned(
              bottom: screenHeight * .15,
              left: screenWidth / 4.5,
              right: screenWidth / 4.5,
              child: SizedBox(
                child: ClipRRect(
                  borderRadius: getBorderRadius(2),
                  child: AnimatedBuilder(
                      animation: _animationController,
                      builder: (_, __) {
                        return LinearProgressIndicator(
                          minHeight: 4,
                          backgroundColor: Colors.black12,
                          value: _animationController.value,
                        );
                      }),
                ),
              ))
        ],
      ),
    );
  }
}
