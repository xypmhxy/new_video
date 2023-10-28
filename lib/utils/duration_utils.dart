/*
* 作者 Ren
* 时间  2023/10/15 16:41
*/

class DurationUtils{
  static int parseDurationText(String durationText){
    int duration = 0;
    if (durationText.contains(':')) {
      final durationList = durationText.split(':');
      int hour = 0;
      if (durationList.length >= 3) {
        hour = int.tryParse(durationList[0]) ?? 0;
        int min = int.tryParse(durationList[1]) ?? 0;
        int second = int.tryParse(durationList[2]) ?? 0;
        duration = Duration(hours: hour, minutes: min, seconds: second).inMilliseconds;
      } else {
        int min = int.tryParse(durationList[0]) ?? 0;
        int second = int.tryParse(durationList[1]) ?? 0;
        duration = Duration(hours: hour, minutes: min, seconds: second).inMilliseconds;
      }
    }
    return duration;
  }
}