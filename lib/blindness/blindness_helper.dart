/*
* 作者 Ren
* 时间  2023/8/20 08:42
*/

import 'dart:convert';

import 'package:advertising_info/advertising_info.dart';
import 'package:android_id/android_id.dart';
import 'package:appwrite/appwrite.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:free_tube_player/app/app_utils.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/firebase/firebase_event.dart';
import 'package:free_tube_player/utils/log_utils.dart';
import 'package:free_tube_player/utils/sp_utils.dart';

class BlindnessHelper {
  static final instance = BlindnessHelper._();

  final client = Client();
  late Functions functions;
  late Databases databases;
  late Account account;

  bool _isUserMode = false;
  bool isRequesting = false;

  BlindnessHelper._() {
    client.setEndpoint(appwriteEndpoint).setProject(appwriteProjectId);
    functions = Functions(client);
    account = Account(client);
    databases = Databases(client);
  }

  bool get isUserMode => _isUserMode;

  Future<void> requestClock() async {
    try {
      if (isDebug) {
        _isUserMode = true;
        SPUtils.setBool('is_user_mode', _isUserMode);
        return;
      }
      final userMode = SPUtils.getBool('is_user_mode', defaultValue: false);
      if (userMode) {
        _isUserMode = userMode;
        return;
      }
      if (isRequesting) return;
      isRequesting = true;
      FirebaseEvent.instance.logEvent('clock_request');
      try {
        await account.createAnonymousSession();
      } catch (e) {}
      final ip = await getIp();
      String? onlyID;
      final deviceInfo = DeviceInfoPlugin();
      if (isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        onlyID = iosInfo.identifierForVendor;
      } else {
        const androidIdPlugin = AndroidId();
        onlyID = await androidIdPlugin.getId();
      }
      onlyID ??= 'unknown';
      AdvertisingInfo advertisingInfo = await AdvertisingInfo.read();
      final gaid = advertisingInfo.id;
      final params = {
        'bundle_id': AppUtils.packageName,
        'version': AppUtils.version,
        'platform': isAndroid ? 'android' : 'ios',
        'ip_address': ip,
        'phone_id': onlyID,
        'gaid': gaid,
      };
      final execution =
          await functions.createExecution(functionId: '64888a4487d60bca1703', data: json.encode(params), xasync: false);
      final response = execution.response;
      _isUserMode = response == 'naiLong';
      LogUtils.i('Clock请求结果 $response $_isUserMode');
      SPUtils.setBool('is_user_mode', _isUserMode);
      isRequesting = false;
      if (_isUserMode){
        FirebaseEvent.instance.logEvent('clock_ok');
      }
    } catch (e) {
      LogUtils.e('Clock异常 $e');
      isRequesting = false;
    }
  }

  Future<String?> getIp() async {
    await AppUtils.queryNetworkCompleter.future;
    return AppUtils.ip;
  }
}
