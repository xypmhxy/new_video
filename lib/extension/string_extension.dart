import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';

extension StringExtension on String {
  String toMd5() {
    Uint8List content = const Utf8Encoder().convert(this);
    Digest digest = md5.convert(content);
    return digest.toString();
  }

  String breakWord() {
    StringBuffer breakWord = StringBuffer();
    int index = 0;
    for (var element in runes) {
      if (index == 0) {
        breakWord.write(String.fromCharCode(element));
        index++;
        continue;
      }
      breakWord.write(String.fromCharCode(element));
      breakWord.write('\u200B');
    }
    return breakWord.toString();
  }

  bool isHttp(){
    return startsWith('http');
  }
}
