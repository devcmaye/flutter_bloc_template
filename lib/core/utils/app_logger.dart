import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

enum LogLevel { debug, info, warning, error }

class AppLogger {
  static const String _defaultTag = "PinSinPay Log";

  static void log(
    String message, {
    String tag = _defaultTag,
    LogLevel level = LogLevel.info,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (!kDebugMode) return;

    final formattedMessage = _formatMessage(tag, level, message);

    // Print to console
    debugPrint(formattedMessage);

    // Send to DevTools (structured log)
    developer.log(message, name: tag, error: error, stackTrace: stackTrace);
  }

  static String _formatMessage(String tag, LogLevel level, String message) {
    final emoji = _getEmoji(level);
    final time = DateTime.now().toIso8601String();

    return "$emoji [$time] [$tag] $message";
  }

  static String _getEmoji(LogLevel level) {
    switch (level) {
      case LogLevel.debug:
        return "🐛";
      case LogLevel.info:
        return "ℹ️";
      case LogLevel.warning:
        return "⚠️";
      case LogLevel.error:
        return "❌";
    }
  }

  // Shortcut methods
  static void d(String message, {String tag = _defaultTag}) {
    log(message, tag: tag, level: LogLevel.debug);
  }

  static void i(String message, {String tag = _defaultTag}) {
    log(message, tag: tag, level: LogLevel.info);
  }

  static void w(String message, {String tag = _defaultTag}) {
    log(message, tag: tag, level: LogLevel.warning);
  }

  static void e(
    String message, {
    String tag = _defaultTag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    log(
      message,
      tag: tag,
      level: LogLevel.error,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
