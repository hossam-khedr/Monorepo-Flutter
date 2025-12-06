import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

enum AppLogLevel {
  debug,
  info,
  warning,
  error;

  int toDeveloperLevel() {
    switch (this) {
      case AppLogLevel.debug:
        return 500;
      case AppLogLevel.info:
        return 800;
      case AppLogLevel.warning:
        return 900;
      case AppLogLevel.error:
        return 1000;
    }
  }

  String get color {
    switch (this) {
      case AppLogLevel.debug:
        return '\x1B[90m';
      case AppLogLevel.info:
        return '\x1B[32m';
      case AppLogLevel.warning:
        return '\x1B[33m';
      case AppLogLevel.error:
        return '\x1B[31m';
    }
  }


}

class LoggerManager {
  LoggerManager._();

  static AppLogLevel _minLogLevel = AppLogLevel.debug;
  static bool _isEnabled = true;

  static void setMinLevel(AppLogLevel level) {
    _minLogLevel = level;
    if (kDebugMode) {
      print(' Logger min level set to: ${level.name}');
    }
  }

  static void setEnabled(bool enabled) {
    _isEnabled = enabled;
    if (kDebugMode) {
      print(' Logger enabled: $enabled');
    }
  }

  static bool _shouldLog(AppLogLevel level) {
    return _isEnabled && level.index >= _minLogLevel.index;
  }

  static void _log({
    required AppLogLevel level,
    required String message,
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (!_shouldLog(level)) return;

    final time = DateTime.now().toIso8601String().substring(11, 23);
    final levelName = level.name.toUpperCase().padRight(7);
    final tagString = tag != null ? '[$tag] ' : '';


    final output = '$time $levelName$tagString$message';

    if (kDebugMode) {
      print('${level.color}$output\x1B[0m');
    }

    if (error != null) {
      if (kDebugMode) {
        print('${level.color} Error: $error\x1B[0m');
      }
    }

    developer.log(
      message,
      time: DateTime.now(),
      level: level.toDeveloperLevel(),
      name: tag ?? 'App',
      error: error,
      stackTrace: stackTrace,
    );
  }

  static void debug(String message, {String? tag}) {
    _log(level: AppLogLevel.debug, message: message, tag: tag);
  }

  static void info(String message, {String? tag}) {
    _log(level: AppLogLevel.info, message: message, tag: tag);
  }

  static void warning(String message, {String? tag, Object? error}) {
    _log(level: AppLogLevel.warning, message: message, tag: tag, error: error);
  }

  static void error(String message, {String? tag, Object? error, StackTrace? stackTrace}) {
    _log(
      level: AppLogLevel.error,
      message: message,
      tag: tag,
      error: error,
      stackTrace: stackTrace,
    );
  }
}