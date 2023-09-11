/*
* 作者 Ren
* 时间  2023/9/10 20:51
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/app/resource/color_res.dart';
import 'package:free_tube_player/bean/home/youtube_home_tab.dart';
import 'package:free_tube_player/module/userHome/controller/user_youtube_child_controller.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_button.dart';
import 'package:free_tube_player/widget/image_view.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:get/get.dart';

class UserYoutubeChildPage extends StatefulWidget {
  final YoutubeHomeTab youtubeHomeTab;

  const UserYoutubeChildPage({super.key, required this.youtubeHomeTab});

  @override
  State<UserYoutubeChildPage> createState() => _UserYoutubeChildPageState();
}

class _UserYoutubeChildPageState extends State<UserYoutubeChildPage> {
  late UserYoutubeChildController youtubeController = UserYoutubeChildController(widget.youtubeHomeTab);

  @override
  void initState() {
    youtubeController.queryTabVideos(isForce: widget.youtubeHomeTab.isAll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.separated(
          itemBuilder: (_, index) {
            final mediaInfo = youtubeController.mediaInfos[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                        borderRadius: getBorderRadius(16),
                        child: ImageView.network(
                          imageUrl: mediaInfo.thumbnail ?? '',
                          height: screenWidth * 0.5,
                          width: screenWidth - 40,
                        )),
                    Positioned(
                        bottom: 10,
                        right: 10,
                        child: Container(
                          decoration: allRadiusDecoration(8, color: ColorRes.backgroundColor),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: TextView.primary(mediaInfo.durationFormat,
                              color: Colors.white, fontSize: 12, fontWeight: FontWeight.normal),
                        )),
                    Positioned(
                        bottom: 10,
                        left: 10,
                        child: Container(
                          decoration: allRadiusDecoration(8, color: ColorRes.backgroundColor),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: TextView.primary(mediaInfo.viewCountText ?? '',
                              fontSize: 12, color: Colors.white, fontWeight: FontWeight.normal),
                        )),
                  ],
                ),
                const Height(16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipOval(
                      child: ImageView.network(
                        imageUrl: mediaInfo.authorThumbnail ?? '',
                        size: 48,
                      ),
                    ),
                    const Width(12),
                    Expanded(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView.primary(
                          mediaInfo.title,
                          fontSize: 16,
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Height(4),
                        TextView.accent('${mediaInfo.author}  ·  ${mediaInfo.publishedTime}', fontSize: 12)
                      ],
                    )),
                    const Width(8),
                    ImageButton(
                        onPressed: () {},
                        splashRadius: 20,
                        child: const Icon(
                          Icons.more_vert_rounded,
                          size: 22,
                        ))
                  ],
                ),
              ],
            );
          },
          separatorBuilder: (_, index) {
            return const Height(20);
          },
          itemCount: youtubeController.mediaInfos.length);
    });
  }
}
