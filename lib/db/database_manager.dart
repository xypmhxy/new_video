/*
* 作者 Ren
* 时间  2023/8/1 07:42
*/

import 'dart:io';

import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/bean/play/playlist.dart';
import 'package:free_tube_player/bean/play/playlist_wrapper.dart';
import 'package:free_tube_player/bean/search/search_history_info.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseManager {
  static final get = DatabaseManager._();

  DatabaseManager._();

  Isar? _isar;

  Isar get isar => _isar!;

  Future<void> setup() async {
    if (Isar.instanceNames.isNotEmpty) return;
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open([
      MediaInfoSchema,
      SearchHistoryInfoSchema,
      PlaylistSchema,
      PlaylistWrapperSchema,
    ], directory: dir.path, maxSizeMiB: 512);
  }
}
