/*
* 作者 Ren
* 时间  2023/7/24 07:40
*/

import 'package:package_info_plus/package_info_plus.dart';

class AppUtils {
  static String appName = 'MeTube';
  static String packageName = "com.nl.free.tube";
  static String version = "";
  static String buildNumber = "";

  static Future<void> initAppInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appName = packageInfo.appName;
    packageName = packageInfo.packageName;
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
  }

  static String get privacyUrl => 'https://sites.google.com/view/freetuber-privacy/';

  static String get userUrl => 'https://sites.google.com/view/freetuber-user/';
}
