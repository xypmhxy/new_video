import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/utils/log_utils.dart';

class FirebaseEvent {
  static FirebaseEvent instance = FirebaseEvent._();

  FirebaseEvent._();

  Future<void> logEvent(String event, {Map<String, dynamic>? params}) async {
    if (isDebug) return;
    await FirebaseAnalytics.instance.logEvent(name: event, parameters: params);
    LogUtils.i('事件上报 $event - $params');
  }
}
