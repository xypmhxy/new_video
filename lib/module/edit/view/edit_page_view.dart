/*
* 作者 Ren
* 时间  2023/8/12 08:08
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/common/decoration.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/edit/callback/edit_page_callback.dart';
import 'package:free_tube_player/module/edit/controller/edit_page_controller.dart';
import 'package:free_tube_player/module/edit/page/crop_page.dart';
import 'package:free_tube_player/widget/base_page_view.dart';
import 'package:free_tube_player/widget/divider.dart';
import 'package:free_tube_player/widget/image_button.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:get/get.dart';
import 'package:video_editor/video_editor.dart';

class EditPageView extends BasePageView<EditPageCallback> {
  final EditPageController editPageController;
  final height = 60.0;

  const EditPageView({super.key, required super.pageCallback, required this.editPageController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return editPageController.isInitComplete.value ? _content() : const Center(child: CircularProgressIndicator());
      }),
    );
  }

  Widget _content() {
    return WillPopScope(
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  const Height(8),
                  _topNavBar(),
                  const Height(4),
                  Expanded(
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          Expanded(
                            child: TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    ClipRRect(
                                        borderRadius: getBorderRadius(6),
                                        child: CropGridViewer.preview(
                                            controller: editPageController.videoEditorController)),
                                    AnimatedBuilder(
                                      animation: editPageController.videoEditorController.video,
                                      builder: (_, __) => AnimatedOpacity(
                                        opacity: editPageController.videoEditorController.isPlaying ? 0 : 1,
                                        duration: kThemeAnimationDuration,
                                        child: GestureDetector(
                                          onTap: editPageController.videoEditorController.video.play,
                                          child: const Icon(
                                            Icons.play_arrow_rounded,
                                            color: Colors.white70,
                                            size: 76,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                CoverViewer(controller: editPageController.videoEditorController)
                              ],
                            ),
                          ),
                          Container(
                            height: 200,
                            margin: const EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                TabBar(
                                  tabs: [
                                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                      Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Icon(
                                            Icons.content_cut,
                                            size: 20,
                                            color: AppThemeController.textPrimaryColor(context),
                                          )),
                                      TextView.primary(S.current.trim, fontSize: 14)
                                    ]),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Icon(
                                              Icons.video_label,
                                              size: 20,
                                              color: AppThemeController.textPrimaryColor(context),
                                            )),
                                        TextView.primary(S.current.cover, fontSize: 14)
                                      ],
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: TabBarView(
                                    physics: const NeverScrollableScrollPhysics(),
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: _trimSlider(),
                                      ),
                                      _coverSelection(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        onWillPop: () async {
          return false;
        });
  }

  Widget _topNavBar() {
    return SafeArea(
      child: SizedBox(
        height: height,
        child: Row(
          children: [
            Expanded(
              child: ImageButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Icon(Icons.close_rounded),
              ),
            ),
            const VerticalDivider(endIndent: 22, indent: 22),
            Expanded(
              child: ImageButton(
                onPressed: () => pageCallback.rotate90Degrees(RotateDirection.left),
                child: const Icon(Icons.rotate_left),
              ),
            ),
            Expanded(
              child: ImageButton(
                onPressed: () => pageCallback.rotate90Degrees(RotateDirection.right),
                child: const Icon(Icons.rotate_right),
              ),
            ),
            Expanded(
              child: ImageButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => CropPage(controller: editPageController.videoEditorController),
                  ),
                ),
                child: const Icon(Icons.crop),
              ),
            ),
            const VerticalDivider(endIndent: 22, indent: 22),
            Expanded(
              child: Stack(
                children: [
                  Center(
                    child: PopupMenuButton(
                      icon: const Icon(Icons.save_outlined),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          onTap: pageCallback.exportCover,
                          child: TextView.primary(S.current.exportCover, fontSize: 14),
                        ),
                        PopupMenuItem(
                          onTap: pageCallback.exportVideo,
                          child: TextView.primary(S.current.exportVideo, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Obx(() => Visibility(
                      visible: editPageController.exportingProgress.value != null,
                      child: IgnorePointer(
                          child: Center(
                        child: SizedBox(
                            width: 28,
                            height: 28,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              value:
                                  editPageController.saving.isTrue ? null : editPageController.exportingProgress.value,
                            )),
                      ))))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _trimSlider() {
    return [
      AnimatedBuilder(
        animation: Listenable.merge([
          editPageController.videoEditorController,
          editPageController.videoEditorController.video,
        ]),
        builder: (_, __) {
          final int duration = editPageController.videoEditorController.videoDuration.inSeconds;
          final double pos = editPageController.videoEditorController.trimPosition * duration;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: height / 4),
            child: Row(children: [
              Text(formatter(Duration(seconds: pos.toInt()))),
              const Expanded(child: SizedBox()),
              AnimatedOpacity(
                opacity: editPageController.videoEditorController.isTrimming ? 1 : 0,
                duration: kThemeAnimationDuration,
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Text(formatter(editPageController.videoEditorController.startTrim)),
                  const SizedBox(width: 10),
                  Text(formatter(editPageController.videoEditorController.endTrim)),
                ]),
              ),
            ]),
          );
        },
      ),
      Container(
        clipBehavior: Clip.hardEdge,
        width: MediaQuery.of(context).size.width,
        decoration: allRadiusDecoration(6),
        margin: EdgeInsets.symmetric(vertical: height / 4, horizontal: 26),
        child: TrimSlider(
          controller: editPageController.videoEditorController,
          height: height.toDouble(),
        ),
      )
    ];
  }

  String formatter(Duration duration) => [
        duration.inMinutes.remainder(60).toString().padLeft(2, '0'),
        duration.inSeconds.remainder(60).toString().padLeft(2, '0')
      ].join(":");

  Widget _coverSelection() {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: CoverSelection(
            controller: editPageController.videoEditorController,
            size: height + 10,
            quantity: 8,
            selectedCoverBuilder: (cover, size) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  cover,
                  Icon(
                    Icons.check_circle,
                    color: const CoverSelectionStyle().selectedBorderColor,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
