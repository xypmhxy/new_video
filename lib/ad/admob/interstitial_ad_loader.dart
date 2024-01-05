import 'dart:async';
import 'package:free_tube_player/ad/ad_member.dart';
import 'package:free_tube_player/ad/base_ad_loader.dart';
import 'package:free_tube_player/ad/helper/ad_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class InterstitialADLoader extends BaseADLoader {
  InterstitialAd? _interstitialAd;

  @override
  Future<void> load(String adId, {ADLoadCallback? loadCallback}) async {
    await ADManager.instance.admobInitFuture.future;
    await InterstitialAd.load(
        adUnitId: adId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
          _interstitialAd = ad;
          loadCallback?.onLoadSuccess?.call();
        }, onAdFailedToLoad: (error) {
          loadCallback?.onLoadError?.call(ADError('${error.code}', error.message));
        }));
  }

  @override
  Future<void> show({ADShowCallback? showCallback}) async {
    if (!isAvailable()) {
      return;
    }
    _interstitialAd?.fullScreenContentCallback = FullScreenContentCallback(onAdShowedFullScreenContent: (ad) {
      isShowing = true;
      showCallback?.onShowSuccess?.call();
    }, onAdFailedToShowFullScreenContent: (ad, error) {
      isShowing = false;
      resetAD();
      showCallback?.onShowError?.call(ADError('${error.code}', error.message));
    }, onAdDismissedFullScreenContent: (ad) {
      isShowing = false;
      resetAD();
      showCallback?.onCloseAD?.call();
    }, onAdClicked: (ad) {
      // PostEventHelper.instance.logEvent(name: "ad_clicked", parameters: {"value": "interstitial"});
    });

    final adSourceName = _interstitialAd?.responseInfo?.loadedAdapterResponseInfo?.adSourceName;
    final networkName = adSourceName ?? 'admob' ;
    _interstitialAd?.onPaidEvent = (Ad ad, double valueMicros, PrecisionType precision, String currencyCode) {
      showCallback?.onPaidCallback?.call(valueMicros, precision, currencyCode, networkName);
    };
    _interstitialAd?.show();
  }

  //用于广告过期等情况
  @override
  void resetAD() {
    _interstitialAd?.dispose();
    _interstitialAd = null;
  }

  @override
  bool isAvailable() {
    return _interstitialAd != null && !isShowing;
  }
}
