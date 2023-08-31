/*
* 作者 Ren
* 时间  2023/8/20 08:53
*/

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:free_tube_player/utils/log_utils.dart';

class NetworkChangeHelper {
  static final get = NetworkChangeHelper._();

  NetworkChangeHelper._();

  final Connectivity _connectivity = Connectivity();
  ConnectivityResult _connectStatus = ConnectivityResult.none;

  ConnectivityResult get connectStatus => _connectStatus;

  bool isNetworkAvailable = false;
  final _streamController = StreamController<ConnectivityResult>();
  late Stream<ConnectivityResult> watchNetworkChange = _streamController.stream.asBroadcastStream();

  Future<ConnectivityResult> checkStatus() {
    return _connectivity.checkConnectivity();
  }

  void initListener() {
    _connectivity.onConnectivityChanged.listen((result) {
      if (_connectStatus != result) {
        LogUtils.i('NetworkChangeHelper网络状态变化 $_connectStatus  ---  $result');
        _connectStatus = result;
        isNetworkAvailable = _connectStatus != ConnectivityResult.none;
        _streamController.add(_connectStatus);
      }
    });
  }

  // void addListener(OnNetworkStatusChangeListener listener) {
  //   _listeners.add(listener);
  // }
  //
  // void removeListener(OnNetworkStatusChangeListener listener) {
  //   _listeners.remove(listener);
  // }
}

// class OnNetworkStatusChangeListener {
//   void onNetworkChange(ConnectivityResult result) {}
// }
