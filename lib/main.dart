import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/app_utils.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/helper/firebase_helper.dart';
import 'package:free_tube_player/module/home/page/splash_page.dart';
import 'package:free_tube_player/utils/sp_utils.dart';
import 'package:free_tube_player/utils/x_screen.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  XScreen.portrait();
  await SPUtils.init();
  XScreen.statusBarContentColor(isWhite: AppThemeController.getThemeMode() == ThemeMode.light);
  try {
    await FirebaseHelper.get.initFirebase();
  } catch (_) {}
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appThemeController = AppThemeController.get;
    return GetMaterialApp(
      title: AppUtils.appName,
      scrollBehavior: const CupertinoScrollBehavior(),
      debugShowCheckedModeBanner: false,
      theme: appThemeController.getThemeData(),
      themeMode: AppThemeController.getThemeMode(),
      darkTheme: appThemeController.getThemeData(brightness: Brightness.dark),
      locale: PlatformDispatcher.instance.locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      fallbackLocale: const Locale("en", "us"),
      localeResolutionCallback: (locale, list) {
        return locale;
      },
      builder:FlutterSmartDialog.init(),
      home: const SplashPage(),
    );
  }
}
