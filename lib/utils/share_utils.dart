/*
* 作者 Ren
* 时间  2023/12/16 10:29
*/


import 'package:share_plus/share_plus.dart';

class ShareUtils {
  static Future<void> shareText(String text) async {
    await Share.share(text);
  }
}
