import 'package:free_tube_player/bean/search/search_history_info.dart';
import 'package:free_tube_player/db/database_manager.dart';
import 'package:isar/isar.dart';

class SearchHistoryInfoDao {
  final _isar = DatabaseManager.get.isar;

  Future<int> insert(SearchHistoryInfo searchHistoryInfo) {
    return _isar.writeTxn(() => _isar.searchHistoryInfos.put(searchHistoryInfo));
  }

  Future<SearchHistoryInfo?> querySearchHistory(String keyword) {
    return _isar.searchHistoryInfos.filter().contentEqualTo(keyword).findFirst();
  }

  Future<List<SearchHistoryInfo>> queryAll() {
    return _isar.searchHistoryInfos.where().sortByUpdateTimeDesc().findAll();
  }

  Future<bool> delete(int id) {
    return _isar.writeTxn(() => _isar.searchHistoryInfos.delete(id));
  }
}
