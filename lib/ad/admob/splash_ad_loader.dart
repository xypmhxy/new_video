import 'dart:async';
import 'package:free_tube_player/ad/ad_member.dart';
import 'package:free_tube_player/ad/base_ad_loader.dart';
import 'package:free_tube_player/ad/helper/ad_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class OpenADLoader extends BaseADLoader {
  AppOpenAd? _appOpenAd;

  @override
  Future<void> load(String adId, {ADLoadCallback? loadCallback}) async {
    await ADManager.instance.admobInitFuture.future;
    await AppOpenAd.load(
      adUnitId: adId,
      orientation: AppOpenAd.orientationPortrait,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          loadCallback?.onLoadSuccess?.call();
          _appOpenAd = ad;
        },
        onAdFailedToLoad: (error) {
          loadCallback?.onLoadError?.call(ADError('${error.code}', error.message));
        },
      ),
    );
  }

  @override
  Future<void> show({ADShowCallback? showCallback}) async {
    if (!isAvailable()) {
      return;
    }
    _appOpenAd?.fullScreenContentCallback = FullScreenContentCallback(onAdShowedFullScreenContent: (ad) {
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
    },onAdClicked: (ad){
      // PostEventHelper.instance.logEvent(name: "ad_clicked", parameters: {"value": "open"});
    });
    final adSourceName = _appOpenAd?.responseInfo?.loadedAdapterResponseInfo?.adSourceName;
    final networkName = adSourceName ?? 'admob';
    _appOpenAd?.onPaidEvent = (Ad ad, double valueMicros, PrecisionType precision, String currencyCode) {
      showCallback?.onPaidCallback?.call(valueMicros, precision, currencyCode, networkName);
    };
    _appOpenAd?.show();
  }

  @override
  void resetAD() {
    _appOpenAd?.dispose();
    _appOpenAd = null;
  }

  @override
  bool isAvailable() {
    return _appOpenAd != null && !isShowing;
  }
}
