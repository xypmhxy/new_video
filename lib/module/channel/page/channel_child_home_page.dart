import 'package:flutter/material.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/bean/play/channel_info.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/channel/controller/channel_child_home_controller.dart';
import 'package:free_tube_player/module/player/controller/user_player_controller.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/grid_video_item.dart';
import 'package:free_tube_player/widget/image_view.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:get/get.dart';

class ChannelChildHomePage extends StatefulWidget {
  final ChannelInfo channelInfo;

  const ChannelChildHomePage({Key? key, required this.channelInfo}) : super(key: key);

  @override
  State<ChannelChildHomePage> createState() => _ChannelChildHomePageState();
}

class _ChannelChildHomePageState extends State<ChannelChildHomePage> with AutomaticKeepAliveClientMixin {
  final _pageController = ChannelChildHomeController();

  @override
  void initState() {
    _pageController.setupChannelInfo(widget.channelInfo);
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _content();
  }

  Widget _content() {
    return Column(
      children: [_avatar(), const Height(12), _listView()],
    );
  }

  Widget _avatar() {
    return Row(
      children: [
        ClipOval(
          child: ImageView.network(imageUrl: channelInfo.avatar, size: 68),
        ),
        const Width(12),
        Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: screenWidth * .7),
            child: TextView.primary(
              channelInfo.name,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Height(4),
          TextView.accent(
            '${channelInfo.subscribeCount}  ·  ${S.current.paramsVideos(channelInfo.videoCountText)}',
            fontSize: 12,
          )
        ])
      ],
    );
  }

  Widget _listView() {
    return Expanded(
        child: ListView.separated(
            itemBuilder: (_, index) {
              final title = channelInfo.authorVideoGroups[index].title;
              final mediaInfoList = channelInfo.authorVideoGroups[index].mediaInfos;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView.primary(title, fontSize: 16, fontWeight: FontWeight.bold),
                  const Height(12),
                  _childListView(mediaInfoList)
                ],
              );
            },
            separatorBuilder: (_, index) {
              return const Height(12);
            },
            itemCount: channelInfo.authorVideoGroups.length));
  }

  Widget _childListView(List<MediaInfo> mediaInfoList) {
    return SizedBox(
      height: 145,
      child: ListView.separated(
          addAutomaticKeepAlives: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final mediaInfo = mediaInfoList[index];
            return GridVideoItem(
              mediaInfo: mediaInfo,
              onClickItem: () {
                startUserPlayPage(mediaInfo: mediaInfo, from: 'channel_home', channelInfo: channelInfo);
              },
              onClickMore: () {
                _pageController.showMoreAction(mediaInfo);
              },
            );
          },
          separatorBuilder: (_, index) {
            return const Width(12);
          },
          itemCount: mediaInfoList.length),
    );
  }

  ChannelInfo get channelInfo => _pageController.channelInfo.value;
}
