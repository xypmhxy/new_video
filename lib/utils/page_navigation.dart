import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageNavigation {
  static Future<T?>? startNewPage<T>(Widget newPage, {bool preventDuplicates = true}) {
    return Get.to(newPage, preventDuplicates: preventDuplicates);
  }

  static void back<T>({T? result}) {
    Get.back(result: result);
  }

  static Future<T?>? startNewPageAndClose<T>(Widget newPage, {bool preventDuplicates = true}) {
    return Get.off(newPage, preventDuplicates: preventDuplicates);
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

  static Future<T?>? startSamePage<T>(Widget newPage) {
    return navigator?.push(
      MaterialPageRoute(
        builder: (_) {
          return newPage;
        },
      ),
    );
  }

  static Future<T?>? startNewPageAndCloseWithOrigin<T>(BuildContext context, Widget newPage) {
    return Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
      return newPage;
    }));
  }
}
