/*
* 作者 Ren
* 时间  2023/8/6 15:43
*/

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:free_tube_player/channel/default_method_channel.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionUtils {
  static Future<bool> hasVideoStorage() async {
    final androidSDKInt = await DefaultMethodChannel.getAndroidSDKInt();
    if (androidSDKInt >= 33) {
      return Permission.videos.isGranted;
    }
    if (isAndroid) {
      return Permission.storage.isGranted;
    }
    return Permission.photos.isGranted;
  }

  static Future<PermissionStatus> requestVideoStorage() async {
    final androidSDKInt = await DefaultMethodChannel.getAndroidSDKInt();
    if (androidSDKInt >= 33) {
      return Permission.videos.request();
    }
    if (isAndroid) {
      return Permission.storage.request();
    }
    return Permission.photos.request();
  }

  static Future<bool> hasImageStorage() async {
    final androidSDKInt = await DefaultMethodChannel.getAndroidSDKInt();
    if (androidSDKInt >= 33) {
      return Permission.photos.isGranted;
    }
    return Permission.storage.isGranted;
  }

  static Future<PermissionStatus> requestImagesStorage() async {
    final androidSDKInt = await DefaultMethodChannel.getAndroidSDKInt();
    if (androidSDKInt >= 33) {
      return Permission.photos.request();
    }
    return Permission.storage.request();
  }

  static Future<bool> checkAndRequestImages() async {
    final hasPermission = await hasImageStorage();
    if (hasPermission) return true;
    final result = await requestImagesStorage();
    return result == PermissionStatus.granted;
  }

  static Future<void> requestIDFA() async {
    final status = await AppTrackingTransparency.trackingAuthorizationStatus;
    if (status == TrackingStatus.notDetermined) {
      AppTrackingTransparency.requestTrackingAuthorization();
    }
  }
}
