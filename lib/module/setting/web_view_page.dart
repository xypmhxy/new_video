/*
* 作者 Ren
* 时间  2023/8/12 12:37
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/utils/page_navigation.dart';
import 'package:free_tube_player/widget/image_button.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String title;
  final String url;

  const WebViewPage({super.key, required this.url, required this.title});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final _webViewController = WebViewController();
  final _progress = 0.0.obs;

  @override
  void initState() {
    _webViewController.loadRequest(Uri.parse(widget.url));
    _webViewController.setNavigationDelegate(NavigationDelegate(onProgress: (progress) {
      _progress.value = progress / 100.0;
    }));
    super.initState();
  }

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
        title: TextView.primary(widget.title, fontWeight: FontWeight.bold, fontSize: 20, fontFamily: tubeFontFamily),
      ),
      body: Column(
        children: [_progressWidget(), _webView()],
      ),
    );
  }

  Widget _progressWidget() {
    return Obx(() => Visibility(
      visible: _progress.value < 1.0,
            child: LinearProgressIndicator(
          minHeight: 2,
          value: _progress.value,
        )));
  }

  Widget _webView() {
    return Expanded(child: WebViewWidget(controller: _webViewController));
  }
}
