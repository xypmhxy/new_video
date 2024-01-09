/*
* 作者 Ren
* 时间  2023/9/10 20:17
*/

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:free_tube_player/api/api.dart';
import 'package:free_tube_player/utils/log_utils.dart';

class BaseDio {
  Dio dio = Dio();

  Future<Response?> executePost({required String url, dynamic data, Map<String, dynamic>? header}) async {
    try {
      dio.options.connectTimeout = const Duration(seconds: 15);
      dio.options.receiveTimeout = const Duration(seconds: 15);
      dio.options.headers.addAll(header ?? getHeader());
      return dio.post(url, data: data);
    } on TimeoutException catch (_) {
      LogUtils.e('$url 请求超时');
      return null;
    } catch (e) {
      LogUtils.e('post请求异常 $e');
      return null;
    }
  }

  Future<Response?> executeGet({required String url, dynamic params}) async {
    try {
      dio.options.connectTimeout = const Duration(seconds: 15);
      dio.options.receiveTimeout = const Duration(seconds: 15);
      return dio.get(url, queryParameters: params);
    } on TimeoutException catch (_) {
      LogUtils.d('$url 请求超时');
      return null;
    } catch (e) {
      LogUtils.e('post请求异常 $e');
      return null;
    }
  }

  Map<String, dynamic> getHeader() {
    return {'Content-Type': 'application/json','X-Goog-Visitor-Id': API.visitorData};
  }
}
