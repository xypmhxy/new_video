import 'package:isar/isar.dart';

part 'search_history_info.g.dart';

@collection
class SearchHistoryInfo {
  Id id = Isar.autoIncrement;
  int createTime = 0;
  int updateTime = 0;
  String content = '';

  SearchHistoryInfo();

  SearchHistoryInfo.create({
    required this.createTime,
    required this.updateTime,
    required this.content,
  });
}
