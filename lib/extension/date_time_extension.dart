/*
* 作者 Ren
* 时间  2023/8/5 16:23
*/
import 'package:free_tube_player/utils/date_utils.dart';

extension DateTimeExtension on DateTime {
  String toDay() {
    return '$year$month$day';
  }

  //获取某天0点0分0秒
  int dayStart() {
    return DateTime(year, month, day).millisecondsSinceEpoch;
  }

  String format({String? format}) {
    return DateUtil.formatDate(this, format: format ?? 'yyyy-MM-dd');
  }

  bool isToday() {
    return isSameDay(DateTime.now());
  }

  bool isSameYear(DateTime dateTime) {
    return year == dateTime.year;
  }

  bool isSameMonth(DateTime dateTime) {
    return year == dateTime.year && month == dateTime.month;
  }

  bool isSameDay(DateTime dateTime) {
    return year == dateTime.year && month == dateTime.month && day == dateTime.day;
  }
}
