/*
* 作者 Ren
* 时间  2023/8/31 07:23
*/
import 'package:free_tube_player/app/app_utils.dart';
import 'package:free_tube_player/base/base_controller.dart';
import 'package:free_tube_player/bean/tmdb/tmdb_info.dart';
import 'package:get/get.dart';
import 'package:tmdb_api/tmdb_api.dart';

class TMDBDetailPageController extends BaseController {
  final TMDB_KEY = '8e8c2612011c6cc6268bd1c17398b738';
  final TMDB_TOKEN =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZThjMjYxMjAxMWM2Y2M2MjY4YmQxYzE3Mzk4YjczOCIsInN1YiI6IjY0ZWZjY2Y4OTdhNGU2MDBjNDg2NThiMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ctpO_m79ym3dazsOpcT1cN62ZieD9JD01CI5_89loGE';
  late final _tmdb = TMDB(ApiKeys(TMDB_KEY, TMDB_TOKEN));
  final _tmdbInfo = TMDBInfo().obs;
  final tmdbInfos = <TMDBInfo>[].obs;

  TMDBInfo get tmdbInfo => _tmdbInfo.value;

  @override
  dispose() {
    _tmdb.close();
    tmdbInfos.clear();
    super.dispose();
  }

  Future<void> requestDetails(TMDBInfo tmdbInfo) async {
    _tmdbInfo.value = tmdbInfo;
    final detailMap = await _tmdb.v3.movies.getDetails(tmdbInfo.tmdbId, language: AppUtils.language);
    final genres = detailMap['genres'] as List<dynamic>? ?? [];
    for (final genre in genres) {
      final genreStr = genre['name'];
      _tmdbInfo.value.genres.add(genreStr);
    }
    final runTime = detailMap['runtime'] ?? 0;
    _tmdbInfo.value.runTime = runTime;
    _tmdbInfo.refresh();

    final castMap = await _tmdb.v3.movies.getCredits(tmdbInfo.tmdbId);
    final casts = castMap['cast'] as List<dynamic>? ?? [];
    for (final cast in casts) {
      final castInfo = Cast();
      String? name = cast['name'];
      name ??= cast['original_name'] ?? '???';
      castInfo.name = name!;

      final profilePath = cast['profile_path'] ?? '';
      if (profilePath != '') {
        final fullProfilePath = _tmdb.images.getUrl(profilePath) ?? '';
        castInfo.profilePath = fullProfilePath;
      }
      _tmdbInfo.value.casts.add(castInfo);
    }
    _tmdbInfo.refresh();

    tmdbInfos.clear();
    final videoMap = await _tmdb.v3.movies.getRecommended(tmdbInfo.tmdbId, language: AppUtils.language);
    final results = videoMap['results'] as List<dynamic>? ?? [];
    if (results.isEmpty) return;
    for (final result in results) {
      final tmdbInfo = TMDBInfo.fromMap(result);
      tmdbInfo.backdropPath = _tmdb.images.getUrl(tmdbInfo.backdropPath) ?? '';
      tmdbInfo.posterPath = _tmdb.images.getUrl(tmdbInfo.posterPath) ?? '';
      tmdbInfos.add(tmdbInfo);
    }
  }
}
