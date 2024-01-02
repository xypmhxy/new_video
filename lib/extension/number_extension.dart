/*
* 作者 Ren
* 时间  2023/10/15 16:55
*/

extension NumberExtension on num {
  String parseUnit() {
    if (this >= 1000000) {
      final kNum = this / 1000000.0;
      return '${kNum.toStringAsFixed(1)}M';
    } else if (this >= 1000) {
      final kNum = this / 1000.0;
      return '${kNum.toStringAsFixed(1)}K';
    }
    return '$this';
  }

  String parse2Percent({int fractionDigits = 1}) {
    final percent = this * 100;
    return '${percent.toStringAsFixed(fractionDigits)}%';
  }

  String formatSpeedSize({int fractionDigits = 1}) {
    final size = this;
    if (size == 0) return '0KB';
    final sizeKB = size / 1024;
    if (sizeKB < 1024) {
      return '${sizeKB.toStringAsFixed(fractionDigits)}KB';
    }

    final sizeMB = sizeKB / 1024;
    if (sizeMB < 1024) {
      return '${sizeMB.toStringAsFixed(fractionDigits)}MB';
    }

    final sizeGB = sizeMB / 1024;
    return '${sizeGB.toStringAsFixed(fractionDigits)}G';
  }

}
