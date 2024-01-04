/*
* 作者 Ren
* 时间  2023/12/16 11:58
*/

import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/generated/assets.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/download/page/download_page.dart';
import 'package:free_tube_player/module/history/page/history_page.dart';
import 'package:free_tube_player/module/player/controller/player_controller.dart';
import 'package:free_tube_player/module/player/controller/user_player_controller.dart';
import 'package:free_tube_player/module/userHome/controller/user_library_page_controller.dart';
import 'package:free_tube_player/module/userHome/page/video_list_page.dart';
import 'package:free_tube_player/utils/page_navigation.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/horizontal_video_list_view.dart';
import 'package:free_tube_player/widget/image_button.dart';
import 'package:free_tube_player/widget/image_view.dart';
import 'package:free_tube_player/widget/library_icon_view.dart';
import 'package:free_tube_player/widget/loading_view.dart';
import 'package:free_tube_player/widget/no_data_view.dart';
import 'package:free_tube_player/widget/svg_view.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:get/get.dart';

class UserLibraryPage extends StatefulWidget {
  const UserLibraryPage({super.key});

  @override
  State<UserLibraryPage> createState() => _UserLibraryPageState();
}

class _UserLibraryPageState extends State<UserLibraryPage> with AutomaticKeepAliveClientMixin {
  final _userLibraryController = UserLibraryPageController();
  bool isFirstIn = true;

  @override
  void initState() {
    _userLibraryController.queryHistory();
    _userLibraryController.queryLikedAndLater();
    _userLibraryController.queryDownloadComplete();
    _userLibraryController.setup();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final isVisible = TickerMode.of(context);
    if (isVisible && isFirstIn == false) {
      Future.delayed(const Duration(milliseconds: 500)).then((_) {
        _userLibraryController.queryHistory();
        _userLibraryController.queryLikedAndLater();
        _userLibraryController.queryDownloadComplete();
      });
    }
    isFirstIn = false;
    super.didChangeDependencies();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Height(24),
          _toolBar(),
          const Height(10),
          Expanded(
              child: ListView(
            children: [
              const Height(20),
              _history(),
              _divider(),
              _download(),
              _divider(),
              _playlistTitle(),
              const Height(16),
              _playlistView()
            ],
          ))
        ],
      )),
    );
  }

  Widget _toolBar() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            ImageView.asset(
              Assets.imagesThemeIcon128,
              size: 32,
            ),
            const Width(18),
            TextView.primary(S.current.library, fontSize: 22, fontWeight: FontWeight.bold),
            Expanded(
                child: Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ImageButton(
                    onPressed: () {
                      _userLibraryController.queryLikedAndLater();
                    },
                    splashRadius: 24,
                    size: 27.5,
                    child: SVGView(assetName: Assets.svgSetting, color: AppThemeController.textPrimaryColor(context)),
                  )
                ],
              ),
            ))
          ],
        ));
  }

  Widget _history() {
    return Obx(() {
      final viewStatus = _userLibraryController.historyViewStatus;
      if (viewStatus.value == ViewStatus.loading) {
        return const UnconstrainedBox(
          child: SizedBox(
            width: 36,
            child: LoadingView(size: 36),
          ),
        );
      }
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 14),
            child: Row(
              children: [
                TextView.primary(S.current.history, fontSize: 18, fontWeight: FontWeight.bold),
                Expanded(
                    child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                      onTap: () {
                        if (_userLibraryController.historyVideos.isEmpty) return;
                        PageNavigation.startNewPage(const HistoryPage());
                      },
                      child: Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                        child: TextView.primary(
                          S.current.viewAll,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppThemeController.primaryThemeColor(context),
                        ),
                      )),
                ))
              ],
            ),
          ),
          const Height(16),
          Visibility(
              visible: viewStatus.value == ViewStatus.success,
              replacement: NoDataView(
                text: S.current.noData,
                iconSize: 100,
              ),
              child: HorizontalVideoListView(
                mediaList: _userLibraryController.historyVideos,
                onItemClick: (mediaInfo) {
                  if (mediaInfo.isLocalVideo) {
                    playMediaInfo(mediaInfo: mediaInfo);
                  } else {
                    startUserPlayPage(mediaInfo: mediaInfo);
                  }
                },
                onItemMoreClick: (mediaInfo) {
                  _userLibraryController.showMoreDialog(mediaInfo);
                },
              ))
        ],
      );
    });
  }

  Widget _download() {
    return GestureDetector(
      onTap: () {
        PageNavigation.startNewPage(const DownloadPage());
      },
      child: Obx(() => _item(
          icon: Assets.imagesLibDownload,
          title: S.current.download,
          subTitle: S.current.libDownloadCount(
              globalDownloadController.downloadList.length, _userLibraryController.downloadedVideos.length))),
    );
  }

  Widget _playlistTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 14),
      child: TextView.primary(S.current.playlist, fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _playlistView() {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_, index) {
          if (index == 0) {
            return Obx(() => GestureDetector(
                onTap: () {
                  if (_userLibraryController.watchLaterVideos.isEmpty) return;
                  PageNavigation.startNewPage(
                    VideoListPage(
                      title: S.current.watchLaterCaps,
                      videos: _userLibraryController.watchLaterVideos,
                      playlist: _userLibraryController.watchLaterList,
                    ),
                  );
                },
                child: _item(
                    icon: Assets.imagesLibWatchLater,
                    title: S.current.watchLaterCaps,
                    subTitle: S.current.paramsVideos(_userLibraryController.watchLaterVideos.length))));
          } else if (index == 1) {
            return Obx(() => GestureDetector(
                  onTap: () {
                    if (_userLibraryController.likedVideos.isEmpty) return;
                    PageNavigation.startNewPage(
                      VideoListPage(
                        title: S.current.likedVideos,
                        videos: _userLibraryController.likedVideos,
                        playlist: _userLibraryController.likePlaylist,
                      ),
                    );
                  },
                  child: _item(
                      icon: Assets.imagesLibLike,
                      title: S.current.likedVideos,
                      subTitle: S.current.paramsVideos(_userLibraryController.likedVideos.length)),
                ));
          }
          return _item(icon: Assets.imagesLibLike, title: S.current.likedVideos);
        },
        separatorBuilder: (_, index) {
          return const Height(16);
        },
        itemCount: 2);
  }

  Widget _divider() {
    return const Divider(height: 36, indent: 20, endIndent: 20, thickness: .5);
  }

  Widget _item({required String icon, required String title, String? subTitle}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.transparent,
      child: Row(
        children: [
          LibraryIconView(icon: icon),
          const Width(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextView.primary(
                title,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              Visibility(
                  visible: subTitle?.isNotEmpty == true,
                  child: TextView.accent(
                    subTitle ?? '',
                    fontSize: 12,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
