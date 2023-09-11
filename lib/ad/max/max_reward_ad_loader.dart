
import 'package:free_tube_player/ad/ad_member.dart';
import 'package:free_tube_player/ad/base_ad_loader.dart';
import 'package:free_tube_player/ad/helper/ad_manager.dart';

class MAXRewardADLoader extends BaseADLoader {
  String? adId;
  bool isAllowShow = false;

  @override
  Future<void> load(String adId, {ADLoadCallback? loadCallback}) async {
    this.adId = adId;
    await ADManager.instance.maxInitCompleter.future;
    // AppLovinMAXHelper.instance.addADLoadCallback(
    //     adUnitId: adId,
    //     loadCallback: ADLoadCallback(onLoadSuccess: () {
    //       isAllowShow = true;
    //       loadCallback?.onLoadSuccess?.call();
    //     }, onLoadError: (error) {
    //       resetAD();
    //       loadCallback?.onLoadError?.call(error);
    //     }));
    // AppLovinMAX.loadRewardedAd(adId);
  }

  @override
  Future<void> show({ADShowCallback? showCallback}) async {
    if (adId == null) {
      showCallback?.onShowError?.call(ADError('-1', 'MAX ADID IS NULL'));
      return;
    }
    // AppLovinMAXHelper.instance.addShowCallback(
    //     adUnitId: adId!,
    //     showCallback: ADShowCallback(
    //         onShowSuccess: () {
    //           isShowing = true;
    //           isAllowShow = false;
    //           showCallback?.onShowSuccess?.call();
    //         },
    //         onShowError: (error) {
    //           resetAD();
    //           isShowing = false;
    //           showCallback?.onShowError?.call(error);
    //         },
    //         onCloseAD: () {
    //           resetAD();
    //           isShowing = false;
    //           showCallback?.onCloseAD?.call();
    //         },
    //         onPaidCallback: showCallback?.onPaidCallback));
    if (isAvailable()) {
      // AppLovinMAX.showRewardedAd(adId!);
    }
  }

  @override
  void resetAD() {
    isAllowShow = false;
  }

  @override
  bool isAvailable() {
    // LogUtils.i('MAXisAvailable  $adId  $isAllowShow  $isShowing');
    return adId != null && isAllowShow == true && isShowing == false;
  }
}
