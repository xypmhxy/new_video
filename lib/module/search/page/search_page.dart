/*
* 作者 Ren
* 时间  2023/10/14 22:06
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/generated/assets.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/player/controller/user_player_controller.dart';
import 'package:free_tube_player/module/search/controller/search_page_controller.dart';
import 'package:free_tube_player/utils/page_navigation.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_button.dart';
import 'package:free_tube_player/widget/no_data_view.dart';
import 'package:free_tube_player/widget/refresh_header.dart';
import 'package:free_tube_player/widget/search_item.dart';
import 'package:free_tube_player/widget/svg_view.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchPageController = SearchPageController();

  @override
  void initState() {
    _searchPageController.focusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    _searchPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Height(16),
          _searchBar(),
          const Height(16),
          _content(),
        ],
      )),
    );
  }

  Widget _searchBar() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            _backButton(),
            const Width(16),
            _inputContainer(),
            const Width(4),
            _searchButton(),
          ],
        ));
  }

  Widget _backButton() {
    return ImageButton(
        onPressed: () {
          PageNavigation.back();
        },
        child: Icon(
          Icons.arrow_back_rounded,
          size: 26,
          color: AppThemeController.counterTextPrimaryColor(context),
        ));
  }

  Widget _inputContainer() {
    return Obx(() {
      final hasFocus = _searchPageController.hasFocus.value;
      return Expanded(
          child: Container(
        height: 55,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: hasFocus
                ? AppThemeController.primaryThemeColor(context).withOpacity(.1)
                : AppThemeController.onPrimaryColor(context),
            border: hasFocus ? Border.all(color: AppThemeController.primaryThemeColor(context)) : null,
            borderRadius: getBorderRadius(15)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 2),
              child: SVGView(
                assetName: Assets.svgHomeSearch,
                size: 22,
                color: hasFocus
                    ? AppThemeController.primaryThemeColor(context)
                    : AppThemeController.textAccentColor(context),
              ),
            ),
            const Width(8),
            _inputWidget()
          ],
        ),
      ));
    });
  }

  Widget _inputWidget() {
    return SizedBox(
      width: screenWidth * .4,
      child: TextField(
        textInputAction: TextInputAction.search,
        focusNode: _searchPageController.focusNode,
        controller: _searchPageController.textInputController,
        onSubmitted: (keyword) {
          _searchPageController.search(keyword);
        },
        onChanged: (keyword) {
          _searchPageController.getSearchSuggestion(keyword);
        },
        style:
            TextStyle(color: AppThemeController.textPrimaryColor(context), fontSize: 15, fontWeight: FontWeight.w500),
        decoration: const InputDecoration(isDense: true, contentPadding: EdgeInsets.zero, border: InputBorder.none),
      ),
    );
  }

  Widget _searchButton() {
    return TextButton(
        onPressed: () {
          _searchPageController.search(_searchPageController.textInputController.text);
        },
        child: TextView.primary(
          S.current.search,
          fontSize: 15,
        ));
  }

  Widget _content() {
    return Obx(() {
      Widget replacement = _searchHistory();
      if (_searchPageController.searchLoadState.value == ViewStatus.empty ||
          _searchPageController.searchLoadState.value == ViewStatus.failed) {
        return _searchFailed();
      } else if (_searchPageController.searchSuggestions.isNotEmpty) {
        replacement = _searchSuggestions();
      }
      return Visibility(
        visible: _searchPageController.searchLoadState.value != ViewStatus.none,
        replacement: replacement,
        child: _searchResult(),
      );
    });
  }

  Widget _searchHistory() {
    return Container(
      child: TextView.primary('搜索历史'),
    );
  }

  Widget _searchSuggestions() {
    return Expanded(
        child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (_, index) {
              final suggestion = _searchPageController.searchSuggestions[index];
              return GestureDetector(
                  onTap: () {
                    _searchPageController.search(suggestion);
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 38,
                    color: Colors.transparent,
                    child: TextView.primary(suggestion, fontSize: 14, maxLines: 1, overflow: TextOverflow.ellipsis),
                  ));
            },
            separatorBuilder: (_, index) {
              return const Height(4);
            },
            itemCount: _searchPageController.searchSuggestions.length));
  }

  Widget _searchResult() {
    return Expanded(
        child: Obx(() => SmartRefresher(
            controller: _searchPageController.refreshController,
            enablePullDown: true,
            enablePullUp: true,
            scrollDirection: Axis.vertical,
            header: const RefreshHeaderView(margin: 12),
            onRefresh: () {
              _searchPageController.search(_searchPageController.inputText.value);
            },
            onLoading: () {
              _searchPageController.searchMore();
            },
            child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (_, index) {
                  final mediaInfo = _searchPageController.searchResultList[index];
                  return GestureDetector(
                      onTap: () {
                        startUserPlayPage(mediaInfo: mediaInfo);
                      },
                      child: SearchItem(mediaInfo: mediaInfo));
                },
                separatorBuilder: (_, index) {
                  return const Height(12);
                },
                itemCount: _searchPageController.searchResultList.length))));
  }

  Widget _searchFailed() {
    return Container(
      margin: const EdgeInsets.only(top: 68),
      child: NoDataView(text: S.current.noData),
    );
  }
}
