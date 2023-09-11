import 'package:free_tube_player/ad/ad_member.dart';
import 'package:free_tube_player/ad/base_ad_loader.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardAdLoader extends BaseADLoader {
  RewardedAd? _rewardedAd;

  @override
  Future<void> load(String adId, {ADLoadCallback? loadCallback}) async {
    RewardedAd.load(
        adUnitId: adId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            _rewardedAd = ad;
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
    _rewardedAd?.fullScreenContentCallback = FullScreenContentCallback(onAdShowedFullScreenContent: (ad) {
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
      // PostEventHelper.instance.logEvent(name: "ad_clicked", parameters: {"value": "reward"});
    });

    final adSourceName = _rewardedAd?.responseInfo?.loadedAdapterResponseInfo?.adSourceName;
    final networkName = adSourceName ?? 'admob';
    _rewardedAd?.onPaidEvent = (Ad ad, double valueMicros, PrecisionType precision, String currencyCode) {
      showCallback?.onPaidCallback?.call(valueMicros, precision, currencyCode, networkName);
    };
    _rewardedAd?.show(onUserEarnedReward: (_, __) {
      showCallback?.onReward?.call(true);
    });
  }

  //用于广告过期等情况
  @override
  void resetAD() {
    _rewardedAd?.dispose();
    _rewardedAd = null;
  }

  @override
  bool isAvailable() {
    return _rewardedAd != null && !isShowing;
  }
}
