import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:free_tube_player/blindness/blindness_helper.dart';
import 'package:free_tube_player/firebase/server_config.dart';
import 'package:free_tube_player/utils/x_screen.dart';
import 'package:get/get.dart';

const appwriteEndpoint = 'http://43.134.112.233/v1';
const appwriteProjectId = '6487492f900e0d4b1160';

final isAndroid = GetPlatform.isAndroid;
final isIOS = GetPlatform.isIOS;
final isPad = Get.context?.isTablet ?? false;
const isDebug = kDebugMode;
const isProfile = kProfileMode;
const isRelease = kReleaseMode;

bool get isUserMode => BlindnessHelper.instance.isUserMode;

double get screenWidth => XScreen.getInstance().screenWidth;

double get screenHeight => XScreen.getInstance().screenHeight;

double get appBarHeight => XScreen.getInstance().appBarHeight;

double get bottomBarHeight => XScreen.getInstance().bottomBarHeight;

double get statusBarHeight => XScreen.getInstance().statusBarHeight;

String tubeFontFamily = 'MeTubeFont';

ServerConfig serverConfig = ServerConfig();

Future<void> vibrate() async {
  await HapticFeedback.vibrate();
}

// bool get isVip => UserManager.instance.isVip;
//
// bool get isNotVip => !UserManager.instance.isVip;
//
// bool get isLogin => UserManager.instance.isLogin;
//
// bool get isNotLogin => UserManager.instance.isNotLogin;

enum ViewStatus { none, loading, success, failed, empty }

///布局渲染完成调用
void onBuildWidgetFinish(Function? function) {
  WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
    function?.call();
  });
}

///布局渲染完成延时调用
void onBuildWidgetFinishDelay(Function? function, int milliseconds) {
  WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
    Future.delayed(Duration(milliseconds: milliseconds)).whenComplete(() {
      function?.call();
    });
  });
}
