/*
* 作者 Ren
* 时间  2023/7/24 07:21
*/
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/utils/sp_utils.dart';
import 'package:free_tube_player/utils/x_screen.dart';
import 'package:get/get.dart';

import 'resource/color_res.dart';

class AppThemeController extends GetxController {
  static final AppThemeController get = AppThemeController._();

  AppThemeController._();

  final changeTheme = 0.obs;

  ThemeData getThemeData({Brightness brightness = Brightness.light}) {
    final isLight = brightness == Brightness.light;
    const primaryColor = ColorRes.themeColor;
    final backgroundColor = isLight ? Colors.white : ColorRes.backgroundColor;
    final bottomSheetBackground = isLight ? Colors.white : ColorRes.bottomSheetBackground;
    final textColor = isLight ? ColorRes.backgroundColor : ColorRes.textPrimaryColor;
    const accentTextColor = ColorRes.accentTextColor;
    final surfaceColor = isLight ? ColorRes.colorF5F5F5 : Colors.black12;
    final onPrimaryColor = isLight ? ColorRes.colorF5F5F5 : const Color(0XFF0f0f0f);
    final disabledColor = isLight ? ColorRes.negativeColor : ColorRes.negativeDarkColor;
    final iconThemeData = IconThemeData(color: textColor, size: 24);
    final fontFamily = tubeFontFamily;
    final fontFamilyFallback = [fontFamily];
    return ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        primaryColor: primaryColor,
        brightness: brightness,
        disabledColor: disabledColor,
        splashColor: primaryColor.withOpacity(.1),
        bottomSheetTheme: BottomSheetThemeData(backgroundColor: bottomSheetBackground),
        dividerColor: isLight ? Colors.black45 : Colors.white30,
        colorScheme: ColorScheme(
            brightness: brightness,
            primary: primaryColor,
            onPrimary: onPrimaryColor,
            secondary: textColor,
            onSecondary: Colors.black,
            error: primaryColor,
            onError: textColor,
            background: backgroundColor,
            onBackground: textColor,
            surface: backgroundColor,
            onSurface: surfaceColor),
        textTheme: TextTheme(
            titleLarge: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: textColor,
              fontFamily: tubeFontFamily,
              fontFamilyFallback: fontFamilyFallback,
            ),
            titleMedium: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: accentTextColor,
                fontFamily: tubeFontFamily,
                fontFamilyFallback: fontFamilyFallback)),
        iconTheme: iconThemeData,
        tabBarTheme: TabBarTheme(
          labelColor: primaryColor,
          unselectedLabelColor: textColor,
        ),
        appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: isLight ? Brightness.dark : Brightness.light),
            elevation: 0,
            toolbarHeight: 56,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            iconTheme: iconThemeData,
            actionsIconTheme: iconThemeData,
            titleTextStyle:
                TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontFamily: tubeFontFamily, color: textColor)),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          backgroundColor: backgroundColor,
          selectedItemColor: ColorRes.themeColor,
          unselectedItemColor: ColorRes.color959595,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500, fontFamily: tubeFontFamily, fontSize: 12),
          unselectedLabelStyle: TextStyle(fontFamily: tubeFontFamily, fontSize: 12),
        ));
  }

  void toggleTheme() {
    final isDarkMode = Get.isDarkMode;
    if (isDarkMode) {
      Get.changeThemeMode(ThemeMode.light);
      SPUtils.setInt('theme_mode', ThemeMode.light.index);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      SPUtils.setInt('theme_mode', ThemeMode.dark.index);
    }
    XScreen.statusBarContentColor(isWhite: getThemeMode() == ThemeMode.light);
  }

  static ThemeMode getThemeMode() {
    return ThemeMode.values[SPUtils.getInt('theme_mode', defaultValue: 2)];
  }

  static ThemeData themeData(BuildContext context) => Theme.of(context);

  static bool isLight(BuildContext context) => themeData(context).brightness == Brightness.light;

  static bool isDark(BuildContext context) => themeData(context).brightness == Brightness.dark;

  static Color primaryThemeColor(BuildContext context) => themeData(context).colorScheme.primary;

  static Color accentThemeColor(BuildContext context) => themeData(context).colorScheme.secondary;

  static Color backgroundColor(BuildContext context) => themeData(context).colorScheme.background;

  static Color bottomSheetColor(BuildContext context) =>
      themeData(context).bottomSheetTheme.backgroundColor ?? ColorRes.bottomSheetBackground;

  static Color disableColor(BuildContext context) => themeData(context).disabledColor;

  static Color dividerColor(BuildContext context) => themeData(context).dividerColor;

  static Color textPrimaryColor(BuildContext context) =>
      themeData(context).textTheme.titleLarge?.color ?? ColorRes.textPrimaryColor;

  static Color textAccentColor(BuildContext context) =>
      themeData(context).textTheme.titleMedium?.color ?? ColorRes.textPrimaryColor;

  static ButtonStyle? buttonBackgroundColor(BuildContext context) => themeData(context).textButtonTheme.style;

  static Color counterBackgroundColor(BuildContext context) =>
      isLight(context) ? textPrimaryColor(context) : backgroundColor(context);

  static Color counterTextPrimaryColor(BuildContext context) =>
      isLight(context) ? backgroundColor(context) : textPrimaryColor(context);

  static Color onPrimaryColor(BuildContext context) => themeData(context).colorScheme.onPrimary;

  static Color splashColor(BuildContext context) => themeData(context).splashColor;
}
