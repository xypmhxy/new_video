import 'package:flutter/material.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/bean/play/channel_info.dart';
import 'package:free_tube_player/firebase/firebase_event.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/channel/controller/channel_child_video_controller.dart';
import 'package:free_tube_player/module/player/controller/user_player_controller.dart';
import 'package:free_tube_player/widget/grid_video_item.dart';
import 'package:free_tube_player/widget/loading_view.dart';
import 'package:free_tube_player/widget/no_data_view.dart';
import 'package:get/get.dart';

class ChannelChildVideoPage extends StatefulWidget {
  final ChannelInfo channelInfo;

  const ChannelChildVideoPage({Key? key, required this.channelInfo}) : super(key: key);

  @override
  State<ChannelChildVideoPage> createState() => _ChannelChildVideoPageState();
}

class _ChannelChildVideoPageState extends State<ChannelChildVideoPage> with AutomaticKeepAliveClientMixin {
  final _controller = ChannelChildVideoController();

  @override
  void initState() {
    _controller.setup(widget.channelInfo);
    _controller.requestVideos();
    FirebaseEvent.instance.logEvent('channel_home_expose');
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Obx(() {
      if (_controller.viewStatus.value == ViewStatus.loading) {
        return const Center(
          child: LoadingView(),
        );
      } else if (_controller.viewStatus.value == ViewStatus.failed) {
        return Center(
          child: GestureDetector(
              onTap: () {
                _controller.requestVideos();
              },
              child: NoDataView(text: S.current.noDataClickRetry)),
        );
      }
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8, childAspectRatio: 1.1),
        itemBuilder: (_, index) {
          final mediaInfo = _controller.videos[index];
          return GridVideoItem(
            mediaInfo: mediaInfo,
            width: (screenWidth - 40) / 2,
            height: ((screenWidth - 40) / 2) * .5,
            onClickItem: () {
              startUserPlayPage(
                mediaInfo: mediaInfo,
                from: 'channel_video',
                channelInfo: widget.channelInfo,
              );
            },
            onClickMore: () {
              _controller.showMoreAction(mediaInfo);
            },
          );
        },
        itemCount: _controller.videos.length,
      );
    });
  }
}
