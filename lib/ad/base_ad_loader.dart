import 'dart:async';

import 'package:free_tube_player/ad/ad_member.dart';


class BaseADLoader {
  bool isShowing = false;

  Future<void> load(String adId, {ADLoadCallback? loadCallback}) async {
    loadCallback?.onLoadError?.call(ADError('', ''));
  }

  Future<void> show({ADShowCallback? showCallback}) async {}

  //用于广告过期等情况
  void resetAD() {}

  bool isAvailable() {
    return false;
  }
}
