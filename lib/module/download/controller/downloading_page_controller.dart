/*
* 作者 Ren
* 时间  2024/1/2 20:56
*/

import 'dart:async';

import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/module/download/bean/download_info.dart';
import 'package:get/get.dart';

class DownloadingPageController {
  StreamSubscription? subscription;
  StreamSubscription? downloadSubscription;
  final repeatMap = <String, List<DownloadInfo>>{};
  final downloadGroupList = <List<DownloadInfo>>[].obs;
  final expandMap = <String,bool>{}.obs;

  DownloadingPageController() {
    subscription = globalDownloadController.changeNotify.listen((_) {
      queryDownload();
    });
    downloadSubscription = globalDownloadController.downloadList.listen((_) {
      queryDownload();
    });
  }

  void dispose() {
    subscription?.cancel();
    downloadSubscription?.cancel();
  }

  Future<void> queryDownload() async {
    repeatMap.clear();
    downloadGroupList.clear();

    final downloadList = globalDownloadController.downloadList;
    for (final downloadInfo in downloadList) {
      final downloadInfoList = repeatMap[downloadInfo.mediaInfo.identify] ?? <DownloadInfo>[];
      downloadInfoList.add(downloadInfo);
      repeatMap[downloadInfo.mediaInfo.identify] = downloadInfoList;
    }

    for (final entry in repeatMap.values){
      downloadGroupList.add(entry);
    }
  }

  void togglePanelExpand(DownloadInfo downloadInfo){
    final isExpand = expandMap[downloadInfo.mediaInfo.identify] ?? false;
    expandMap[downloadInfo.mediaInfo.identify] = !isExpand;
  }
}
