import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:logging_appenders/logging_appenders.dart';

export 'package:logging/logging.dart' show Level;

abstract class Log {
  static void d(String tag, String message) => Logger(tag).fine(message);

  static void i(
    String tag,
    String message, {
    StackTrace? stackTrace,
    Object? error,
  }) =>
      Logger(tag).info(message, error, stackTrace);

  static void w(
    String tag,
    String message, {
    StackTrace? stackTrace,
    Object? error,
  }) =>
      Logger(tag).warning(message, error, stackTrace);

  static void e(
    String tag, {
    required StackTrace stackTrace,
    required Object error,
    String? hint,
  }) =>
      Logger(tag).severe(hint, error, stackTrace);
}

void setupLogger() {
  if (kDebugMode) {
    DeveloperLogAppender.setupLogging(level: Level.ALL);
  }
}

/// Appender which outputs all log records using the given formatter using dart:developer log function.
class DeveloperLogAppender extends BaseLogAppender {
  DeveloperLogAppender({LogRecordFormatter? formatter}) : super(formatter ?? const DefaultLogRecordFormatter());

  static DeveloperLogAppender setupLogging({
    Level level = Level.ALL,
    Level stderrLevel = Level.OFF,
  }) {
    assert(level <= stderrLevel, 'Logging should be enabled');
    Logger.root.level = level;

    return DeveloperLogAppender()..attachToLogger(Logger.root);
  }

  @override
  void handle(LogRecord record) {
    log(
      formatter.format(record),
      name: record.loggerName,
      level: record.level.value,
      time: record.time,
      error: record.error,
      stackTrace: record.stackTrace,
      sequenceNumber: record.sequenceNumber,
      zone: record.zone,
    );
  }
}
