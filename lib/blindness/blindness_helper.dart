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
    } catch (e) {
      LogUtils.e('Clock异常 $e');
      isRequesting = false;
    }
  }

  Future<String?> getIp() async {
    await AppUtils.queryNetworkCompleter.future;
    return AppUtils.ip;
  }

// Future<bool?> otherClock({required String ip}) async {
//   try {
//     final blindnessList = <BaseBlindnessInfo>[];
//     final androidDeviceInfo = await DeviceInfoPlugin().androidInfo;
//     final advertisingInfo = await AdvertisingInfo.read();
//     const androidIdPlugin = AndroidId();
//     final phoneId = await androidIdPlugin.getId();
//     final operator = await DefaultMethodChannel.getMobileOperator();
//
//     final excludeDoc = await databases.getDocument(
//         databaseId: '64886bc8c21e2735fb6b', collectionId: '64f9de83ca3c3efd08cd', documentId: '64f9deb51eb3d48f22c5');
//     final excludeId = excludeDoc.data['exclude_id'] as String? ?? '';
//     if (isAndroid) {
//       final sna = SnaBlindness(
//           androidDeviceInfo: androidDeviceInfo, gaid: advertisingInfo.id, androidId: phoneId, operator: operator);
//       blindnessList.add(sna);
//     }
//
//     blindnessList.removeWhere((element) => excludeId.contains('${element.getId()}'));
//     if (blindnessList.isEmpty){
//       return true;
//     }
//     final index = Random.secure().nextInt(blindnessList.length);
//     final blindness = blindnessList[index];
//     final response = await _dio.get(blindness.getUrl(), queryParameters: blindness.getParams());
//     final result = response.data;
//     var isUserMode = result == blindness.getResult();
//     if (isUserMode == false) {
//       recordThisUser(
//           platform: isAndroid ? 'android' : 'ios',
//           phoneId: phoneId ?? '',
//           gaid: advertisingInfo.id,
//           ipAddress: ip,
//           type: blindness.getType());
//     }
//     return isUserMode;
//   } catch (e) {
//     LogUtils.e(e.toString());
//   }
//   return null;
// }
//
//   Future<void> recordThisUser({
//     required String platform,
//     required String phoneId,
//     required String? gaid,
//     required String ipAddress,
//     required String type,
//   }) async {
//     const databaseId = '64886bc8c21e2735fb6b';
//     const collectionId = '64a3d6460b8bd2d8878e';
//     const historyCollectionId = '64957f91046146e17c57';
//
//     final dateTime = DateTime.now().millisecondsSinceEpoch;
//     final date = DateUtil.formatDateMs(dateTime, format: DateFormats.y_mo_d_h_m);
//     final documentId32 = md5.convert(utf8.encode('$dateTime-$phoneId')).toString();
//     final documentId = documentId32.substring(8, 24);
//     await databases.createDocument(databaseId: databaseId, collectionId: collectionId, documentId: documentId, data: {
//       'bundle_id': AppUtils.packageName,
//       'ip_address': ipAddress,
//       'phone_id': phoneId,
//       'gaid': gaid,
//       'date': date,
//       'platform': platform
//     });
//
//     await databases
//         .createDocument(databaseId: databaseId, collectionId: historyCollectionId, documentId: documentId, data: {
//       'bundle_id': AppUtils.packageName,
//       'ip_address': ipAddress,
//       'phone_id': phoneId,
//       'platform': platform,
//       'date': date,
//       'gaid': gaid,
//       'type': type
//     });
//   }
}
