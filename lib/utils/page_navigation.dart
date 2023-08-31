import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageNavigation {
  static Future<T?>? startNewPage<T>(Widget newPage) {
    return Get.to(newPage);
  }

  static void back<T>({T? result}) {
    Get.back(result: result);
  }

  static Future<T?>? startNewPageAndClose<T>(Widget newPage) {
    return Get.off(newPage);
  }

  static Future<T?>? startNewPageAndCloseAll<T>(Widget newPage) {
    return Get.offAll(newPage);
  }

  static Future<T?>? startNewPageGetData<T>(Widget newPage) async {
    return Get.to(() => newPage);
  }

  static closeAndReturnData<T>({T? result}) {
    Get.back(result: result);
  }
}