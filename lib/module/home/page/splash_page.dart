/*
* 作者 Ren
* 时间  2023/8/5 09:59
*/

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:free_tube_player/ad/helper/ad_manager.dart';
import 'package:free_tube_player/app/app_utils.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/blindness/blindness_helper.dart';
import 'package:free_tube_player/db/database_manager.dart';
import 'package:free_tube_player/generated/assets.dart';
import 'package:free_tube_player/helper/network_change_helper.dart';
import 'package:free_tube_player/module/home/page/home_page.dart';
import 'package:free_tube_player/utils/page_navigation.dart';
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
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 8), value: 0);
    _animationController.forward();
    initImportant();
    super.initState();
  }

  @override
  void dispose() {
    _networkChangeSubs?.cancel();
    _animationController.stop();
    _animationController.dispose();
    super.dispose();
  }

  Future<void> initImportant() async {
    await AppUtils.initAppInfo();
    await AppUtils.onAppLaunch();
    initOther();
  }

  Future<void> initOther() async {
    DatabaseManager.get.setup().whenComplete(() {});
    AppUtils.queryNetworkInfo();
    BlindnessHelper.instance.requestClock();
    _networkChangeSubs = NetworkChangeHelper.get.watchNetworkChange.listen((event) {
      BlindnessHelper.instance.requestClock();
    });
    NetworkChangeHelper.get.initListener();
    ADManager.instance.updateConfig();
    ADManager.instance.startWatchConfig();
    ADManager.instance.initADMob();
    startLoadAD();
    serverConfig.fetchConfig();
  }

  Future<void> startLoadAD() async {
    final openADFuture = ADManager.instance.loadOpenAD();
    ADManager.instance.loadPlayAD();
    ADManager.instance.loadSettingRewardAD();
    await Future.any([openADFuture, Future.delayed(const Duration(seconds: 8))]);
    await _animationController.animateTo(1.0, duration: const Duration(milliseconds: 500));
    await ADManager.instance.tryShowOpenAD();
    PageNavigation.startNewPageAndCloseAll(const HomePage());
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
