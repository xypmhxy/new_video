import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/extension/duration_extension.dart';

class TMDBInfo {
  int tmdbId = 0;
  String title = MediaInfo.defaultTitle;
  String originalTitle = MediaInfo.defaultTitle;
  String overview = '';
  String backdropPath = '';
  String posterPath = '';
  String? mediaType = 'movie';
  double popularity = 0.0;
  String releaseDate = '';
  bool video = false;
  double voteAverage = 0.0;
  int voteCount = 0;

  //detail api
  List<String> genres = [];
  int runTime = 0;

  //cast
  List<Cast> casts = [];

  TMDBInfo();

  TMDBInfo.fromMap(Map map) {
    tmdbId = map['id'] ?? 0;
    final titleTemp = map['title'];
    title = titleTemp ?? map['name'] ?? MediaInfo.defaultTitle;
    originalTitle = map['original_title'] ?? MediaInfo.defaultTitle;
    overview = map['overview'] ?? '';
    backdropPath = map['backdrop_path'] ?? '';
    posterPath = map['poster_path'] ?? '';
    mediaType = map['media_type'] ?? '';
    popularity = map['popularity'] ?? 0.0;
    releaseDate = map['release_date'] ?? '';
    video = map['video'] ?? false;
    voteAverage = map['vote_average'] ?? 0.0;
    voteCount = map['vote_count'] ?? 0;
  }

  String get score => voteAverage.toStringAsFixed(1);

  String get moveDuration => Duration(minutes: runTime).toSimpleString();
}

class Cast{
  String name = '';
  String profilePath = '';
}
