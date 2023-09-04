/*
* 作者 Ren
* 时间  2023/9/2 09:13
*/
import 'package:flutter/material.dart' hide RefreshIndicatorState, RefreshIndicator;
import 'package:free_tube_player/widget/loading_view.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class RefreshHeaderView extends RefreshIndicator {
  const RefreshHeaderView({super.key});

  @override
  State<RefreshHeaderView> createState() => _RefreshHeaderViewState();
}

class _RefreshHeaderViewState extends RefreshIndicatorState<RefreshHeaderView> {
  @override
  Widget buildContent(BuildContext context, RefreshStatus mode) {
    return const UnconstrainedBox(
      child: LoadingView(
        size: 32,
      ),
    );
  }
}
