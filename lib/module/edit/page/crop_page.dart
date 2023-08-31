import 'package:flutter/material.dart';
import 'package:fraction/fraction.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:free_tube_player/generated/l10n.dart';
import 'package:free_tube_player/widget/text_view.dart';
import 'package:video_editor/video_editor.dart';

class CropPage extends StatelessWidget {
  const CropPage({super.key, required this.controller});

  final VideoEditorController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(children: [
            Row(children: [
              Expanded(
                child: IconButton(
                  onPressed: () => controller.rotate90Degrees(RotateDirection.left),
                  icon: const Icon(Icons.rotate_left),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () => controller.rotate90Degrees(RotateDirection.right),
                  icon: const Icon(Icons.rotate_right),
                ),
              )
            ]),
            const SizedBox(height: 15),
            Expanded(
              child: CropGridViewer.edit(
                controller: controller,
                rotateCropArea: false,
                margin: const EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
            const SizedBox(height: 15),
            Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Expanded(
                flex: 2,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Center(
                    child: TextView.primary(
                      S.current.cancel,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (_, __) => Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () => controller.preferredCropAspectRatio =
                                controller.preferredCropAspectRatio?.toFraction().inverse().toDouble(),
                            icon:
                                controller.preferredCropAspectRatio != null && controller.preferredCropAspectRatio! < 1
                                    ? Icon(Icons.panorama_vertical_select_rounded,
                                        color: AppThemeController.primaryThemeColor(context))
                                    : const Icon(Icons.panorama_vertical_rounded),
                          ),
                          IconButton(
                            onPressed: () => controller.preferredCropAspectRatio =
                                controller.preferredCropAspectRatio?.toFraction().inverse().toDouble(),
                            icon:
                                controller.preferredCropAspectRatio != null && controller.preferredCropAspectRatio! > 1
                                    ? Icon(Icons.panorama_horizontal_select_rounded,
                                        color: AppThemeController.primaryThemeColor(context))
                                    : const Icon(Icons.panorama_horizontal_rounded),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          _buildCropButton(context, null),
                          _buildCropButton(context, 1.toFraction()),
                          _buildCropButton(context, Fraction.fromString("9/16")),
                          _buildCropButton(context, Fraction.fromString("3/4")),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: IconButton(
                  onPressed: () {
                    // WAY 1: validate crop parameters set in the crop view
                    controller.applyCacheCrop();
                    // WAY 2: update manually with Offset values
                    // controller.updateCrop(const Offset(0.2, 0.2), const Offset(0.8, 0.8));
                    Navigator.pop(context);
                  },
                  icon: Center(
                    child: TextView.primary(
                      S.current.confirm,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppThemeController.primaryThemeColor(context),
                    ),
                  ),
                ),
              ),
            ]),
          ]),
        ),
      ),
    );
  }

  Widget _buildCropButton(BuildContext context, Fraction? f) {
    if (controller.preferredCropAspectRatio != null && controller.preferredCropAspectRatio! > 1) f = f?.inverse();

    return Flexible(
      child: TextButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: controller.preferredCropAspectRatio == f?.toDouble()
              ? AppThemeController.primaryThemeColor(context)
              : null,
          foregroundColor: controller.preferredCropAspectRatio == f?.toDouble()
              ? AppThemeController.primaryThemeColor(context)
              : null,
          textStyle: Theme.of(context).textTheme.bodySmall,
        ),
        onPressed: () => controller.preferredCropAspectRatio = f?.toDouble(),
        child: TextView.primary(f == null ? S.current.free : '${f.numerator}:${f.denominator}',
            fontSize: 14,
            color: controller.preferredCropAspectRatio == f?.toDouble()
                ? AppThemeController.counterTextPrimaryColor(context)
                : null),
      ),
    );
  }
}
