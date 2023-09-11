
import 'package:free_tube_player/ad/ad_member.dart';

class AppLovinMAXHelper {
  static AppLovinMAXHelper instance = AppLovinMAXHelper._();

  AppLovinMAXHelper._();

  Map<String, ADLoadCallback> loadCallbackMap = {};
  Map<String, ADShowCallback> showCallbackMap = {};

  Map<String, ADLoadCallback> rewardLoadCallbackMap = {};
  Map<String, ADShowCallback> rewardShowCallbackMap = {};

  bool hasInterstitialListener = false;
  bool hasRewardListener = false;

  void initInterstitialListener() {
    if (hasInterstitialListener) {
      return;
    }
    hasInterstitialListener = true;
    // AppLovinMAX.setInterstitialListener(InterstitialListener(
    //     onAdLoadedCallback: (ad) {
    //       loadCallbackMap[ad.adUnitId]?.onLoadSuccess?.call();
    //     },
    //     onAdLoadFailedCallback: (adUnitId, maxError) {
    //       loadCallbackMap[adUnitId]?.onLoadError?.call(ADError('${maxError.code}', maxError.message));
    //     },
    //     onAdDisplayedCallback: (ad) {
    //       showCallbackMap[ad.adUnitId]?.onShowSuccess?.call();
    //       showCallbackMap[ad.adUnitId]?.onPaidCallback?.call(ad.revenue * 1000000, null, 'USD', ad.networkName);
    //     },
    //     onAdDisplayFailedCallback: (ad, error) {
    //       showCallbackMap[ad.adUnitId]?.onShowError?.call(ADError('${error.code}', error.message));
    //     },
    //     onAdClickedCallback: (ad) {},
    //     onAdHiddenCallback: (ad) {
    //       showCallbackMap[ad.adUnitId]?.onCloseAD?.call();
    //     }));
  }

  /*
   * 下面暂时没用
   */
  void initRewardListener() {
    if (hasRewardListener) {
      return;
    }
    hasRewardListener = true;
    // AppLovinMAX.setRewardedAdListener(RewardedAdListener(
    //     onAdLoadedCallback: (ad) {
    //       rewardLoadCallbackMap[ad.adUnitId]?.onLoadSuccess?.call();
    //     },
    //     onAdLoadFailedCallback: (adUnitId, maxError) {
    //       rewardLoadCallbackMap[adUnitId]?.onLoadError?.call(ADError('${maxError.code}', maxError.message));
    //     },
    //     onAdDisplayedCallback: (ad) {
    //       rewardShowCallbackMap[ad.adUnitId]?.onShowSuccess?.call();
    //       rewardShowCallbackMap[ad.adUnitId]?.onPaidCallback?.call(ad.revenue * 1000000, null, 'USD', ad.networkName);
    //     },
    //     onAdDisplayFailedCallback: (ad, error) {
    //       rewardShowCallbackMap[ad.adUnitId]?.onShowError?.call(ADError('${error.code}', error.message));
    //     },
    //     onAdClickedCallback: (ad) {},
    //     onAdHiddenCallback: (ad) {
    //       rewardShowCallbackMap[ad.adUnitId]?.onCloseAD?.call();
    //     },
    //     onAdReceivedRewardCallback: (_, __) {}));
  }

  void addADLoadCallback({required String adUnitId, ADLoadCallback? loadCallback}) {
    if (loadCallback == null) {
      return;
    }
    loadCallbackMap[adUnitId] = loadCallback;
  }

  void addShowCallback({required String adUnitId, ADShowCallback? showCallback}) {
    if (showCallback == null) {
      return;
    }
    showCallbackMap[adUnitId] = showCallback;
  }

  /*
   * 下面暂时没用
   */
  void addRewardADLoadCallback({required String adUnitId, ADLoadCallback? loadCallback}) {
    if (loadCallback == null) {
      return;
    }
    rewardLoadCallbackMap[adUnitId] = loadCallback;
  }

  void addRewardShowCallback({required String adUnitId, ADShowCallback? showCallback}) {
    if (showCallback == null) {
      return;
    }
    rewardShowCallbackMap[adUnitId] = showCallback;
  }

}
