/*
* 作者 Ren
* 时间  2023/9/10 08:59
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/app_utils.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/app/resource/color_res.dart';
import 'package:free_tube_player/generated/assets.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/search/page/search_page.dart';
import 'package:free_tube_player/module/userHome/controller/user_youtube_home_controller.dart';
import 'package:free_tube_player/module/userHome/page/user_youtube_child_page.dart';
import 'package:free_tube_player/utils/page_navigation.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_button.dart';
import 'package:free_tube_player/widget/image_view.dart';
import 'package:free_tube_player/widget/loading_view.dart';
import 'package:free_tube_player/widget/no_data_view.dart';
import 'package:free_tube_player/widget/svg_view.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:get/get.dart';

class UserYoutubeHome extends StatefulWidget {
  const UserYoutubeHome({super.key});

  @override
  State<UserYoutubeHome> createState() => _UserYoutubeHomeState();
}

class _UserYoutubeHomeState extends State<UserYoutubeHome> with AutomaticKeepAliveClientMixin {
  final youtubeController = Get.put(UserYoutubeHomeController());

  @override
  void initState() {
    youtubeController.requestTabs();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [const Height(24), _toolBar(), const Height(16), _tabContent()],
      )),
    );
  }

  Widget _toolBar() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            ImageView.asset(
              Assets.imagesThemeIcon128,
              size: 30,
            ),
            const Width(18),
            TextView.primary(AppUtils.appName, fontSize: 22, fontWeight: FontWeight.bold),
            Expanded(
                child: Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ImageButton(
                    onPressed: () {
                      PageNavigation.startNewPage(const SearchPage());
                    },
                    splashRadius: 24,
                    size: 26,
                    child:
                        SVGView(assetName: Assets.svgHomeSearch, color: AppThemeController.textPrimaryColor(context)),
                  ),
                  const Width(24),
                  ImageButton(
                    onPressed: () {
                      AppThemeController.get.toggleTheme();
                    },
                    splashRadius: 24,
                    size: 27.5,
                    child: SVGView(assetName: Assets.svgSetting, color: AppThemeController.textPrimaryColor(context)),
                  )
                ],
              ),
            ))
          ],
        ));
  }

  Widget _tabContent() {
    return Obx(() {
      Widget child = const Center(child: LoadingView());
      if (youtubeController.isLoading) {
        child = const Center(child: LoadingView());
      } else if (youtubeController.isEmpty) {
        child = Center(
            child: GestureDetector(
                onTap: () {
                  youtubeController.requestTabs();
                },
                child: NoDataView(text: S.current.noDataClickRetry)));
      } else {
        child = DefaultTabController(
            length: youtubeController.youtubeHomeTabs.length,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [_tabBar(), const Height(16), _tabView()],
              ),
            ));
      }
      return Expanded(child: child);
    });
  }

  Widget _tabBar() {
    return TabBar(
      tabs: youtubeController.youtubeHomeTabs.map((element) => Text(element.text)).toList(),
      isScrollable: true,
      indicatorSize: TabBarIndicatorSize.tab,
      splashBorderRadius: getBorderRadius(20),
      padding: EdgeInsets.zero,
      labelPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      unselectedLabelColor: AppThemeController.primaryThemeColor(context),
      labelColor: Colors.white,
      indicator: BoxDecoration(
          color: AppThemeController.primaryThemeColor(context),
          border: Border.all(color: AppThemeController.primaryThemeColor(context), width: 2),
          borderRadius: getBorderRadius(20)),
    );
  }

  Widget _tabView() {
    return Expanded(
        child: TabBarView(
      children:
          youtubeController.youtubeHomeTabs.map((element) => UserYoutubeChildPage(youtubeHomeTab: element)).toList(),
    ));
  }
}
