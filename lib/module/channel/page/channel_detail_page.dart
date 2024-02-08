import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/bean/play/channel_info.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/channel/controller/channel_detail_controller.dart';
import 'package:free_tube_player/module/channel/page/channel_child_home_page.dart';
import 'package:free_tube_player/module/channel/page/channel_child_video_page.dart';
import 'package:free_tube_player/utils/page_navigation.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_button.dart';
import 'package:free_tube_player/widget/loading_view.dart';
import 'package:free_tube_player/widget/no_data_view.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:get/get.dart';

class ChannelDetailPage extends StatefulWidget {
  final ChannelInfo channelInfo;

  const ChannelDetailPage({Key? key, required this.channelInfo}) : super(key: key);

  @override
  State<ChannelDetailPage> createState() => _ChannelDetailPageState();

  static startDetailPage(MediaInfo mediaInfo) {
    final channelInfo = ChannelInfo();
    channelInfo.name = mediaInfo.author;
    channelInfo.authorId = mediaInfo.authorId;
    channelInfo.bigAvatar = mediaInfo.authorThumbnail ?? '';
    PageNavigation.startNewPage(ChannelDetailPage(channelInfo: channelInfo),preventDuplicates: false);
  }
}

class _ChannelDetailPageState extends State<ChannelDetailPage> {
  final _channelController = ChannelDetailController();

  @override
  void initState() {
    _channelController.setupChannelInfo(widget.channelInfo);
    _channelController.requestChannelInfo();
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
          children: [_appbar(), _content()],
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

  Widget _content() {
    return Obx(() {
      if (_channelController.viewStatus.value == ViewStatus.loading) {
        return const Expanded(
            child: Center(
          child: LoadingView(),
        ));
      } else if (_channelController.viewStatus.value == ViewStatus.failed) {
        return Expanded(
            child: Center(
          child: GestureDetector(
              onTap: () {
                _channelController.requestChannelInfo();
              },
              child: NoDataView(text: S.current.noDataClickRetry)),
        ));
      }
      return _tabContent();
    });
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
        ChannelChildHomePage(channelInfo: _channelController.channelInfo.value),
        ChannelChildVideoPage(channelInfo: _channelController.channelInfo.value)
      ],
    ));
  }
}
