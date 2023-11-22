import 'package:flutter/services.dart';
import 'package:free_tube_player/app/common/common.dart';
import 'package:logger/logger.dart';

class LogUtils {
  static final _logger = Logger(filter: LoggerFilter(), printer: PrettyPrinter(methodCount: 3));
  static final filterTag = {};
  static final LoggerChannel _loggerChannel = LoggerChannel();

  static printLog(String msg) {
    print(msg);
  }

  static d(String? msg, {String? tag, bool useLogcat = false}) {
    // useLogcat ??= isAndroid ? true : false;
    if (useLogcat && isAndroid) {
      _loggerChannel.d(msg, tag: tag);
      return;
    }
    if (isFilterTag(tag)) return;
    if (tag != null) tag = '$tag --->>> ';
    _logger.d('${tag ?? ''}$msg');
  }

  static i(String? msg, {String? tag, bool useLogcat = false}) {
    // useLogcat ??= isAndroid ? true : false;
    if (useLogcat && isAndroid) {
      _loggerChannel.i(msg, tag: tag);
      return;
    }
    if (isFilterTag(tag)) return;
    if (tag != null) tag = '$tag --->>> ';
    _logger.i(msg);
  }

  static e(String? msg, {String? tag, bool useLogcat = false}) {
    // useLogcat ??= isAndroid ? true : false;
    if (useLogcat && isAndroid) {
      _loggerChannel.e(msg, tag: tag);
      return;
    }
    if (isFilterTag(tag)) return;
    if (tag != null) tag = '$tag --->>> ';
    _logger.e(msg);
  }

  static isFilterTag(String? tag) {
    return filterTag.isNotEmpty && !filterTag.containsKey(tag);
  }
}

class LoggerFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    if (isRelease) return false;
    return true;
  }
}

class LoggerChannel {
  MethodChannel loggerChannel = const MethodChannel('free.tuber.log.plugin');

  void i(String? msg, {String? tag}) {
    loggerChannel.invokeMethod('logI', {'msg': msg, 'tag': tag ?? 'FreeTuberLog'});
  }

  void d(String? msg, {String? tag}) {
    loggerChannel.invokeMethod('logD', {'msg': msg, 'tag': tag ?? 'FreeTuberLog'});
  }

  void w(String? msg, {String? tag}) {
    loggerChannel.invokeMethod('logW', {'msg': msg, 'tag': tag ?? 'FreeTuberLog'});
  }

  void e(String? msg, {String? tag}) {
    loggerChannel.invokeMethod('logE', {'msg': msg, 'tag': tag ?? 'FreeTuberLog'});
  }
}
