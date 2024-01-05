/*
* 作者 Ren
* 时间  2023/8/12 12:16
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/app_utils.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/history/page/history_page.dart';
import 'package:free_tube_player/module/setting/web_view_page.dart';
import 'package:free_tube_player/utils/page_navigation.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_button.dart';
import 'package:free_tube_player/widget/text_view.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ImageButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            PageNavigation.back();
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            size: 26,
          ),
        ),
        title:
            TextView.primary(S.current.setting, fontWeight: FontWeight.bold, fontSize: 20, fontFamily: tubeFontFamily),
      ),
      body: Column(
        children: [
          const Height(8),
          _item(Icons.file_copy_outlined, S.current.privacy, onPressed: () {
            PageNavigation.startNewPage(WebViewPage(url: AppUtils.privacyUrl, title: S.current.privacy));
          }),
          _item(Icons.person_outline_rounded, S.current.userAgreement, onPressed: () {
            PageNavigation.startNewPage(WebViewPage(url: AppUtils.userUrl, title: S.current.privacy));
          }),
          _item(Icons.history_rounded, S.current.history, onPressed: () {
            PageNavigation.startNewPage(const HistoryPage());
          }),
          _switchItem(Icons.dark_mode_outlined, S.current.darkMode, onPressed: () async {
            AppThemeController.get.toggleTheme();
            setState(() {});
          })
        ],
      ),
    );
  }

  Widget _item(IconData iconData, String title, {VoidCallback? onPressed}) {
    return InkWell(
        onTap: onPressed,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 56,
            color: Colors.transparent,
            child: Row(children: [
              Icon(iconData, size: 22),
              const Width(12),
              TextView.primary(title, fontSize: 15, fontFamily: tubeFontFamily)
            ])));
  }

  Widget _switchItem(IconData iconData, String title, {VoidCallback? onPressed}) {
    return InkWell(
      onTap: () {
        onPressed?.call();
      },
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 56,
          color: Colors.transparent,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Icon(iconData, size: 22),
            const Width(12),
            TextView.primary(title, fontSize: 15, fontFamily: tubeFontFamily),
            Expanded(
                child: Align(
              alignment: Alignment.centerRight,
              child: IgnorePointer(
                  child: CupertinoSwitch(
                      value: AppThemeController.isDark(context),
                      activeColor: AppThemeController.primaryThemeColor(context),
                      onChanged: (value) {})),
            ))
          ])),
    );
  }
}
