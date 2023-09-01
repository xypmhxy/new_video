/*
* 作者 Ren
* 时间  2023/8/31 21:10
*/

import 'dart:async';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:free_tube_player/base/base_controller.dart';

class AndroidHomePageController extends BaseController {
  final _permissionStreamController = StreamController<bool>();
  late final Stream<bool> stream = _permissionStreamController.stream.asBroadcastStream();
  bool isBackSetting = false;

  Future<void> toAuthorize() async {
    WidgetsBinding.instance.addObserver(_appLifecycleListener);
    await AppSettings.openAppSettings();
    isBackSetting = true;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_appLifecycleListener);
    super.dispose();
  }

  late final _appLifecycleListener = AppLifecycleListener(onResume: () {
    if (isBackSetting) {
      isBackSetting = false;
      _permissionStreamController.add(true);
    }
  });
}
