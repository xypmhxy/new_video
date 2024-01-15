/*
* 作者 Ren
* 时间  2024/1/13 10:50
*/
import 'sp_utils.dart';

class SettingUtils {
  static void setBoolConfig(String key, bool value) {
    SPUtils.setBool(key, value);
  }

  static bool getBoolConfig(String key, {bool defaultValue = false}) {
    return SPUtils.getBool(key, defaultValue: defaultValue);
  }

  static void toggleConfig(String key, {bool defaultValue = false}){
    final curValue = getBoolConfig(key,defaultValue: defaultValue);
    setBoolConfig(key, !curValue);
  }
}
