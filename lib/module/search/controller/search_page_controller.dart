/*
* 作者 Ren
* 时间  2023/10/14 22:53
*/
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:free_tube_player/ad/ad_utils.dart';
import 'package:free_tube_player/api/search_api.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/base/base_controller.dart';
import 'package:free_tube_player/bean/home/youtube_home_tab.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/bean/search/search_history_info.dart';
import 'package:free_tube_player/db/dao/search_history_info_dao.dart';
import 'package:free_tube_player/firebase/firebase_event.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/helper/video_action_helper.dart';
import 'package:free_tube_player/module/player/controller/recommend_controller.dart';
import 'package:free_tube_player/module/userHome/controller/user_youtube_home_controller.dart';
import 'package:free_tube_player/utils/date_utils.dart';
import 'package:free_tube_player/utils/rate_utils.dart';
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
  final searchHistoryList = <SearchHistoryInfo>[].obs;
  final searchResultList = <MediaInfo>[].obs;
  final searchSuggestions = <String>[].obs;
  final inputText = ''.obs;
  final searchLoadState = ViewStatus.none.obs;
  final _searchHistoryDao = SearchHistoryInfoDao();
  final _videoActionHelper = VideoActionHelper();
  final _recommendController = RecommendController();
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

  Future<void> getSearchHistoryList() async {
    final searchHistoryList = await _searchHistoryDao.queryAll();
    this.searchHistoryList.clear();
    this.searchHistoryList.addAll(searchHistoryList);
  }

  Future<void> getSearchSuggestion(String keyword) async {
    inputText.value = keyword.trim();
    final suggestions = await _youtubeExplode.search.getQuerySuggestions(keyword);
    searchSuggestions.clear();
    searchSuggestions.addAll(suggestions);
    if (suggestions.isNotEmpty && searchLoadState.value != ViewStatus.loading) {
      searchLoadState.value = ViewStatus.none;
    }
  }

  Future<void> search(String keyword) async {
    ADUtils.instance.showPlaylistAD();
    FirebaseEvent.instance.logEvent('search_click', params: {'value': keyword});
    textInputController.text = keyword;
    inputText.value = keyword;
    _updateSearchHistory(keyword);
    focusNode.unfocus();
    searchLoadState.value = ViewStatus.loading;
    await Future.delayed(const Duration(milliseconds: 500));
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
    if (resultMediaInfo.isEmpty) {
      searchLoadState.value = ViewStatus.empty;
    } else {
      searchLoadState.value = ViewStatus.success;
      RateUtils.recordAction();
      requestRecommend(keyword);
    }
    FirebaseEvent.instance.logEvent('search_complete');
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

  Future<void> _updateSearchHistory(String keyword) async {
    var searchHistory = await _searchHistoryDao.querySearchHistory(keyword);
    final nowDate = DateUtil.getNowDateMs();
    if (searchHistory == null) {
      searchHistory = SearchHistoryInfo();
      searchHistory.createTime = nowDate;
    }
    searchHistory.updateTime = nowDate;
    searchHistory.content = keyword;
    await _searchHistoryDao.insert(searchHistory);
    getSearchHistoryList();
  }

  Future<void> deleteSearchHistory(SearchHistoryInfo searchHistoryInfo) async {
    await _searchHistoryDao.delete(searchHistoryInfo.id);
    getSearchHistoryList();
  }

  Future<void> showMoreActionDialog(MediaInfo mediaInfo) async {
    _videoActionHelper.showActionDialog(mediaInfo: mediaInfo, from: 'search');
  }

  Future<void> requestRecommend(String keyword) async {
    if (Get.isRegistered<UserYoutubeHomeController>() == false) return;
    final userYoutubeHomeController = Get.find<UserYoutubeHomeController>();
    final sameRecommend =
        userYoutubeHomeController.youtubeHomeTabs.firstWhereOrNull((element) => element.text == keyword);
    if (sameRecommend != null) return;

    final random = Random.secure().nextInt(searchResultList.length >= 5 ? 5 : searchResultList.length);
    final randomVideo = searchResultList[random];
    if (randomVideo.youtubeId == null) return;
    await _recommendController.requestRecommend(randomVideo.youtubeId!);
    if (_recommendController.recommendVideos.isEmpty) return;

    int index = userYoutubeHomeController.youtubeHomeTabs.indexWhere((element) => element.isSearchRecommend);
    index = index == -1 ? 1 : index;
    final youtubeHomeTab = YoutubeHomeTab(
      text: keyword,
      continuation: '',
      clickParams: '',
      isSearchRecommend: true,
    );
    youtubeHomeTab.mediaInfos = _recommendController.recommendVideos;
    userYoutubeHomeController.youtubeHomeTabs.insert(index, youtubeHomeTab);
  }
}
