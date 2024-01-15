/*
* 作者 Ren
* 时间  2024/1/13 10:58
*/

import 'package:flutter/material.dart';
import 'package:free_tube_player/ad/helper/ad_manager.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/text_view.dart';

class SettingDebugPage extends StatefulWidget {
  const SettingDebugPage({super.key});

  @override
  State<SettingDebugPage> createState() => _SettingDebugPageState();
}

class _SettingDebugPageState extends State<SettingDebugPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView(padding: const EdgeInsets.all(16), children: [
      const Height(16),
      ElevatedButton(
          onPressed: () {
            ADManager.instance.showAdmobInspector();
          },
          child: const TextView.primary('Admob调试', fontSize: 16)),
      TextView.primary('广告参数: ${ADManager.instance.adTextPrint}', fontSize: 16),
    ])));
  }
}
