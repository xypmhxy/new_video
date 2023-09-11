import 'package:free_tube_player/ad/ad_member.dart';
import 'package:free_tube_player/ad/base_ad_loader.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class InterstitialRewardADLoader extends BaseADLoader {
  RewardedInterstitialAd? _interstitialRewardAd;

  @override
  Future<void> load(String adId, {ADLoadCallback? loadCallback}) async {
    RewardedInterstitialAd.load(
        adUnitId: adId,
        request: const AdRequest(),
        rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            _interstitialRewardAd = ad;
            loadCallback?.onLoadSuccess?.call();
          },
          onAdFailedToLoad: (LoadAdError error) {
            loadCallback?.onLoadError?.call(ADError('${error.code}', error.message));
          },
        ));
  }

  @override
  Future<void> show({ADShowCallback? showCallback}) async {
    if (!isAvailable()) {
      return;
    }
    _interstitialRewardAd?.fullScreenContentCallback = FullScreenContentCallback(onAdShowedFullScreenContent: (ad) {
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
      // PostEventHelper.instance.logEvent(name: "ad_clicked", parameters: {"value": "InterstitialReward"});
    });

    final adSourceName = _interstitialRewardAd?.responseInfo?.loadedAdapterResponseInfo?.adSourceName;
    final networkName = adSourceName ?? 'admob';
    _interstitialRewardAd?.onPaidEvent = (Ad ad, double valueMicros, PrecisionType precision, String currencyCode) {
      showCallback?.onPaidCallback?.call(valueMicros, precision, currencyCode, networkName);
    };
    _interstitialRewardAd?.show(onUserEarnedReward: (_, __) {
      showCallback?.onReward?.call(true);
    });
  }

  //用于广告过期等情况
  @override
  void resetAD() {
    _interstitialRewardAd?.dispose();
    _interstitialRewardAd = null;
  }

  @override
  bool isAvailable() {
    return _interstitialRewardAd != null && !isShowing;
  }
}
