/*
* 作者 Ren
* 时间  2023/8/12 08:36
*/

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:free_tube_player/ad/helper/ad_manager.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/app/resource/color_res.dart';
import 'package:free_tube_player/base/base_controller.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/module/edit/helper/export_service.dart';
import 'package:free_tube_player/utils/image_utils.dart';
import 'package:free_tube_player/utils/permission_utils.dart';
import 'package:free_tube_player/utils/toast_utils.dart';
import 'package:get/get.dart';
import 'package:video_editor/video_editor.dart';

class EditPageController extends BaseController {
  late VideoEditorController _videoEditorController;
  final isInitComplete = false.obs;
  final exportingProgress = Rxn<double>();
  final saving = false.obs;

  VideoEditorController get videoEditorController => _videoEditorController;

  @override
  void dispose() {
    _videoEditorController.dispose();
    super.dispose();
  }

  Future<void> init(File videoFile) async {
    final context = Get.context!;
    _videoEditorController = VideoEditorController.file(videoFile,
        minDuration: const Duration(seconds: 1),
        maxDuration: const Duration(seconds: 1800),
        coverThumbnailsQuality: 100,
        trimThumbnailsQuality: 35,
        cropStyle: CropGridStyle(selectedBoundariesColor: AppThemeController.primaryThemeColor(context)),
        coverStyle: CoverSelectionStyle(
            selectedBorderColor: AppThemeController.primaryThemeColor(context), borderWidth: 2, borderRadius: 0),
        trimStyle: TrimSliderStyle(
          background: Colors.transparent,
          positionLineColor: AppThemeController.counterTextPrimaryColor(context),
          onTrimmedColor: ColorRes.themeColor,
          onTrimmingColor: ColorRes.themeColor,
          iconColor: AppThemeController.counterTextPrimaryColor(context),
          borderRadius: 6,
          iconSize: 10,
          edgesSize: 12,
          lineColor: ColorRes.themeColor,
        ));
    await _videoEditorController.initialize();
    isInitComplete.value = true;
  }

  void rotate90Degrees(RotateDirection direction) {
    _videoEditorController.rotate90Degrees(direction);
  }

  Future<void> exportCover() async {
    exportingProgress.value = 0.0;
    saving.value = true;

    final config = CoverFFmpegVideoEditorConfig(_videoEditorController);
    final execute = await config.getExecuteConfig();
    if (execute == null) {
      showToast("Error on cover exportation initialization.");
      return;
    }
    final awaitReward = await showReward();
    if (awaitReward == false) {
      exportingProgress.value = null;
      saving.value = false;
      return;
    }
    await ExportService.runFFmpegCommand(
      execute,
      onProgress: (stats) {
        exportingProgress.value = config.getFFmpegProgress(stats.getTime());
      },
      onError: (e, s) => showToast("Error on cover exportation :("),
      onCompleted: (file) async {
        saving.value = true;
        await saveToGallery(file);
        saving.value = false;
        exportingProgress.value = null;
      },
    );
  }

  Future<void> exportVideo() async {
    exportingProgress.value = 0.0;

    final config = VideoFFmpegVideoEditorConfig(
      _videoEditorController,
    );

    final awaitReward = await showReward();
    if (awaitReward == false) {
      exportingProgress.value = null;
      return;
    }

    await ExportService.runFFmpegCommand(
      await config.getExecuteConfig(),
      onProgress: (stats) {
        exportingProgress.value = config.getFFmpegProgress(stats.getTime());
      },
      onError: (e, s) => showToast("Error on export video :("),
      onCompleted: (file) async {
        saving.value = true;
        await saveToGallery(file);
        saving.value = false;
        exportingProgress.value = null;
      },
    );
  }

  void showToast(String text) {
    ToastUtils.show(text);
  }

  Future<void> saveToGallery(File file) async {
    final hasPermission = await PermissionUtils.checkAndRequestImages();
    if (hasPermission) {
      final result = await ImageUtils.saveImageFromFile(file.path);
      if (result.toString().toLowerCase().contains('success')) {
        showToast(S.current.saveToGallerySuccess);
      } else {
        showToast(S.current.saveToGalleryFailed);
      }
    }
  }

  Future<bool> showReward() async {
    ADManager.instance.loadSettingRewardAD();
    Completer<bool> completer = Completer();
    final result = await ADManager.instance.tryShowCutReward(onReward: (_) {
      completer.complete(true);
    });
    if (result == false) {
      ToastUtils.show(S.current.rewardNotLoad,isCorrect: false);
      return false;
    }
    return completer.future;
  }
}
