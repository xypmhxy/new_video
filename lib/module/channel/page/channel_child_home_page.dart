import 'package:flutter/material.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/app/resource/color_res.dart';
import 'package:free_tube_player/bean/play/channel_info.dart';
import 'package:free_tube_player/bean/play/media_info.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/helper/video_action_helper.dart';
import 'package:free_tube_player/module/channel/controller/channel_child_home_controller.dart';
import 'package:free_tube_player/module/player/controller/user_player_controller.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_view.dart';
import 'package:free_tube_player/widget/loading_view.dart';
import 'package:free_tube_player/widget/no_data_view.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:get/get.dart';

class ChannelChildHomePage extends StatefulWidget {
  final ChannelInfo channelInfo;

  const ChannelChildHomePage({Key? key, required this.channelInfo}) : super(key: key);

  @override
  State<ChannelChildHomePage> createState() => _ChannelChildHomePageState();
}

class _ChannelChildHomePageState extends State<ChannelChildHomePage> {
  final _pageController = ChannelChildHomeController();

  @override
  void initState() {
    _pageController.initChannelInfo(widget.channelInfo);
    _pageController.requestHomeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final viewStatus = _pageController.viewStatus.value;
      if (viewStatus == ViewStatus.loading) {
        return const Center(child: LoadingView());
      } else if (viewStatus == ViewStatus.failed) {
        return Center(
            child: NoDataView(
                text: S.current.noDataClickRetry,
                onClick: () {
                  _pageController.requestHomeData();
                }));
      }
      return _content();
    });
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
      height: 130,
      child: ListView.separated(
          addAutomaticKeepAlives: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final mediaInfo = mediaInfoList[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    startUserPlayPage(mediaInfo: mediaInfo, from: 'channel_home', channelInfo: channelInfo);
                  },
                  child: ClipRRect(
                      borderRadius: getBorderRadius(8),
                      child: Stack(
                        children: [
                          AutoImageView(
                            width: 144,
                            height: 86,
                            imageUrl: mediaInfo.thumbnail ?? '',
                          ),
                          Positioned(
                              bottom: 4,
                              right: 4,
                              child: Container(
                                decoration: allRadiusDecoration(8,
                                    color: mediaInfo.isLive ? ColorRes.themeColor : ColorRes.backgroundColor),
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                child: TextView.primary(mediaInfo.isLive ? S.current.live : mediaInfo.durationFormat,
                                    color: Colors.white, fontSize: 12, fontWeight: FontWeight.normal),
                              )),
                          if (mediaInfo.isLive == false &&
                              mediaInfo.historyProgress != null &&
                              mediaInfo.historyProgress! > 0)
                            Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: ClipRRect(
                                  borderRadius: getBorderRadius(2),
                                  child: LinearProgressIndicator(
                                    minHeight: 2,
                                    value: mediaInfo.historyProgress!,
                                    backgroundColor: Colors.black26,
                                  ),
                                ))
                        ],
                      )),
                ),
                const Height(4),
                SizedBox(
                  width: 144,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: TextView.primary(
                        mediaInfo.title,
                        fontSize: 13,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                      GestureDetector(
                        onTap: () {
                          _pageController.showMoreAction(mediaInfo);
                        },
                        child: Container(
                            color: Colors.transparent,
                            padding: const EdgeInsets.only(left: 4, right: 4, bottom: 8, top: 3),
                            child: const Icon(
                              Icons.more_vert_rounded,
                              color: Colors.white,
                              size: 16,
                            )),
                      )
                    ],
                  ),
                )
                // ConstrainedBox(
                //     constraints: const BoxConstraints(maxWidth: 144),
                //     child:)
              ],
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
