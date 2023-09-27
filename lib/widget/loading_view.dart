import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingView extends StatelessWidget {
  final double size;

  const LoadingView({Key? key, this.size = 48.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.staggeredDotsWave(color: AppThemeController.primaryThemeColor(context), size: size);
  }
}
