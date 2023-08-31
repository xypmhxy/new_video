/*
* 作者 Ren
* 时间  2023/8/5 15:17
*/
import 'package:free_tube_player/app/common/common.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  final _viewStatus = ViewStatus.none.obs;

  set viewStatus(ViewStatus viewStatus) {
    _viewStatus.value = viewStatus;
  }

  ViewStatus get viewStatus => _viewStatus.value;

  bool get isNone => viewStatus == ViewStatus.none;

  bool get isLoading => viewStatus == ViewStatus.loading;

  bool get isSuccess => viewStatus == ViewStatus.success;

  bool get isEmpty => viewStatus == ViewStatus.empty;

  bool get isFailed => viewStatus == ViewStatus.failed;

  void setNone() {
    viewStatus = ViewStatus.none;
  }

  void setLoading() {
    viewStatus = ViewStatus.loading;
  }

  void setSuccess() {
    viewStatus = ViewStatus.success;
  }

  void setEmpty() {
    viewStatus = ViewStatus.empty;
  }

  void setFailed() {
    viewStatus = ViewStatus.failed;
  }
}
