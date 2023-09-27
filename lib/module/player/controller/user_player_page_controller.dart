import 'package:free_tube_player/api/play_api.dart';

class UserPlayerPageController {
  final _playApi = PlayApi();

  Future<void> requestRecommend(String youtubeId) async{
    _playApi.requestRecommend(youtubeId: youtubeId);
  }
}
