/*
* 作者 Ren
* 时间  2023/9/7 22:13
*/
import 'package:device_info_plus/device_info_plus.dart';

class BaseBlindnessInfo {
  final AndroidDeviceInfo androidDeviceInfo;
  final String? gaid;
  final String? androidId;
  final String? operator;

  BaseBlindnessInfo(
      {required this.androidDeviceInfo, required this.gaid, required this.androidId, required this.operator});

  Map<String, dynamic> getParams() {
    return {};
  }

  String getUrl() {
    return '';
  }

  String getResult() {
    return '';
  }

  int getId() {
    return -1;
  }

  String getType(){
    return 'Local';
  }
}
