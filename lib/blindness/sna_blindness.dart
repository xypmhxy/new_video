/*
* 作者 Ren
* 时间  2023/9/7 22:09
*/
import 'package:free_tube_player/blindness/base_blindness_info.dart';
import 'package:uuid/uuid.dart';

class SnaBlindness extends BaseBlindnessInfo {
  SnaBlindness(
      {required super.androidDeviceInfo, required super.gaid, required super.androidId, required super.operator});

  @override
  Map<String, dynamic> getParams() {
    return {
      'rooftop': Uri.encodeFull(const Uuid().v4()),
      'monies': Uri.encodeFull("${DateTime.now().millisecondsSinceEpoch}"),
      'catchup': Uri.encodeFull(androidDeviceInfo.model),
      'spite': Uri.encodeFull("com.snapmusi.mp3"),
      'cyprus': Uri.encodeFull(androidDeviceInfo.version.release),
      'tether': Uri.encodeFull(gaid ?? ""),
      'failsafe': Uri.encodeFull(androidId ?? ""),
      'binomial': Uri.encodeFull('low'),
      'vagabond': Uri.encodeFull(operator ?? ''),
      'wainscot': Uri.encodeFull(androidDeviceInfo.brand),
    };
  }

  @override
  String getUrl() {
    return 'https://armata.snapmusiapp.com/anabel/wool/piston/cookie';
  }

  @override
  String getResult() {
    return 'blomberg';
  }

  @override
  int getId() {
    return 1;
  }

  @override
  String getType(){
    return 'SnaBlindness';
  }
}
