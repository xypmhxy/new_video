import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

enum ADPosition { none, open, play, other, highest }

enum ADSource { none, admob, facebook, max, unity, pangle }

enum ADType { none, splash, interstitial, native, banner, reward, interstitialReward }

//广告展示间隔类型 none 不间隔 self 自身广告场景 other 和其他广告场景 all 自身以及其他广告场景
enum ADIntervalType { none, self, other, all }

enum ADSituationType { none, open, play, search, playList, download }

class ADError {
  String code;
  String msg;

  ADError(this.code, this.msg);
}

class ADLoadCallback {
  VoidCallback? onLoadSuccess;
  Function(ADError adError)? onLoadError;

  ADLoadCallback({this.onLoadSuccess, this.onLoadError});
}

class ADShowCallback {
  VoidCallback? onShowSuccess;
  Function(ADError adError)? onShowError;
  VoidCallback? onCloseAD;
  Function(double valueMicros, PrecisionType? precision, String currencyCode, String networkName)? onPaidCallback;
  ValueChanged<bool>? onReward;

  ADShowCallback({this.onShowSuccess, this.onShowError, this.onCloseAD, this.onReward,this.onPaidCallback});
}
