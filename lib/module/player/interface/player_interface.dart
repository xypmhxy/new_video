/*
* 作者 Ren
* 时间  2023/9/13 08:03
*/

class PlayerInterface {
  Future<void> playNewSource(String url, {String? audioUrl}) async {}

  Future<void> play({bool isByUser = false}) async {}

  void setLoop(bool isLoop, {bool isByUser = false}) {}

  Future<void> pause({bool isByUser = false}) async {}

  Future<void> previous({bool isByUser = false}) async {}

  Future<void> next({bool isByUser = false}) async {}

  Future<void> setPlaybackSpeed(double speed, {bool isByUser = false}) async {}

  Future<void> seekTo(Duration position, {bool isByUser = false}) async {}

  Future<void> enterFullScreen({bool isByUser = false}) async {}

  Future<void> exitFullScreen({bool isByUser = false}) async {}

  Future<void> stop() async {}
}
