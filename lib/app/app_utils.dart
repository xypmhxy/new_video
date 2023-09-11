/*
* 作者 Ren
* 时间  2023/7/24 07:40
*/

import 'dart:async';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:free_tube_player/utils/log_utils.dart';
import 'package:free_tube_player/utils/sp_utils.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppUtils {
  static String appName = 'MeTube';
  static String packageName = "com.nl.free.tube";
  static String version = "";
  static String buildNumber = "";
  static String countryCode = "us";
  static String localCountryCode = "us";
  static String language = "en";
  static String ip = "";
  static Completer<bool> queryNetworkCompleter = Completer();

  static Future<void> initAppInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appName = packageInfo.appName;
    packageName = packageInfo.packageName;
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;

    final systemLocale = PlatformDispatcher.instance.locale;
    countryCode = systemLocale.countryCode ?? 'us';
    countryCode = countryCode.toLowerCase();
    localCountryCode = countryCode;

    language = systemLocale.languageCode;
    language = language.contains('zh') ? 'en' : language;
  }

  static String get privacyUrl => 'https://sites.google.com/view/freetuber-privacy/';

  static String get userUrl => 'https://sites.google.com/view/freetuber-user/';

  static Future<void> onAppLaunch() async {
    final launchCount = SPUtils.getInt('app_launch_count', defaultValue: 0);
    await SPUtils.setInt('app_launch_count', launchCount + 1);
    LogUtils.i('应用启动次数 ${launchCount + 1}');

    if (SPUtils.getString('app_first_launch_version') == null) {
      SPUtils.setString('app_first_launch_version', version);
    }

    if (SPUtils.getInt('app_first_launch_date', defaultValue: 0) == 0) {
      SPUtils.setInt('app_first_launch_date', DateTime.now().millisecondsSinceEpoch);
    }
  }

  static int get appLaunchCount => SPUtils.getInt('app_launch_count', defaultValue: 0);

  static Future<void> queryNetworkInfo() async {
    if (queryNetworkCompleter.isCompleted) queryNetworkCompleter = Completer();
    final dio = Dio();
    bool hasException = false;
    try {
      var response = await dio.get('https://ipinfo.io/json');
      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;
        final cc = data['country'] as String?;
        final ipA = data['ip'] as String?;
        if (cc != null && cc.isNotEmpty) {
          countryCode = cc;
        }
        if (ipA != null && ipA.isNotEmpty) {
          ip = ipA;
        }
      }
    } catch (_) {
      hasException = true;
    }

    if (hasException) {
      var response = await dio.get('https://api.infoip.io/');
      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;
        final cc = data['country_short'] as String?;
        final ipA = data['ip'] as String?;
        if (cc != null && cc.isNotEmpty) {
          countryCode = cc;
        }
        if (ipA != null && ipA.isNotEmpty) {
          ip = ipA;
        }
      }
    }
    dio.close();
    queryNetworkCompleter.complete(true);
  }
}
