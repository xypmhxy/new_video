/*
* 作者 Ren
* 时间  2023/8/1 07:42
*/

import 'dart:io';

import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseManager {
  static final get = DatabaseManager._();

  DatabaseManager._();

  Isar? _isar;

  Isar get isar => _isar!;

  Future<void> setup() async {
    if (_isar != null && _isar!.isOpen) {
      return;
    }
    final dir = await getApplicationDocumentsDirectory();
    final dbDirPath = '${dir.path}/db';
    final dirDir = Directory(dbDirPath);
    if (!dirDir.existsSync()) {
      dirDir.createSync();
    }
    _isar = await Isar.open(
      [MediaInfoSchema],
      directory: '${dir.path}/db',
    );
  }
}
