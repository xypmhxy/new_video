import 'dart:async';

import 'package:free_tube_player/ad/ad_member.dart';
import 'package:free_tube_player/ad/admob/interstitial_ad_loader.dart';
import 'package:free_tube_player/ad/admob/interstitial_reward_ad_loader.dart';
import 'package:free_tube_player/ad/admob/reward_ad_loader.dart';
import 'package:free_tube_player/ad/admob/splash_ad_loader.dart';
import 'package:free_tube_player/ad/base_ad_loader.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/helper/network_change_helper.dart';
import 'package:free_tube_player/utils/date_utils.dart';
import 'package:free_tube_player/utils/log_utils.dart';

class ADWrapper {
  ADPosition adPosition = ADPosition.none;
  ADSource adSource = ADSource.none;
  int adWeight = 1;
  ADType adType = ADType.none;
  int openTimes = 0;
  String adId = '';
  BaseADLoader adLoader = BaseADLoader();

  int loadTime = 0;
  int showTime = 0;
  int closeTime = 0;
  int retryCount = 0;

  ADWrapper({required this.adPosition, required this.adType, required this.adId, required this.adLoader});

  ADWrapper.fromMap(Map map) {
    final adPositionStr = map['adPosition'] ?? '';
    adPosition = convertADPosition(adPositionStr);

    final adSourceStr = map['adsource'] ?? '';
    adSource = convertADSource(adSourceStr);

    adWeight = map['adweight'] ?? 1;

    final adTypeStr = map['adtype'] ?? '';
    adType = convertADType(adTypeStr);

    adId = map['placementid'] ?? '';

    openTimes = map['openTimes'] ?? 0;

    adLoader = getADLoader();
  }

  Future<bool> loadAD({ADLoadCallback? callBack, int allowRetryCount = 0}) async {
    Completer<bool> loadCompleter = Completer();
    if (isDebug) {
      await Future.delayed(const Duration(seconds: 2));
      loadCompleter.complete(false);
      return false;
    }
    await adLoader.load(adId,
        loadCallback: ADLoadCallback(onLoadSuccess: () {
          // LogUtils.i('广告加载成功 $adPosition $adId ${getTime()}');
          retryCount = 0;
          loadTime = DateUtil.getNowDateMs();
          callBack?.onLoadSuccess?.call();
          loadCompleter.complete(true);
        }, onLoadError: (error) async {
          if (retryCount < allowRetryCount) {
            addRetryCount();
            LogUtils.e(
                '广告加载失败准备重试 重试次数：$retryCount 允许重试次数：$allowRetryCount $adPosition $adId errorCode: ${error.code} ${error.msg}',tag: 'ADHelper',useLogcat: true);
            final retryResult = await loadAD(callBack: callBack, allowRetryCount: allowRetryCount);
            retryCount = 0;
            loadCompleter.complete(retryResult);
            return;
          }
          LogUtils.e('广告加载失败 $adPosition $adId errorCode: ${error.code} ${error.msg}',tag: 'ADHelper',useLogcat: true);
          callBack?.onLoadError?.call(error);
          loadCompleter.complete(false);
        }));
    return loadCompleter.future;
  }

  Future<void> showAD({ADShowCallback? callBack}) async {
    adLoader.show(
        showCallback: ADShowCallback(
            onShowSuccess: () {
              // LogUtils.i('广告展示成功 $adPosition $adId ${getTime()}');
              showTime = DateUtil.getNowDateMs();
              callBack?.onShowSuccess?.call();
            },
            onShowError: (adError) {
              // LogUtils.e('广告展示失败 $adPosition $adId code: ${adError.code} ${adError.msg}');
              callBack?.onShowError?.call(adError);
            },
            onCloseAD: () {
              // LogUtils.i('广告关闭 $adPosition $adId ${getTime()}');
              closeTime = DateUtil.getNowDateMs();
              callBack?.onCloseAD?.call();
            },
            onReward: (isComplete){
              callBack?.onReward?.call(isComplete);
            },
            onPaidCallback: callBack?.onPaidCallback));
  }

  bool isAvailable() {
    if (!isADAvailable()) {
      LogUtils.e('广告不可用不展示',tag: 'ADHelper',useLogcat: true);
      return false;
    }
    if (!NetworkChangeHelper.get.isNetworkAvailable) {
      LogUtils.e('没有网络不展示',tag: 'ADHelper',useLogcat: true);
      return false;
    }

    if (!isADAlive()) {
      LogUtils.e('广告超时不展示并且重新请求',tag: 'ADHelper',useLogcat: true);
      reset();
      loadAD();
      return false;
    }
    return true;
  }

  bool isADAvailable() {
    return adLoader.isAvailable();
  }

  bool isADAlive() {
    final intervalTime = DateUtil.getNowDateMs() - loadTime;
    return intervalTime < 50 * DateUtil.MIN;
  }

  bool isCacheAvailable() {
    return isADAvailable() && isADAlive();
  }

  bool isAllowRetry({int retry = 1}) {
    return retryCount < retry;
  }

  void addRetryCount() {
    retryCount++;
  }

  bool isShowing() {
    return adLoader.isShowing;
  }

  String getTime() {
    return DateUtil.formatNowDate(format: 'HH:mm:ss');
  }

  void reset() {
    loadTime = showTime = closeTime = 0;
  }

  ADPosition convertADPosition(String text) {
    switch (text) {
      case 'splash':
        return ADPosition.open;
      case 'play':
        return ADPosition.play;
      case 'other':
        return ADPosition.other;
      case 'highest':
        return ADPosition.highest;
    }
    return ADPosition.none;
  }

  ADSource convertADSource(String text) {
    text = text.toLowerCase();
    switch (text) {
      case 'admob':
        return ADSource.admob;
      case 'facebook':
        return ADSource.facebook;
      case 'max':
        return ADSource.max;
      case 'pangle':
        return ADSource.pangle;
      case 'unity':
        return ADSource.unity;
    }
    return ADSource.none;
  }

  ADType convertADType(String text) {
    switch (text) {
      case 'open':
        return ADType.splash;
      case 'interstitial':
        return ADType.interstitial;
      case 'native':
        return ADType.native;
      case 'banner':
        return ADType.banner;
      case 'reward':
        return ADType.reward;
      case 'interstitialReward':
        return ADType.interstitialReward;
    }
    return ADType.none;
  }

  BaseADLoader getADLoader() {
    switch (adType) {
      case ADType.none:
        return BaseADLoader();
      case ADType.splash:
        return OpenADLoader();
      case ADType.interstitial:
        // if (adSource == ADSource.max) {
        //   return MAXInterstitialADLoader();
        // }
        return InterstitialADLoader();
      case ADType.native:
        return BaseADLoader();
      case ADType.banner:
        return BaseADLoader();
      case ADType.reward:
        // if (adSource == ADSource.max) {
        //   return MAXRewardADLoader();
        // }
        return RewardAdLoader();
      case ADType.interstitialReward:
        return InterstitialRewardADLoader();
    }
  }

  String getADPositionName() {
    switch (adPosition) {
      case ADPosition.none:
        return 'none';
      case ADPosition.open:
        return '开屏';
      case ADPosition.play:
        return '播放';
      case ADPosition.other:
        return '其他';
      case ADPosition.highest:
        return '高价';
    }
  }

  String getADTypeName() {
    switch (adType) {
      case ADType.none:
        return 'none';
      case ADType.splash:
        return '开屏';
      case ADType.interstitial:
        return '插屏';
      case ADType.native:
        return '原生';
      case ADType.banner:
        return 'Banner';
      case ADType.reward:
        return '激励视频';
      case ADType.interstitialReward:
        return '激励插屏';
    }
  }

  String getADPositionNameEN() {
    switch (adPosition) {
      case ADPosition.none:
        return 'none';
      case ADPosition.open:
        return 'splash';
      case ADPosition.play:
        return 'play';
      case ADPosition.other:
        return 'other';
      case ADPosition.highest:
        return 'highest';
    }
  }

  String getADTypeNameEN() {
    switch (adType) {
      case ADType.none:
        return 'none';
      case ADType.splash:
        return 'open';
      case ADType.interstitial:
        return 'interstitial';
      case ADType.native:
        return 'native';
      case ADType.banner:
        return 'banner';
      case ADType.reward:
        return 'reward';
      case ADType.interstitialReward:
        return 'interstitialReward';
    }
  }

  String getADSourceEN() {
    switch (adSource) {
      case ADSource.none:
        return 'none';
      case ADSource.max:
        return 'max';
      case ADSource.admob:
        return 'admob';
      case ADSource.facebook:
        return 'facebook';
      case ADSource.unity:
        return 'unity';
      case ADSource.pangle:
        return 'pangle';
    }
  }

  String getADSourceVersion() {
    switch (adSource) {
      case ADSource.max:
        return '';
      case ADSource.admob:
        return '9.14.0';
      default:
        return '0.0.0';
    }
  }

  String getPositionAndType() {
    return '${getADPositionNameEN()}_${getADTypeNameEN()}';
  }
}
