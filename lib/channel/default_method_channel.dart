/*
* 作者 Ren
* 时间  2023/8/6 21:00
*/
import 'package:flutter/services.dart';
import 'package:free_tube_player/app/common/common.dart';

class DefaultMethodChannel {
  static const _channel = MethodChannel('tuber.default.method.channel');

  static Future<int> getAndroidSDKInt() async {
    if (isIOS) return 0;
    final sdkInt = await _channel.invokeMethod('getAndroidSDKInt');
    return (sdkInt as int?) ?? 23;
  }
}
