import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/resource/color_res.dart';
import 'package:free_tube_player/utils/log_utils.dart';

/**
 * @Author: Sky24n
 * @GitHub: https://github.com/Sky24n
 * @Email: sky24no@gmail.com
 * @Description: Screen Util.
 * @Date: 2018/9/8
 */

///默认设计稿尺寸（单位 dp or pt）
double _designW = 360.0;
double _designH = 640.0;
double _designD = 3.0;

/**
 * 配置设计稿尺寸（单位 dp or pt）
 * w 宽
 * h 高
 * density 像素密度
 */

/// 配置设计稿尺寸 屏幕 宽，高，密度。
/// Configuration design draft size  screen width, height, density.
void setDesignWHD(double? w, double? h, {double density = 3.0}) {
  _designW = w ?? _designW;
  _designH = h ?? _designH;
  _designD = density;
}

class XScreen {
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;
  double _screenDensity = 0.0;
  double _statusBarHeight = 0.0;
  double _bottomBarHeight = 0.0;
  double _appBarHeight = 0.0;

  MediaQueryData _mediaQueryData = const MediaQueryData();

  static final XScreen _singleton = XScreen();

  static XScreen getInstance() {
    _singleton._init();
    return _singleton;
  }

  _init() {
    MediaQueryData mediaQuery = MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.single);
    if (_mediaQueryData != mediaQuery && _screenWidth == 0.0) {
      _mediaQueryData = mediaQuery;
      _screenWidth = mediaQuery.size.width;
      _screenHeight = mediaQuery.size.height;
      _screenDensity = mediaQuery.devicePixelRatio;
      _statusBarHeight = mediaQuery.padding.top;
      _bottomBarHeight = mediaQuery.padding.bottom;
      _appBarHeight = 56;
    }
  }

  /// screen width
  /// 屏幕 宽
  double get screenWidth => _screenWidth;

  /// screen height
  /// 屏幕 高
  double get screenHeight => _screenHeight;

  /// appBar height
  /// appBar 高
  double get appBarHeight => _appBarHeight;

  /// screen density
  /// 屏幕 像素密度
  double get screenDensity => _screenDensity;

  /// status bar Height
  /// 状态栏高度
  double get statusBarHeight => _statusBarHeight;

  /// bottom bar Height
  double get bottomBarHeight => _bottomBarHeight;

  /// media Query Data
  MediaQueryData get mediaQueryData => _mediaQueryData;

  /// screen width
  /// 当前屏幕 宽
  static double getScreenW(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.width;
  }

  /// screen height
  /// 当前屏幕 高
  static double getScreenH(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.height;
  }

  /// screen density
  /// 当前屏幕 像素密度
  static double getScreenDensity(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.devicePixelRatio;
  }

  /// status bar Height
  /// 当前状态栏高度
  static double getStatusBarH(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.padding.top;
  }

  /// status bar Height
  /// 当前BottomBar高度
  static double getBottomBarH(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.padding.bottom;
  }

  /// status bar Height
  /// 当前BottomBar高度
  static double getBottomSafe(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.viewPadding.bottom;
  }

  /// 当前MediaQueryData
  static MediaQueryData getMediaQueryData(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery;
  }

  /// 仅支持纵屏。
  /// returns the size after adaptation according to the screen width.(unit dp or pt)
  /// 返回根据屏幕宽适配后尺寸（单位 dp or pt）
  /// size 单位 dp or pt
  static double getScaleW(BuildContext context, double size) {
    if (getScreenW(context) == 0.0) return size;
    return size * getScreenW(context) / _designW;
  }

  /// 仅支持纵屏。
  /// returns the size after adaptation according to the screen height.(unit dp or pt)
  /// 返回根据屏幕高适配后尺寸 （单位 dp or pt）
  /// size unit dp or pt
  static double getScaleH(BuildContext context, double size) {
    if (getScreenH(context) == 0.0) return size;
    return size * getScreenH(context) / _designH;
  }

  /// 仅支持纵屏。
  /// returns the font size after adaptation according to the screen density.
  /// 返回根据屏幕宽适配后字体尺寸
  /// fontSize 字体尺寸
  static double getScaleSp(BuildContext context, double fontSize) {
    if (getScreenW(context) == 0.0) return fontSize;
    return fontSize * getScreenW(context) / _designW;
  }

  /// Orientation
  /// 设备方向(portrait, landscape)
  static Orientation getOrientation(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.orientation;
  }

  /// 仅支持纵屏。
  /// returns the size after adaptation according to the screen width.(unit dp or pt)
  /// 返回根据屏幕宽适配后尺寸（单位 dp or pt）
  /// size 单位 dp or pt
  double getWidth(double size) {
    return _screenWidth == 0.0 ? size : (size * _screenWidth / _designW);
  }

  /// 仅支持纵屏。
  /// returns the size after adaptation according to the screen height.(unit dp or pt)
  /// 返回根据屏幕高适配后尺寸（单位 dp or pt）
  /// size unit dp or pt
  double getHeight(double size) {
    return _screenHeight == 0.0 ? size : (size * _screenHeight / _designH);
  }

  /// 仅支持纵屏
  /// returns the size after adaptation according to the screen width.(unit dp or pt)
  /// 返回根据屏幕宽适配后尺寸（单位 dp or pt）
  /// sizePx unit px
  double getWidthPx(double sizePx) {
    return _screenWidth == 0.0 ? (sizePx / _designD) : (sizePx * _screenWidth / (_designW * _designD));
  }

  /// 仅支持纵屏。
  /// returns the size after adaptation according to the screen height.(unit dp or pt)
  /// 返回根据屏幕高适配后尺寸（单位 dp or pt）
  /// sizePx unit px
  double getHeightPx(double sizePx) {
    return _screenHeight == 0.0 ? (sizePx / _designD) : (sizePx * _screenHeight / (_designH * _designD));
  }

  /// 仅支持纵屏。
  /// returns the font size after adaptation according to the screen density.
  /// 返回根据屏幕宽适配后字体尺寸
  /// fontSize 字体尺寸
  double getSp(double fontSize) {
    if (_screenDensity == 0.0) return fontSize;
    return fontSize * _screenWidth / _designW;
  }

  /// 兼容横/纵屏。
  /// 获取适配后的尺寸，兼容横/纵屏切换，可用于宽，高，字体尺寸适配。
  /// Get the appropriate size, compatible with horizontal/vertical screen switching, can be used for wide, high, font size adaptation.
  double getAdapterSize(double dp) {
    if (_screenWidth == 0 || _screenHeight == 0) return dp;
    return getRatio() * dp;
  }

  /// 适配比率。
  /// Ratio.
  double getRatio() {
    return (_screenWidth > _screenHeight ? _screenHeight : _screenWidth) / _designW;
  }

  /// 兼容横/纵屏。
  /// 获取适配后的尺寸，兼容横/纵屏切换，适应宽，高，字体尺寸。
  /// Get the appropriate size, compatible with horizontal/vertical screen switching, can be used for wide, high, font size adaptation.
  static double getAdapterSizeCtx(BuildContext context, double dp) {
    Size size = MediaQuery.of(context).size;
    if (size == Size.zero) return dp;
    return getRatioCtx(context) * dp;
  }

  /// 适配比率。
  /// Ratio.
  static double getRatioCtx(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return (size.width > size.height ? size.height : size.width) / _designW;
  }

  bool isPad() {
    var shortSide = _screenWidth < _screenHeight ? _screenWidth : _screenHeight;
    return shortSide >= 600;
  }

  static void statusBarContentColor({bool isWhite = false}) {
    final brightness = isWhite ? Brightness.dark : Brightness.light;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: brightness,
        statusBarIconBrightness: brightness,
        systemNavigationBarColor: isWhite ? Colors.white : ColorRes.backgroundColor  ,
        systemNavigationBarIconBrightness: brightness));
  }

  static void portrait() {
    SystemChrome.setPreferredOrientations([
      // 强制竖屏
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
  }

  static void landscape() {
    SystemChrome.setPreferredOrientations([
      // 强制横屏
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
  }
}
