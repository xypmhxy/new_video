/*
* 作者 Ren
* 时间  2023/10/14 22:53
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/api/search_api.dart';
import 'package:free_tube_player/base/base_controller.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class SearchPageController extends BaseController {
  final focusNode = FocusNode();
  final hasFocus = false.obs;
  final textInputController = TextEditingController();
  final _youtubeExplode = YoutubeExplode();
  final _searchApi = SearchApi();
  final refreshController = RefreshController();
  final searchResultList = <MediaInfo>[].obs;
  final inputText = ''.obs;
  String? _continuation;

  SearchPageController() {
    focusNode.addListener(onFocusChange);
  }

  @override
  void dispose() {
    focusNode.removeListener(onFocusChange);
    super.dispose();
  }

  void onFocusChange() {
    hasFocus.value = focusNode.hasFocus;
  }

  Future<void> getSearchSuggestion(String keyword) async {
    inputText.value = textInputController.text.trim();
    // final aaa = await _youtubeExplode.search.getQuerySuggestions(keyword);
    // print('object');
  }

  Future<void> search(String keyword) async {
    _continuation = null;
    refreshController.requestRefresh(needCallback: false);
    final resultMediaInfo = await _searchApi.search(
        keyword: keyword,
        onContinuation: (continuation) {
          _continuation = continuation;
        });
    searchResultList.clear();
    searchResultList.addAll(resultMediaInfo);
    refreshController.refreshCompleted(resetFooterState: true);
  }

  Future<void> searchMore() async {
    final resultMediaInfo = await _searchApi.searchMore(
        continuation: _continuation,
        onContinuation: (continuation) {
          _continuation = continuation;
        });
    searchResultList.addAll(resultMediaInfo);
    refreshController.loadComplete();
  }
}
