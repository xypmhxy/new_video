import 'package:shared_preferences/shared_preferences.dart';

class SPUtils {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> setString(String key, String value) {
    return prefs.setString(key, value);
  }

  static String? getString(String key, {String? defaultValue}) {
    String? value = prefs.getString(key);
    return value ?? defaultValue;
  }

  static Future<bool> setInt(String key, int value) {
    return prefs.setInt(key, value);
  }

  static int getInt(String key, {int defaultValue = 0}) {
    int? value = prefs.getInt(key);
    return value ?? defaultValue;
  }

  static Future<bool> setBool(String key, bool value) {
    return prefs.setBool(key, value);
  }

  static bool getBool(String key, {bool defaultValue = false}) {
    bool? value = prefs.getBool(key);
    return value ?? defaultValue;
  }
}
