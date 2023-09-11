
import 'package:free_tube_player/ad/ad_member.dart';
import 'package:free_tube_player/ad/helper/ad_wrapper.dart';

class ADSituation {
  ADSituationType situationType = ADSituationType.none;
  ADWrapper? adWrapper;

  ADSituation(this.adWrapper, this.situationType);

  @override
  String toString() {
    return '$situationType -> ${adWrapper?.closeTime} -> ${adWrapper?.adPosition} -> ${adWrapper?.adSource} -> ${adWrapper?.adType}';
  }
}
