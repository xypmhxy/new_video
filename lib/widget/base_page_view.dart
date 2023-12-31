import 'package:flutter/material.dart';
import 'package:free_tube_player/widget/image_button.dart';
import 'package:get/get.dart';

import 'text_view.dart';

abstract class BasePageView<T> extends StatelessWidget {
  final T pageCallback;

  const BasePageView({Key? key, required this.pageCallback}) : super(key: key);

  BuildContext get context => Get.context!;

  AppBar? createAppBar(
      {VoidCallback? onPressed, Widget? icon, String? title, List<Widget>? actions, bool isShowBack = true}) {
    return AppBar(
      leading: isShowBack
          ? ImageButton(
              padding: EdgeInsets.zero,
              onPressed: onPressed,
              child: icon ??
                  const Icon(
                    Icons.arrow_back_rounded,
                    size: 24,
                  ),
            )
          : null,
      title: TextView.primary(title ?? '', fontWeight: FontWeight.bold, fontSize: 18),
      actions: actions,
    );
  }
}
