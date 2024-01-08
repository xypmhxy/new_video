import 'dart:async';

import 'package:flutter/material.dart';
import 'package:free_tube_player/ad/helper/ad_manager.dart';

class ADUtils {
  static ADUtils instance = ADUtils._();

  ADUtils._();

  Completer<bool>? waitPlayADShow;

  Future<void> loadOpenAd({bool needLoadHighest = true}) async {
    await ADManager.instance.loadOpenAD(needLoadHighest: needLoadHighest);
  }

  Future<void> showOpenAD() async {
    await ADManager.instance.tryShowOpenAD();
  }

  Future<void> loadPlayAD({bool needLoadHighest = true}) async {
    await ADManager.instance.loadPlayAD(
      needLoadHighest: needLoadHighest,
    );
  }

  Future<void> showPlayAD() async {
    waitPlayADShow = Completer();
    final result = await ADManager.instance.tryShowPlayAD();
    waitPlayADShow?.complete(result);
  }

  Future<void> loadOtherAd({bool needLoadHighest = true}) async {
    await ADManager.instance.loadOtherAD(
      needLoadHighest: needLoadHighest,
    );
  }

  Future<void> showDownloadAD() async {
    await ADManager.instance.tryShowDownloadAD();
  }

  Future<void> showPlaylistAD() async {
    await ADManager.instance.tryShowPlayListAD();
  }

  Future<void> loadCutAD({bool needLoadHighest = true}) async {
    await ADManager.instance.loadSettingRewardAD();
  }

  Future<void> showCutAD({ValueChanged<bool>? onReward}) async {
    await ADManager.instance.tryShowCutReward(onReward: onReward);
  }
}
