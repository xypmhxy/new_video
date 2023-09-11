/*
* 作者 Ren
* 时间  2023/9/5 19:37
*/
import 'dart:async';

import 'package:firebase_remote_config/firebase_remote_config.dart';

class ServerConfig {
  final StreamController<bool> _streamController = StreamController.broadcast();
  late Stream<bool> watchConfig = _streamController.stream;

  Future<void> fetchConfig() async {
    await FirebaseRemoteConfig.instance.fetchAndActivate();
    _streamController.add(true);
  }
}
