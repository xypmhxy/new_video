/*
* 作者 Ren
* 时间  2023/7/28 07:56
*/
import 'package:get/get.dart';
import 'package:screen_brightness/screen_brightness.dart';

class PlayerPageController extends GetxController {
  final _screenBrightness = ScreenBrightness();
  double brightness = 0.0;

  @override
  dispose() {
    restoreBrightness();
    super.dispose();
  }

  Future<void> initScreenBrightness() async {
    brightness = await ScreenBrightness().current;
  }

  Future<void> restoreBrightness() async {
    await _screenBrightness.setScreenBrightness(brightness);
  }
}
