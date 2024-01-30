/*
* 作者 Ren
* 时间  2024/1/20 09:42
*/

import 'package:free_tube_player/dialog/dialog_rate.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/utils/date_utils.dart';
import 'package:free_tube_player/utils/dialog_utils.dart';
import 'package:free_tube_player/utils/sp_utils.dart';
import 'package:free_tube_player/utils/toast_utils.dart';
import 'package:in_app_review/in_app_review.dart';

import '../firebase/firebase_event.dart';

class RateUtils {
  static bool isUserAction = false;

  static recordAction() {
    isUserAction = true;
  }

  static void setRecentlyShowTime() {
    SPUtils.setInt('recent_show_rate_dialog', DateTime.now().millisecondsSinceEpoch);
  }

  static int getRecentlyShowTime() {
    return SPUtils.getInt('recent_show_rate_dialog');
  }

  static void addShowRateCount() {
    final count = getShowRateCount();
    SPUtils.setInt('recent_show_rate_dialog_count', count + 1);
  }

  static int getShowRateCount() {
    return SPUtils.getInt('recent_show_rate_dialog_count');
  }

  static void tryShowRateDialog() {
    if (isUserAction == false) return;
    final showCount = getShowRateCount();
    if (showCount >= 2) return;
    final nowDate = DateTime.now().millisecondsSinceEpoch;
    final recentShowDate = getRecentlyShowTime();
    if (nowDate - recentShowDate < 18 * DateUtil.HOUR) return;
    addShowRateCount();
    setRecentlyShowTime();
    isUserAction = false;
    FirebaseEvent.instance.logEvent('rate_dialog_expose');
    DialogUtils.showCenterDialog(DialogRate(onRatingUpdate: (rating) async {
      DialogUtils.dismiss();
      FirebaseEvent.instance.logEvent('rate', params: {'value': '$rating'});
      if (rating == 5) {
        final InAppReview inAppReview = InAppReview.instance;
        if (await inAppReview.isAvailable()) {
          inAppReview.requestReview();
        }
      } else {
        ToastUtils.show(S.current.thanksRate);
      }
    }));
  }
}
