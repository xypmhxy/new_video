import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/bean/play/channel_info.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/channel/controller/channel_detail_controller.dart';
import 'package:free_tube_player/module/channel/page/channel_child_home_page.dart';
import 'package:free_tube_player/utils/page_navigation.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_button.dart';
import 'package:free_tube_player/widget/image_view.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:get/get.dart';

class ChannelDetailPage extends StatefulWidget {
  final ChannelInfo channelInfo;

  const ChannelDetailPage({Key? key, required this.channelInfo}) : super(key: key);

  @override
  State<ChannelDetailPage> createState() => _ChannelDetailPageState();
}

class _ChannelDetailPageState extends State<ChannelDetailPage> {
  final _channelController = ChannelDetailController();

  @override
  void initState() {
    _channelController.initChannelInfo(widget.channelInfo);
    // _channelController.requestDetail();
    super.initState();
  }

  @override
  void dispose() {
    _channelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [_appbar(), _tabContent()],
        ),
      ),
    );
  }

  Widget _appbar() {
    return AppBar(
      centerTitle: true,
      leading: ImageButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            PageNavigation.back();
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            size: 24,
          )),
      title: TextView.primary(widget.channelInfo.name, fontWeight: FontWeight.bold, fontSize: 18),
    );
  }

  Widget _tabContent() {
    return Expanded(
        child: DefaultTabController(
            length: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [_tabBar(), const Height(16), _tabView()],
              ),
            )));
  }

  Widget _tabBar() {
    return TabBar(
      tabs: [Text(S.current.home), Text(S.current.video)],
      isScrollable: false,
      indicatorSize: TabBarIndicatorSize.tab,
      padding: EdgeInsets.zero,
      labelPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      labelColor: AppThemeController.primaryThemeColor(context),
      unselectedLabelColor: Colors.white,
      indicatorColor: AppThemeController.primaryThemeColor(context),
    );
  }

  Widget _tabView() {
    return Expanded(
        child: TabBarView(
      children: [
        ChannelChildHomePage(channelInfo: widget.channelInfo),
        ChannelChildHomePage(channelInfo: widget.channelInfo)
      ],
    ));
  }
}
