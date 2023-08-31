

/// 一些常用格式参照。可以自定义格式，例如："yyyy/MM/dd HH:mm:ss"，"yyyy/M/d HH:mm:ss"。
/// 格式要求
/// year -> yyyy/yy   month -> MM/M    day -> dd/d
/// hour -> HH/H      minute -> mm/m   second -> ss/s
class DateFormats {
  static String full = "yyyy-MM-dd HH:mm:ss";
  static String full_no_splite = "yyyyMMdd HHmmss";
  static String y_mo_d_h_m = "yyyy-MM-dd HH:mm";
  static String y_mo_d = "yyyy-MM-dd";
  static String y_mo = "yyyy-MM";
  static String mo_d = "MM-dd";
  static String mo_d_h_m = "MM-dd HH:mm";
  static String h_m_s = "HH:mm:ss";
  static String h_m = "HH:mm";
  static String zh_full = "yyyy年MM月dd日 HH时mm分ss秒";
  static String zh_y_mo_d_h_m = "yyyy年MM月dd日 HH时mm分";
  static String zh_y_mo_d = "yyyy年MM月dd日";
  static String zh_y_mo = "yyyy年MM月";
  static String zh_mo_d = "MM月dd日";
  static String zh_mo_d_h_m = "M月d日 HH时mm分";
  static String zh_h_m_s = "HH时mm分ss秒";
  static String zh_h_m = "HH时mm分";
  static String zh_m_d_en_h_m = "M月d日 HH:mm";

  static String sim_y_mo_d = "yyyy.MM.dd";
}

/// month->days.
Map<int, int> MONTH_DAY = {
  1: 31,
  2: 28,
  3: 31,
  4: 30,
  5: 31,
  6: 30,
  7: 31,
  8: 31,
  9: 30,
  10: 31,
  11: 30,
  12: 31,
};

/// Date Util.
class DateUtil {
  static const SECOND = 1000;
  static const MIN = SECOND * 60;
  static const HOUR = 60 * MIN;
  static const DAY = 24 * HOUR;

  /// get DateTime By DateStr.
  static DateTime getDateTime(String dateStr, {bool isUtc = false}) {
    DateTime? dateTime = DateTime.tryParse(dateStr);
    if (dateTime != null) {
      if (isUtc) {
        dateTime = dateTime.toUtc();
      } else {
        dateTime = dateTime.toLocal();
      }
    } else {
      dateTime = DateTime.now();
    }
    return dateTime;
  }

  /// get DateTime By Milliseconds.
  static DateTime getDateTimeByMs(int ms, {bool isUtc = false}) {
    return DateTime.fromMillisecondsSinceEpoch(ms, isUtc: isUtc);
  }

  /// get DateMilliseconds By DateStr.
  static int getDateMsByTimeStr(String dateStr) {
    DateTime? dateTime = DateTime.tryParse(dateStr);
    return dateTime == null
        ? DateTime.now().millisecondsSinceEpoch
        : dateTime.millisecondsSinceEpoch;
  }

  /// get Now Date Milliseconds.
  static int getNowDateMs() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  /// get Now Date Str.(yyyy-MM-dd HH:mm:ss)
  static String getNowDateStr() {
    return formatDate(DateTime.now());
  }

  /// format date by milliseconds.
  /// milliseconds 日期毫秒
  static String formatDateMs(int ms, {bool isUtc = false, String? format}) {
    return formatDate(getDateTimeByMs(ms, isUtc: isUtc), format: format);
  }

  /// format date by date str.
  /// dateStr 日期字符串
  static String formatDateStr(String dateStr,
      {bool isUtc = false, String? format}) {
    return formatDate(getDateTime(dateStr, isUtc: isUtc), format: format);
  }

  static String formatNowDate({String? format}) {
    return formatDate(DateTime.now(), format: format);
  }

  /// format date by DateTime.
  /// format 转换格式(已提供常用格式 DataFormats，可以自定义格式："yyyy/MM/dd HH:mm:ss")
  /// 格式要求
  /// year -> yyyy/yy   month -> MM/M    day -> dd/d
  /// hour -> HH/H      minute -> mm/m   second -> ss/s
  static String formatDate(DateTime? dateTime, {String? format}) {
    if (dateTime == null) return "";
    format = format ?? DateFormats.full;
    if (format.contains("yy")) {
      String year = dateTime.year.toString();
      if (format.contains("yyyy")) {
        format = format.replaceAll("yyyy", year);
      } else {
        format = format.replaceAll(
            "yy", year.substring(year.length - 2, year.length));
      }
    }

    format = _comFormat(dateTime.month, format, 'M', 'MM');
    format = _comFormat(dateTime.day, format, 'd', 'dd');
    format = _comFormat(dateTime.hour, format, 'H', 'HH');
    format = _comFormat(dateTime.minute, format, 'm', 'mm');
    format = _comFormat(dateTime.second, format, 's', 'ss');
    format = _comFormat(dateTime.millisecond, format, 'S', 'SSS');

    return format;
  }

  /// com format.
  static String _comFormat(
      int value, String format, String single, String full) {
    if (format.contains(single)) {
      if (format.contains(full)) {
        format =
            format.replaceAll(full, value < 10 ? '0$value' : value.toString());
      } else {
        format = format.replaceAll(single, value.toString());
      }
    }
    return format;
  }

  /// get WeekDay.
  /// dateTime
  /// isUtc
  /// languageCode zh or en
  /// short
  static String getWeekday(DateTime dateTime,
      {String? languageCode, bool short = true}) {
    languageCode = languageCode ?? "zh";
    String weekday;
    switch (dateTime.weekday) {
      case 1:
        weekday = languageCode == 'zh' ? '星期一' : "Monday";
        break;
      case 2:
        weekday = languageCode == 'zh' ? '星期二' : "Tuesday";
        break;
      case 3:
        weekday = languageCode == 'zh' ? '星期三' : "Wednesday";
        break;
      case 4:
        weekday = languageCode == 'zh' ? '星期四' : "Thursday";
        break;
      case 5:
        weekday = languageCode == 'zh' ? '星期五' : "Friday";
        break;
      case 6:
        weekday = languageCode == 'zh' ? '星期六' : "Saturday";
        break;
      case 7:
        weekday = languageCode == 'zh' ? '星期日' : "Sunday";
        break;
      default:
        weekday = languageCode == 'zh' ? '未知' : "Unknown";
        break;
    }
    return languageCode == 'zh'
        ? (short ? weekday.replaceAll('星期', '周') : weekday)
        : weekday.substring(0, short ? 3 : weekday.length);
  }

  /// get WeekDay By Milliseconds.
  static String getWeekdayByMs(int milliseconds,
      {bool isUtc = false, String? languageCode, bool short = false}) {
    DateTime dateTime = getDateTimeByMs(milliseconds, isUtc: isUtc);
    return getWeekday(dateTime, languageCode: languageCode, short: short);
  }

  /// get day of year.
  /// 在今年的第几天.
  static int getDayOfYear(DateTime dateTime) {
    int year = dateTime.year;
    int month = dateTime.month;
    int days = dateTime.day;
    for (int i = 1; i < month; i++) {
      days = days + MONTH_DAY[i]!;
    }
    if (isLeapYearByYear(year) && month > 2) {
      days = days + 1;
    }
    return days;
  }

  /// get day of year.
  /// 在今年的第几天.
  static int getDayOfYearByMs(int ms, {bool isUtc = false}) {
    return getDayOfYear(DateTime.fromMillisecondsSinceEpoch(ms, isUtc: isUtc));
  }

  /// is today.
  /// 是否是当天.
  static bool isToday(int milliseconds, {bool isUtc = false, int? locMs}) {
    if (milliseconds == 0) return false;
    DateTime old =
    DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: isUtc);
    DateTime now;
    if (locMs != null) {
      now = DateUtil.getDateTimeByMs(locMs);
    } else {
      now = isUtc ? DateTime.now().toUtc() : DateTime.now().toLocal();
    }
    return old.year == now.year && old.month == now.month && old.day == now.day;
  }

  /// is yesterday by dateTime.
  /// 是否是昨天.
  static bool isYesterday(DateTime dateTime, DateTime locDateTime) {
    if (yearIsEqual(dateTime, locDateTime)) {
      int spDay = getDayOfYear(locDateTime) - getDayOfYear(dateTime);
      return spDay == 1;
    } else {
      return ((locDateTime.year - dateTime.year == 1) &&
          dateTime.month == 12 &&
          locDateTime.month == 1 &&
          dateTime.day == 31 &&
          locDateTime.day == 1);
    }
  }

  /// is yesterday by millis.
  /// 是否是昨天.
  static bool isYesterdayByMs(int ms, int locMs) {
    return isYesterday(DateTime.fromMillisecondsSinceEpoch(ms),
        DateTime.fromMillisecondsSinceEpoch(locMs));
  }

  /// is Week.
  /// 是否是本周.
  static bool isThisWeek(int ms, {bool isUtc = false, int? locMs}) {
    return isSameWeek(getDateTimeByMs(ms, isUtc: isUtc), 0);
  }

  static bool isNextWeek(DateTime dateTime, {bool isUtc = false, int? locMs}) {
    return isSameWeek(dateTime, 1);
  }

  static bool isSameWeek(DateTime dateTime, int whichWeek) {
    var dateTimeList = getWeeksDate(whichWeek);
    var monDateTime = dateTimeList.first;
    var sunDateTime = dateTimeList.last;
    return dateTime.millisecondsSinceEpoch >=
        monDateTime.millisecondsSinceEpoch &&
        dateTime.millisecondsSinceEpoch <= sunDateTime.millisecondsSinceEpoch;
  }

  /// year is equal.
  /// 是否同年.
  static bool yearIsEqual(DateTime dateTime, DateTime locDateTime) {
    return dateTime.year == locDateTime.year;
  }

  /// year is equal.
  /// 是否同年.
  static bool yearIsEqualByMs(int ms, int locMs) {
    return yearIsEqual(DateTime.fromMillisecondsSinceEpoch(ms),
        DateTime.fromMillisecondsSinceEpoch(locMs));
  }

  /// Return whether it is leap year.
  /// 是否是闰年
  static bool isLeapYear(DateTime dateTime) {
    return isLeapYearByYear(dateTime.year);
  }

  /// Return whether it is leap year.
  /// 是否是闰年
  static bool isLeapYearByYear(int year) {
    return year % 4 == 0 && year % 100 != 0 || year % 400 == 0;
  }

  /// 获取过去一天
  static DateTime getYesterday() {
    return DateTime.now().subtract(const Duration(days: 1));
  }

  /// 获取过去一周
  static DateTime getLastWeek() {
    return DateTime.now().subtract(const Duration(days: 7));
  }

  /// 根据小时分钟获取某天的时间 12:30
  static DateTime getDateTimeByHourMin(String hourMin,{DateTime? dateTime}) {
    var listString = hourMin.split(":");
    var hour = int.tryParse(listString.first) ?? 1;
    var min = int.tryParse(listString.last) ?? 1;
    var curDateTime = dateTime ?? DateTime.now();
    return DateTime(
        curDateTime.year, curDateTime.month, curDateTime.day, hour, min);
  }

  /// 根据小时分钟获取当天的时间 12:30
  // static DateTime getDateTimeByHourMin(String hourMin) {
  //   var listString = hourMin.split(":");
  //   var hour = int.tryParse(listString.first) ?? 1;
  //   var min = int.tryParse(listString.last) ?? 1;
  //   var curDateTime = DateTime.now();
  //   return DateTime(
  //       curDateTime.year, curDateTime.month, curDateTime.day, hour, min);
  // }

  /// 根据小时分钟获取当天的时间
  static DateTime getDateTimeByHourAndMin(String hour, String min) {
    return getDateTimeByHourMin("$hour:$min");
  }

  /// 获取目标时间00:00时间
  static DateTime getDayZero(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  /*
   * 获取某一年的第一个月的第一天和最后一个月的最后一天
   */
  static getStartEndYearDate(int iYear) {
    Map mapDate = {};
    int yearNow = DateTime.now().year;
    yearNow = yearNow + iYear;

    String newStartYear = '$yearNow-01-01';
    String newEndYear = '${yearNow + 1}-01-00';

    mapDate['startTime'] = DateUtil.formatDate(
        DateTime.fromMillisecondsSinceEpoch(parseDateStr(newStartYear)),
        format: 'yyyy-MM-dd');
    mapDate['endTime'] = DateUtil.formatDate(
        DateTime.fromMillisecondsSinceEpoch(parseDateStr(newEndYear)),
        format: 'yyyy-MM-dd');

    mapDate['startStamp'] = parseDateStr(mapDate['startTime'] + ' 00:00:00');
    mapDate['endStamp'] = parseDateStr(mapDate['endTime'] + ' 23:59:59');
  }

  /*
   * 获得当前日期 未来/过去 第某个月第一天和最后一天时间
   */
  static void getMonthDate(int iMonth) {
    //获取当前日期
    var currentDate = DateTime.now();
    if (iMonth + currentDate.month > 0) {
      timeConversion(iMonth + currentDate.month, (currentDate.year).toString());
    } else {
      int beforeYear = (iMonth + currentDate.month) ~/ 12;
      String yearNew = (currentDate.year + beforeYear - 1).toString();
      int monthNew = (iMonth + currentDate.month) - beforeYear * 12;
      timeConversion(12 + monthNew, yearNew);
    }
  }

  /*
   * 过去未来某个月初月末
   */
  static void timeConversion(int monthTime, String yearTime) {
    Map<String, String> dateMap = {};
    dateMap['startDate'] =
    '$yearTime-${monthTime < 10 ? '0$monthTime' : '$monthTime'}-01';
    //转时间戳再转时间格式 防止出错
    dateMap['startDate'] = DateUtil.formatDate(
        DateTime.fromMillisecondsSinceEpoch(
            parseDateStr(dateMap['startDate']!)),
        format: 'yyyy-MM-dd');
    //某个月结束时间，转时间戳再转
    String endMonth =
        '$yearTime-${(monthTime + 1) < 10 ? '0${monthTime + 1}' : (monthTime + 1)}-00';
    var endMonthTimeStamp = parseDateStr(endMonth);
    endMonth = DateUtil.formatDate(
        DateTime.fromMillisecondsSinceEpoch(endMonthTimeStamp),
        format: 'yyyy-MM-dd');
    dateMap['endDate'] = endMonth;
    //这里是为了公司后台接口 需加时间段的时间戳 但不显示在格式化实践中
    dateMap['startDateStamp'] =
        parseDateStr('${dateMap['startDate']!} 00:00:00').toString();
    dateMap['endDateStamp'] =
        parseDateStr('${dateMap['endDate']!} 23:59:59').toString();
  }

  /*
   * 转时间戳
   */
  static int parseDateStr(String timestamp) {
    return DateTime.parse(timestamp).millisecondsSinceEpoch;
  }

  /*
   * 当前时间 过去/未来 某个周的周一和周日
   */
  static List<DateTime> getWeeksDate(int weeks) {
//    Map<String, String> mapTime = new Map();
    DateTime now = DateTime.now();
    int weekday = now.weekday; //今天周几

    var sunDay = getTimestampLatest(false, 7 - weekday + weeks * 7); //周末
    var monDay = getTimestampLatest(true, -weekday + 1 + weeks * 7); //周一
    var monDateTime = DateUtil.getDateTimeByMs(monDay);
    var sunDateTime = DateUtil.getDateTimeByMs(sunDay);
    List<DateTime> dateTimes = [monDateTime, sunDateTime];
    return dateTimes;
  }

  /*
   * phase : 是零点还是23:59:59
   */
  static int getTimestampLatest(bool phase, int day) {
    String newHours;
    DateTime now = DateTime.now();
    DateTime sixtyDaysFromNow = now.add(Duration(days: day));
    String formattedDate =
    DateUtil.formatDate(sixtyDaysFromNow, format: 'yyyy-MM-dd');
    if (phase) {
      newHours = '$formattedDate 00:00:00';
    } else {
      newHours = '$formattedDate 23:59:59';
    }

    DateTime newDate = DateTime.parse(newHours);
    int timeStamp = newDate.millisecondsSinceEpoch;
    // print('时间' + newFormattedDate);
    return timeStamp;
  }

/*
  * 获取当前日期农历 辛丑年 七月廿四
   */
// static String getCurrentFullLunar({String splitChart = " "}) {
//   var dateTime = DateTime.now();
//   var cnYear = LunarUtil.cyclicalm(dateTime.year);
//   var cnMonth =
//       LunarUtil.monthToChineseMonth(month: dateTime.month, day: dateTime.day);
//   var cnDay =
//       LunarUtil.dayToChinese(month: dateTime.month, day: dateTime.day);
//   return "$cnYear年$splitChart$cnMonth$splitChart$cnDay";
// }
}