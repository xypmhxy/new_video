import 'dart:async';
import 'dart:convert';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:free_tube_player/ad/ad_member.dart';
import 'package:free_tube_player/ad/admob/reward_ad_loader.dart';
import 'package:free_tube_player/ad/default_ad_config.dart';
import 'package:free_tube_player/ad/helper/ad_situation.dart';
import 'package:free_tube_player/ad/helper/ad_wrapper.dart';
import 'package:free_tube_player/app/app_utils.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/utils/date_utils.dart';
import 'package:free_tube_player/utils/log_utils.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ADManager {
  static ADManager instance = ADManager._();

  ADManager._();

  Map<String, List<ADWrapper>> adMap = {};
  int showCount = 0;
  int sameInterval = 0; //同广告场景展示间隔单位 秒
  int differentInterval = 0; //不同广告场景展示间隔单位 秒
  int timeOut = 0; //请求超时 单位秒

  ADWrapper? _highest;
  ADWrapper? _openAD;
  ADWrapper? _playInterAD;
  ADWrapper? _otherAD;
  ADWrapper? _cutReward;

  bool isHighestLoading = false;
  bool isSplashLoading = false;
  bool isPlayLoading = false;
  bool isOtherLoading = false;
  bool isCutRewardLoading = false;

  String highestRequestPosition = 'all';

  ADSituation? lastADSituation;
  Map<ADSituationType, int> adCloseTimeMap = {};

  // Completer<bool> maxInitCompleter = Completer();
  Completer<bool> admobInitFuture = Completer();

  bool hasADShowing = false;

  String adTextPrint = '';

  void startWatchConfig() {
    serverConfig.watchConfig.listen((event) {
      updateConfig();
    });
  }

  void registerAndroidInstallReferrer() {
    // AndroidInstallReferrerHelper.instance.addListener(this);
  }

  //
  // @override
  // void onGetInstallReferrer(ReferrerDetails details) {
  //   updateConfig();
  // }

  void initMAXAD() async {
    // AppLovinMAXHelper.instance.initInterstitialListener();
    // LogUtils.i('AppLovinMAX开始初始化 ${DateUtil.getNowDateMs()}');
    // Future.delayed(const Duration(seconds: 7)).then((value) {
    //   if (!maxInitCompleter.isCompleted) {
    //     maxInitCompleter.complete(false);
    //     LogUtils.e('AppLovinMAX初始化超时 -- ${DateUtil.getNowDateMs()}');
    //   }
    // });
    // AppLovinMAX.setMuted(true);
    // AppLovinMAX.setVerboseLogging(false);
    // AppLovinMAX.setTestDeviceAdvertisingIds([
    //   'c130d3d4-8c6e-41d9-9e57-751c9b281443',
    //   '951D6AFC-673E-44D1-9CA0-BE3DB00E50E4',
    //   '3061cbb9-f81b-448c-b7de-17038ad075d8',
    // ]);
    // final config = await AppLovinMAX.initialize(ModeUtils.maxSDKey);
    // LogUtils.i('AppLovinMAX初始化成功 -- ${DateUtil.getNowDateMs()} ${config.toString()}');
    // maxInitCompleter.complete(true);
  }

  void initADMob() {
    Future.delayed(const Duration(seconds: 8)).then((value) {
      if (!admobInitFuture.isCompleted) {
        admobInitFuture.complete(false);
        LogUtils.e('ADMob初始化超时 -- ${DateUtil.getNowDateMs()}', tag: 'ADHelper', useLogcat: true);
      }
    });
    MobileAds.instance.initialize().then((value) {
      if (!admobInitFuture.isCompleted) {
        admobInitFuture.complete(true);
      }
      updateConfig();
      Map<String, AdapterStatus> map = value.adapterStatuses;
      for (final key in map.keys) {
        final adapter = map[key];
        print('ADMob初始化结果 $key: ${adapter?.state}');
      }
    });
  }

  void updateConfig() {
    String aDConfigBase64 = DefaultADConfig.defaultADConfig;
    String remoteConfig = isDebug ? '' : FirebaseRemoteConfig.instance.getString('ad_config');
    // if (AndroidInstallReferrerHelper.instance.isBuyUser()) {
    //   final userRemoteConfig = FirebaseRemoteConfig.instance.getString('ad_config_user');
    //   if (userRemoteConfig.isNotEmpty) {
    //     remoteConfig = userRemoteConfig;
    //   }
    //   LogUtils.i('买量用户.....');
    // }
    if (remoteConfig.isNotEmpty) {
      aDConfigBase64 = remoteConfig;
    }
    final adText = utf8.decode(base64Decode(aDConfigBase64));
    adTextPrint = adText;
    try {
      Map configJson = json.decode(adText);
      LogUtils.i('广告参数 $configJson', tag: 'ADHelper', useLogcat: true);
      showCount = configJson['showCount'] ?? 100;
      sameInterval = configJson['sameInterval'] ?? 60;
      differentInterval = configJson['differentInterval'] ?? 60;
      timeOut = configJson['timeOut'] ?? 10;
      highestRequestPosition = configJson['highestRequestPosition'] ?? 'all';

      final highestADWrapperList = _getADWrapper(configJson, 'highest');
      adMap['highest'] = highestADWrapperList;

      final openADWrapperList = _getADWrapper(configJson, 'open');
      adMap['open'] = openADWrapperList;

      final playADWrapperList = _getADWrapper(configJson, 'play');
      adMap['play'] = playADWrapperList;

      final otherADWrapperList = _getADWrapper(configJson, 'other');
      adMap['other'] = otherADWrapperList;

      final settingReward = _getADWrapper(configJson, 'cut');
      adMap['cut'] = settingReward;
    } catch (e) {
      LogUtils.e('解析广告参数出现异常 $e}', tag: 'ADHelper', useLogcat: true);
    }
  }

  List<ADWrapper> _getADWrapper(Map cloakJson, String key) {
    List<ADWrapper> adList = [];
    if (cloakJson.keys.contains(key)) {
      List adJsonArray = cloakJson[key];
      for (final map in adJsonArray) {
        map['adPosition'] = key;
        adList.add(ADWrapper.fromMap(map));
      }
      adList.sort((a, b) {
        return a.adWeight < b.adWeight ? 1 : 0;
      });
    }
    return adList;
  }

  Future<ADWrapper?> _handleLoadAD(List<ADWrapper> adWrappers, {int allowRetryCount = 1}) async {
    final launchCount = AppUtils.appLaunchCount;
    for (final adWrapper in adWrappers) {
      if (launchCount <= adWrapper.openTimes) {
        LogUtils.i('进入应用次数不够 ${adWrapper.adId} - 当前次数$launchCount 需要${adWrapper.openTimes}',
            tag: 'ADHelper', useLogcat: true);
        continue;
      }
      final result = await adWrapper.loadAD(allowRetryCount: allowRetryCount);
      if (result) {
        return adWrapper;
      }
    }
    return null;
  }

  Future<bool> _showAD(ADSituation currentADSituation,
      {Future<bool> Function()? adLoader, ADIntervalType intervalType = ADIntervalType.all}) async {
    ADWrapper? adWrapper = currentADSituation.adWrapper;
    Completer<bool> closeCompleter = Completer();
    final isAvailable = adWrapper?.isAvailable() ?? false;
    if (!isAvailable) {
      return false;
    }
    final nowDate = DateUtil.getNowDateMs();
    final lastShowTime = adCloseTimeMap[currentADSituation.situationType] ?? 0;
    final otherLastShowTime = adCloseTimeMap[lastADSituation?.situationType ?? ADSituationType.none] ?? 0;
    final isSameSituation = lastADSituation?.situationType == currentADSituation.situationType;
    final selfInterval = nowDate - lastShowTime;
    var otherInterval = nowDate - otherLastShowTime;
    LogUtils.i('当前展示场景${currentADSituation.toString()}\n上次展示场景${lastADSituation?.toString()}',
        tag: 'ADHelper', useLogcat: true);
    //上一次开屏展示间隔大于1分钟并且和其他位置广告展示间隔大于1分钟
    if (intervalType == ADIntervalType.all) {
      //同样场景则不需要考虑其他场景的间隔
      if (isSameSituation) {
        otherInterval = nowDate;
      }
      if (selfInterval < sameInterval * DateUtil.SECOND || otherInterval < differentInterval * DateUtil.SECOND) {
        LogUtils.i('间隔时间不够不展示 all $selfInterval $otherInterval', tag: 'ADHelper', useLogcat: true);
        return false;
      }
    } else if (intervalType == ADIntervalType.self) {
      if (isSameSituation && selfInterval < sameInterval * DateUtil.SECOND) {
        LogUtils.i('间隔时间不够不展示 self $selfInterval $otherInterval', tag: 'ADHelper', useLogcat: true);
        return false;
      }
    } else if (intervalType == ADIntervalType.other) {
      if (!isSameSituation && otherInterval < differentInterval * DateUtil.SECOND) {
        LogUtils.i('间隔时间不够不展示 other $selfInterval $otherInterval', tag: 'ADHelper', useLogcat: true);
        return false;
      }
    }

    // PostEventHelper.instance.logEvent(
    //     name: "ad_need_show",
    //     parameters: {"value": adWrapper?.adPosition == ADPosition.splash ? "open_cool" : "play_play"});
    final isRewardAd = adWrapper?.adLoader is RewardAdLoader;
    if (isRewardAd && isIOS) {
      // XScreen.enterFullScreen();
    }
    adWrapper?.showAD(
        callBack: ADShowCallback(
      onShowSuccess: () {
        if (lastADSituation == null || lastADSituation?.situationType != currentADSituation.situationType) {
          lastADSituation = currentADSituation;
        }
        hasADShowing = true;
        LogUtils.i('广告展示成功 ${adWrapper.adId} ${adWrapper.getADPositionName()} ${adWrapper.getADTypeName()}',
            tag: 'ADHelper', useLogcat: true);
        // PostEventHelper.instance.logEvent(
        //     name: "ad_show_placement",
        //     parameters: {"value": adWrapper.adPosition == ADPosition.splash ? "open_cool" : "play_play"});
      },
      onShowError: (adError) {
        // PostEventHelper.instance.logEvent(
        //     name: "ad_fail",
        //     parameters: {"value": adWrapper.adPosition == ADPosition.splash ? "open" : "play", "code": adError.code});
        LogUtils.e(
            '广告展示失败 ${adWrapper.getADPositionName()} ${adWrapper.getADTypeName()} code: ${adError.code} ${adError.msg}',
            tag: 'ADHelper',
            useLogcat: true);
        // if (isRewardAd && isIOS) XScreen.exitFullScreen();
        closeCompleter.complete(false);
      },
      onCloseAD: () {
        hasADShowing = false;
        adCloseTimeMap[currentADSituation.situationType] = DateUtil.getNowDateMs();
        LogUtils.i('广告关闭 ${adWrapper.adId} ${adWrapper.getADPositionName()} ${adWrapper.getADTypeName()}',
            tag: 'ADHelper', useLogcat: true);
        closeCompleter.complete(true);
        adLoader?.call();
        // if (isRewardAd && isIOS) XScreen.exitFullScreen();
      },
    ));
    return closeCompleter.future;
  }

  ///高价层请求
  Future<bool> loadHighest() async {
    if (isHighestLoading) {
      LogUtils.i('高价层请求中不请求', tag: 'ADHelper', useLogcat: true);
      return false;
    }
    if (_highest?.isCacheAvailable() ?? false) {
      LogUtils.i('高价层缓存可用不重复请求', tag: 'ADHelper', useLogcat: true);
      return false;
    }
    final highestADList = adMap['highest'];
    LogUtils.i('高价层开始加载 ${highestADList?.length}', tag: 'ADHelper', useLogcat: true);
    if (highestADList == null) {
      return false;
    }
    isHighestLoading = true;
    _highest = await _handleLoadAD(highestADList, allowRetryCount: 0);
    isHighestLoading = false;
    if (_highest != null) {
      LogUtils.i('高价层加载成功 ${_highest?.adSource} - ${_highest?.adType} - ${_highest?.adId}',
          tag: 'ADHelper', useLogcat: true);
    }
    return _highest != null;
  }

  Future<bool> tryShowHighest(
      {required ADSituationType situationType,
      required ADPosition adPosition,
      Future<bool> Function()? adLoader,
      ADIntervalType intervalType = ADIntervalType.all}) async {
    if (highestRequestPosition != 'all') {
      if (highestRequestPosition.contains(adPosition.name) == false) {
        LogUtils.e('此位置不展示高价层广告 $highestRequestPosition - ${adPosition.name}', tag: 'ADHelper', useLogcat: true);
        return false;
      }
    }
    return _showAD(ADSituation(_highest, situationType), adLoader: adLoader, intervalType: intervalType);
  }

  Future<bool> loadOpenAD({bool needLoadHighest = true}) async {
    if (needLoadHighest) {
      loadHighest();
    }
    if (isSplashLoading) {
      LogUtils.i('开屏请求中不请求', tag: 'ADHelper', useLogcat: true);
      return false;
    }
    // PostEventHelper.instance.logEvent(name: "ad_req_placement", parameters: {"value": "open_cool"});
    if (_openAD?.isCacheAvailable() ?? false) {
      LogUtils.i('开屏缓存可用不重复请求', tag: 'ADHelper', useLogcat: true);
      return false;
    }
    final openADList = adMap['open'];
    LogUtils.i('开屏开始加载 ${openADList?.length}', tag: 'ADHelper', useLogcat: true);
    if (openADList == null) {
      return false;
    }
    isSplashLoading = true;
    _openAD = await _handleLoadAD(openADList, allowRetryCount: 1);
    isSplashLoading = false;
    if (_openAD != null) {
      LogUtils.i('开屏加载成功 ${_openAD?.adSource} - ${_openAD?.adType} - ${_openAD?.adId}',
          tag: 'ADHelper', useLogcat: true);
    }
    return _openAD != null;
  }

  Future<bool> tryShowOpenAD() async {
    final showResult =
        await tryShowHighest(situationType: ADSituationType.open, adPosition: ADPosition.open, adLoader: loadOpenAD);
    if (showResult) {
      return true;
    }
    return _showAD(ADSituation(_openAD, ADSituationType.open), adLoader: loadOpenAD);
  }

  Future<bool> loadPlayAD({bool needLoadHighest = true}) async {
    if (needLoadHighest) {
      loadHighest();
    }
    if (isPlayLoading) {
      LogUtils.i('播放请求中不请求', tag: 'ADHelper', useLogcat: true);
      return false;
    }
    // PostEventHelper.instance.logEvent(name: "ad_req_placement", parameters: {"value": "play_play"});
    if (_playInterAD?.isCacheAvailable() ?? false) {
      LogUtils.i('播放插屏缓存可用不重复请求', tag: 'ADHelper', useLogcat: true);
      return false;
    }
    final playADList = adMap['play'];
    LogUtils.i('播放插屏开始加载 ${playADList?.length}', tag: 'ADHelper', useLogcat: true);
    if (playADList == null) {
      return false;
    }
    isPlayLoading = true;
    _playInterAD = await _handleLoadAD(playADList, allowRetryCount: 0);
    isPlayLoading = false;
    if (_playInterAD != null) {
      LogUtils.i('播放插屏加载成功 ${_playInterAD?.adType} - ${_playInterAD?.adId}', tag: 'ADHelper', useLogcat: true);
    }
    return _playInterAD != null;
  }

  Future<bool> tryShowPlayAD() async {
    final showResult =
        await tryShowHighest(situationType: ADSituationType.play, adPosition: ADPosition.play, adLoader: loadPlayAD);
    if (showResult) {
      return true;
    }
    return _showAD(ADSituation(_playInterAD, ADSituationType.play), adLoader: loadPlayAD);
  }

  Future<bool> loadOtherAD({bool needLoadHighest = true}) async {
    if (needLoadHighest) {
      loadHighest();
    }
    if (isOtherLoading) {
      LogUtils.i('其他请求中不请求', tag: 'ADHelper', useLogcat: true);
      return false;
    }
    if (_otherAD?.isCacheAvailable() ?? false) {
      LogUtils.i('其他位置插屏缓存可用不重复请求', tag: 'ADHelper', useLogcat: true);
      return false;
    }
    final playADList = adMap['other'];
    LogUtils.i('其他位置插屏开始加载 ${playADList?.length}', tag: 'ADHelper', useLogcat: true);
    if (playADList == null) {
      return false;
    }
    isOtherLoading = true;
    _otherAD = await _handleLoadAD(playADList, allowRetryCount: 0);
    isOtherLoading = false;
    if (_otherAD != null) {
      LogUtils.i('其他位置插屏加载成功 ${_otherAD?.adType} - ${_otherAD?.adId}', tag: 'ADHelper', useLogcat: true);
    }
    return _otherAD != null;
  }

  Future<bool> tryShowDownloadAD() async {
    final showResult = await tryShowHighest(
        situationType: ADSituationType.download, adPosition: ADPosition.other, adLoader: loadOtherAD);
    if (showResult) {
      return true;
    }
    return _showAD(ADSituation(_otherAD, ADSituationType.download), adLoader: loadOtherAD);
  }

  Future<bool> tryShowPlayListAD() async {
    final showResult = await tryShowHighest(
        situationType: ADSituationType.playList, adPosition: ADPosition.other, adLoader: loadOtherAD);
    if (showResult) {
      return true;
    }
    return _showAD(ADSituation(_otherAD, ADSituationType.playList), adLoader: loadOtherAD);
  }

  Future<bool> trySearchAD() async {
    final showResult = await tryShowHighest(
        situationType: ADSituationType.search, adPosition: ADPosition.other, adLoader: loadOtherAD);
    if (showResult) {
      return true;
    }
    return _showAD(ADSituation(_otherAD, ADSituationType.search), adLoader: loadOtherAD);
  }

  ///剪切激励视频
  Future<bool> loadSettingRewardAD() async {
    if (isCutRewardLoading) {
      LogUtils.i('设置激励请求中不请求', tag: 'ADHelper', useLogcat: true);
      return false;
    }
    if (_cutReward?.isCacheAvailable() ?? false) {
      LogUtils.i('设置激励缓存可用不重复请求', tag: 'ADHelper', useLogcat: true);
      return false;
    }
    final playADList = adMap['setting'];
    LogUtils.i('设置激励开始加载 ${playADList?.length}', tag: 'ADHelper', useLogcat: true);
    if (playADList == null) {
      return false;
    }
    isCutRewardLoading = true;
    _cutReward = await _handleLoadAD(playADList, allowRetryCount: 0);
    isCutRewardLoading = false;
    if (_cutReward != null) {
      LogUtils.i('设置激励加载成功 ${_cutReward?.adType} - ${_cutReward?.adId}', tag: 'ADHelper', useLogcat: true);
    }
    return _cutReward != null;
  }

  Future<bool> tryShowSettingReward({ValueChanged<bool>? onReward}) async {
    if (_cutReward == null || _cutReward?.isAvailable() == false) return false;
    await _cutReward?.showAD(callBack: ADShowCallback(onReward: (isComplete) {
      onReward?.call(isComplete);
    }));
    return true;
  }

  //调试方法
  // 打开admob调试器
  void showAdmobInspector() {
    MobileAds.instance.openAdInspector((value) {
      LogUtils.i('Admob调试器 ${value?.message}', tag: 'ADHelper', useLogcat: true);
    });
  }

  // 打开applovin调试器
  void showApplovinMediationDebugger() {
    // AppLovinMAX.showMediationDebugger();
  }
}
