import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/download/page/downloaded_page_view.dart';
import 'package:free_tube_player/module/download/page/downloading_page_view.dart';
import 'package:free_tube_player/utils/page_navigation.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_button.dart';
import 'package:free_tube_player/widget/text_view.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({Key? key}) : super(key: key);

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _appbar(),
            Expanded(
                child: DefaultTabController(
              length: 2,
              child: Column(
                children: [const Height(12), _tabBar(), const Height(16), _tabBarView()],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget _appbar() {
    return AppBar(
      leading: ImageButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            PageNavigation.back();
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            size: 24,
          )),
      title: TextView.primary(S.current.download, fontWeight: FontWeight.bold, fontSize: 18),
    );
  }

  Widget _tabBar() {
    return TabBar(
      tabs: [Text(S.current.downloading), Text(S.current.downloaded)],
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: AppThemeController.primaryThemeColor(context),
      indicatorWeight: 3,
      labelPadding: const EdgeInsets.only(bottom: 12),
      unselectedLabelColor: AppThemeController.textPrimaryColor(context),
      labelColor: AppThemeController.primaryThemeColor(context),
      labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      unselectedLabelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    );
  }

  Widget _tabBarView() {
    return const Expanded(
        child: TabBarView(children: [
      DownloadingPageView(),
      DownloadedPageView(),
    ]));
  }
}
