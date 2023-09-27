/*
* 作者 Ren
* 时间  2023/9/13 07:49
*/
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/module/player/controller/player_controller.dart';
import 'package:free_tube_player/module/player/controller/user_player_page_controller.dart';
import 'package:free_tube_player/widget/image_view.dart';
import 'package:free_tube_player/widget/loading_view.dart';
import 'package:get/get.dart';

class UserPlayerPage extends StatefulWidget {
  const UserPlayerPage({super.key});

  @override
  State<UserPlayerPage> createState() => _UserPlayerPageState();
}

class _UserPlayerPageState extends State<UserPlayerPage> {
  final _userPlayerPageController = UserPlayerPageController();

  @override
  void initState() {
    _userPlayerPageController.requestRecommend(userPlayerController.nowPlayingMedia?.youtubeId ?? '');
    super.initState();
  }

  @override
  void dispose() {
    userPlayerController.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Column(children: [_playerWidget()])));
  }

  Widget _playerWidget() {
    return Container(
      width: screenWidth,
      height: screenWidth * .562,
      alignment: Alignment.center,
      child: Obx(() {
        if (userPlayerController.playStatus.value == PlayStatus.loading ||
            userPlayerController.playStatus.value == PlayStatus.none) {
          final ratio = userPlayerController.nowPlayingMedia?.getVideoRatio() ?? 1.78;
          return Stack(
            children: [
              Center(
                child: Hero(
                    tag: userPlayerController.nowPlayingMedia?.identify ?? '?',
                    child: AutoImageView(
                      imageUrl: userPlayerController.nowPlayingMedia?.thumbnail,
                      fit: BoxFit.cover,
                      width: screenWidth,
                      height: screenWidth / ratio,
                    )),
              ),
              const Center(
                child: LoadingView(size: 36),
              )
            ],
          );
        }
        return Chewie(
          controller: userPlayerController.chewieController,
        );
      }),
    );
  }
}
