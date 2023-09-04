/*
* 作者 Ren
* 时间  2023/8/31 07:23
*/
import 'package:free_tube_player/app/app_utils.dart';
import 'package:free_tube_player/base/base_controller.dart';
import 'package:free_tube_player/bean/tmdb/tmdb_info.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:tmdb_api/tmdb_api.dart';

class TMDBPageController extends BaseController {
  final TMDB_KEY = '8e8c2612011c6cc6268bd1c17398b738';
  final TMDB_TOKEN =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZThjMjYxMjAxMWM2Y2M2MjY4YmQxYzE3Mzk4YjczOCIsInN1YiI6IjY0ZWZjY2Y4OTdhNGU2MDBjNDg2NThiMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ctpO_m79ym3dazsOpcT1cN62ZieD9JD01CI5_89loGE';
  late final _tmdb = TMDB(ApiKeys(TMDB_KEY, TMDB_TOKEN));
  final tmdbInfos = <TMDBInfo>[].obs;
  final refreshController = RefreshController();
  int page = 1;

  @override
  dispose() {
    _tmdb.close();
    super.dispose();
  }

  Future<void> requestTrending({bool isRefresh = true}) async {
    if (isRefresh) {
      tmdbInfos.clear();
      page = 1;
    }
    final trendingMap = await _tmdb.v3.trending.getTrending(language: AppUtils.language, page: page);
    final results = trendingMap['results'] as List<dynamic>? ?? [];
    if (results.isEmpty) return;
    page++;
    for (final result in results) {
      final tmdbInfo = TMDBInfo.fromMap(result);
      tmdbInfo.backdropPath = _tmdb.images.getUrl(tmdbInfo.backdropPath) ?? '';
      tmdbInfo.posterPath = _tmdb.images.getUrl(tmdbInfo.posterPath) ?? '';
      tmdbInfos.add(tmdbInfo);
    }
    if (isRefresh) {
      refreshController.refreshCompleted(resetFooterState: true);
    } else {
      refreshController.loadComplete();
    }
  }
}
