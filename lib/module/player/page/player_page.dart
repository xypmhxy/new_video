/*
* 作者 Ren
* 时间  2023/7/25 21:14
*/

import 'package:flutter/material.dart';
import 'package:free_tube_player/module/player/callback/player_page_callback.dart';
import 'package:free_tube_player/module/player/controller/player_controller.dart';
import 'package:free_tube_player/module/player/controller/player_page_controller.dart';
import 'package:free_tube_player/module/player/view/player_page_view.dart';
import 'package:free_tube_player/utils/page_navigation.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({super.key});

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> implements PlayerPageCallback {
  final _playerController = PlayerController.get;
  final _playerPageController = PlayerPageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PlayerPageView(
        pageCallback: this, playerController: _playerController, playerPageController: _playerPageController);
  }

  @override
  void dispose() {
    _playerController.release();
    _playerPageController.dispose();
    super.dispose();
  }

  @override
  void onClickBack() {
    PageNavigation.back();
  }

  @override
  void onClickBack10Second() {
    _playerController.back10seconds();
  }

  @override
  void onClickPlay() {
    _playerController.clickPlay();
  }

  @override
  void onClickForward10Second() {
    _playerController.forward10Seconds();
  }

  @override
  void onSeek(int position) {
    _playerController.seekTo(Duration(milliseconds: position));
  }

  @override
  void onTogglePanel() {
    _playerController.togglePanel();
  }

  @override
  void onDoubleTap() {
    _playerController.clickPlay();
  }

  @override
  void onLongPressed(bool isEnd) {
    _playerController.setPlaySpeed(isEnd ? 1.0 : 2.0);
  }

  @override
  void onMoveStart(double dx) {
    _playerController.onMoveStart(dx);
  }

  @override
  void onMove(double dx) {
    _playerController.onMove(dx);
  }

  @override
  void onMoveEnd() {
    _playerController.onMoveEnd();
  }

  @override
  void onShowMoreDialog() {
    // DialogUtils.showCenterDialog(DialogMore());
  }
}
