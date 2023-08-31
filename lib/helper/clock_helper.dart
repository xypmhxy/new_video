/*
* 作者 Ren
* 时间  2023/8/20 08:42
*/

import 'dart:convert';

import 'package:advertising_info/advertising_info.dart';
import 'package:android_id/android_id.dart';
import 'package:appwrite/appwrite.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:free_tube_player/app/app_utils.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/utils/log_utils.dart';
import 'package:free_tube_player/utils/sp_utils.dart';

class ClockHelper {
  static final instance = ClockHelper._();

  final client = Client();
  final _dio = Dio();
  late Functions functions;
  late Account account;

  bool isUserMode = false;
  bool isRequesting = false;

  ClockHelper._() {
    client.setEndpoint(appwriteEndpoint).setProject(appwriteProjectId);
    functions = Functions(client);
    account = Account(client);
  }

  Future<void> requestClock() async {
    try {
      if (isDebug){
        SPUtils.setBool('is_user_mode', isUserMode);
        return;
      }
      final userMode = SPUtils.getBool('is_user_mode', defaultValue: false);
      if (userMode) {
        isUserMode = userMode;
        return;
      }
      if (isRequesting) return;
      isRequesting = true;
      try {
        await account.createAnonymousSession();
      } catch (e) {}
      final ipResponse = await _dio.get('https://ifconfig.me/ip');
      final ip = ipResponse.data ?? '';
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
      LogUtils.i('Clock请求结果 $response');
      isUserMode = response == 'naiLong';
      isRequesting = false;
      SPUtils.setBool('is_user_mode', isUserMode);
    } catch (e) {
      LogUtils.e('Clock异常 $e');
      isRequesting = false;
    }
  }
}
