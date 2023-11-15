import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class DialogUtils {
  static Future<void> showLoadingDialog({String? text}) async {
    await SmartDialog.showLoading(
        builder: (context) => LoadingWidget(
              msg: text ?? 'loading'.tr,
            ),
        maskColor: Colors.black26,
        clickMaskDismiss: false);
  }

  static Future<void> showTopDialog(Widget widget, {bool clickBgDismissTemp = true, String? tag}) async {
    await SmartDialog.show(
        alignment: Alignment.topCenter,
        clickMaskDismiss: clickBgDismissTemp,
        backDismiss: clickBgDismissTemp,
        tag: tag,
        builder: (BuildContext context) {
          return widget;
        });
  }

  static Future<T?> showBottomSheet<T>(Widget widget, {bool clickBgDismissTemp = true, String? tag}) {
    return SmartDialog.show(
        alignment: Alignment.bottomCenter,
        clickMaskDismiss: clickBgDismissTemp,
        backDismiss: clickBgDismissTemp,
        tag: tag,
        builder: (BuildContext context) {
          return widget;
        });
  }

  static Future<T?> showCenterDialog<T>(Widget widget, {bool clickBgDismissTemp = true, String? tag}) {
    return SmartDialog.show(
        alignment: Alignment.center,
        animationType: SmartAnimationType.centerFade_otherSlide,
        animationTime: const Duration(milliseconds: 100),
        clickMaskDismiss: clickBgDismissTemp,
        backDismiss: clickBgDismissTemp,
        tag: tag,
        builder: (BuildContext context) {
          return widget;
        });
  }

  static bool isShowing() {
    return SmartDialog.config.checkExist();
  }

  static dismiss<T>({T? result, String? tag}) {
    SmartDialog.dismiss(result: result, tag: tag);
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key, this.msg}) : super(key: key);

  ///loading msg
  final String? msg;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        //loading animation
        const SizedBox(
          width: 48,
          height: 48,
          child: CircularProgressIndicator(),
        ),
        //msg
        Text(
          msg ?? '',
          style: const TextStyle(color: Colors.white),
        ),
      ]),
    );
  }
}
