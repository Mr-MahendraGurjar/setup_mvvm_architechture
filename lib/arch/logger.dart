import 'package:flutter/foundation.dart';

class Logger {
  static bool _isEnabled = !kReleaseMode;
  static String _globalTag = '[__APP_LOG__]';

  static void log(String message) {
    if (_isEnabled) {
      print('$_globalTag $message [${DateTime.now()}]');
    }
  }

  static void logTag(Type objectTag, String message) {
    if (_isEnabled) {
      print('[${DateTime.now()}] [${objectTag.toString()}] $message');
    }
  }

  static void setEnable(bool isEnable) {
    _isEnabled = isEnable;
  }

  static void setGlobalTag(String globalTag) {
    _globalTag = globalTag;
  }

  static void printException(Exception e) {
    if (_isEnabled) {
      print(e);
    }
  }
}
