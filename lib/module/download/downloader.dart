import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:free_tube_player/utils/log_utils.dart';

class Downloader {
  final Dio _dio = Dio();

  void download(
      {required String url,
      required String savePath,
      Function({int? errorCode, String? errorMsg})? downloadFailed,
      ProgressCallback? onReceiveProgress,
      CancelToken? cancelToken}) async {
    try {
      File file = File(savePath);
      int startRange = await file.exists() ? await file.length() : 0;
      var response = await _dio.get<ResponseBody>(
        url,
        cancelToken: cancelToken,
        options: Options(
          responseType: ResponseType.stream,
          headers: {
            "range": "bytes=$startRange-",
          },
        ),
      );
      RandomAccessFile raf = file.openSync(mode: FileMode.append);
      int received = startRange;
      int total = await _getContentLength(response);
      Stream<Uint8List> stream = response.data!.stream;
      StreamSubscription<Uint8List>? subscription;
      subscription = stream.listen(
        cancelOnError: true,
        (data) {
          raf.writeFromSync(data);
          received += data.length;
          onReceiveProgress?.call(received, total);
        },
        onDone: () async {
          await subscription?.cancel();
          await raf.close();
        },
        onError: (e) async {
          await subscription?.cancel();
          await raf.close();
          if (cancelToken?.isCancelled == false) {
            await downloadFailed?.call(errorMsg: e.toString());
          }
          LogUtils.e("下载过程出现异常 $e");
        },
      );
      cancelToken?.whenCancel.then((_) async {
        await subscription?.cancel();
        await raf.close();
      });
    } catch (e) {
      if (e is DioException) {
        if (e.type == DioExceptionType.cancel) return;
        downloadFailed?.call(errorMsg: e.response?.statusMessage ?? 'unknown', errorCode: e.response?.statusCode ?? -2);
        LogUtils.e('DownloadHelper 下载异常 $e');
      }
    }
  }

  static Future<int> _getContentLength(Response<ResponseBody> response) async {
    try {
      var headerContent = response.headers.value(HttpHeaders.contentRangeHeader);
      if (headerContent != null) {
        return int.parse(headerContent.split('/').last);
      } else {
        return 0;
      }
    } catch (e) {
      return 0;
    }
  }

  void close() {
    _dio.close();
  }
}
