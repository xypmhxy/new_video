/*
* 作者 Ren
* 时间  2023/7/25 20:09
*/

extension DurationExtension on Duration {
  String toSimpleString() {
    var microseconds = inMicroseconds;

    var hours = microseconds ~/ Duration.microsecondsPerHour;
    microseconds = microseconds.remainder(Duration.microsecondsPerHour);
    var hoursPadding = hours < 10 && hours != 0 ? "0" : "";

    if (microseconds < 0) microseconds = -microseconds;

    var minutes = microseconds ~/ Duration.microsecondsPerMinute;
    microseconds = microseconds.remainder(Duration.microsecondsPerMinute);

    var minutesPadding = minutes < 10? "0" : "";

    var seconds = microseconds ~/ Duration.microsecondsPerSecond;
    microseconds = microseconds.remainder(Duration.microsecondsPerSecond);

    var secondsPadding = seconds < 10 ? "0" : "";

    var hour = hours.abs() <= 0 ? '' : '${hours.abs()}:';
    return "$hoursPadding$hour"
        "$minutesPadding$minutes:"
        "$secondsPadding$seconds";
  }
}
