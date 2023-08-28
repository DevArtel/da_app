import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:logging_appenders/logging_appenders.dart';
import 'package:path_provider/path_provider.dart';

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

  FileLogger.setupLogging(level: Level.ALL);
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

class _FileLogRecordFormatter extends LogRecordFormatter {
  const _FileLogRecordFormatter();

  @override
  StringBuffer formatToStringBuffer(LogRecord rec, StringBuffer sb) {
    sb.write(
      '${rec.time.toIso8601String()} ${rec.level.name} '
      '${rec.loggerName} - ${rec.message}',
    );

    if (rec.error != null) {
      sb.writeln();
      sb.write('### ${rec.error?.runtimeType}: ');
      sb.write(rec.error);
    }

    final stackTrace = rec.stackTrace ?? (rec.error is Error ? (rec.error as Error?)?.stackTrace : null);
    if (stackTrace != null) {
      sb.writeln();
      sb.write(stackTrace);
    }

    return sb;
  }
}

class FileLogger extends BaseLogAppender {
  FileLogger() : super(const _FileLogRecordFormatter()) {
    _init();
  }

  static FileLogger setupLogging({
    Level level = Level.ALL,
    Level stderrLevel = Level.OFF,
  }) {
    assert(level <= stderrLevel, 'Logging should be enabled');

    return FileLogger()..attachToLogger(Logger.root);
  }

  bool _queueProcessingAllowed = false;
  File? _logFile;
  IOSink? _append;

  final _logQueue = Queue<LogRecord>();

  static const _retention = Duration(minutes: 5);

  Future<void> _init() async {
    await _openLogFile();
    await _deleteOldRecords();

    _queueProcessingAllowed = true;
    _makeSureQueueIsEmpty();
  }

  Future<void> _openLogFile() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final logFilePath = '${documentsDirectory.path}/logs.txt';

    _logFile = File(logFilePath);

    if (!_logFile!.existsSync()) {
      await _logFile!.create();
    }

    _append = _logFile!.openWrite(mode: FileMode.append);
  }

  Future<void> _deleteOldRecords() async {
    assert(_logFile != null, 'Open the log file before trying to delete old records');

    final lineStream = _logFile!.openRead().transform(utf8.decoder).transform(const LineSplitter()).cast<String>();

    final now = DateTime.now();

    int? lastDeletedLine;
    var currentLine = 0;

    var startSaving = false;

    final linesToKeep = LinkedList<StringLinkedListEntry<String>>();

    await for (final line in lineStream) {
      final dateTime = DateTime.tryParse(line.split(' ').first);

      if (dateTime != null) {
        if (now.difference(dateTime) > _retention) {
          lastDeletedLine = currentLine;
        } else if (lastDeletedLine != null) {
          startSaving = true;
        }
        currentLine++;
      }

      if (startSaving) {
        linesToKeep.add(StringLinkedListEntry(line));
      }
    }

    if (lastDeletedLine != null) {
      await _logFile!.writeAsString('');
      final writeFile = _logFile!.openWrite(mode: FileMode.append);

      for (final lineToKeep in linesToKeep) {
        final line = lineToKeep.value;

        writeFile.write('$line\n');
      }

      await writeFile.close();
    }
  }

  void _makeSureQueueIsEmpty() {
    for (final record in _logQueue) {
      _append!.write('${formatter.format(record)}\n');
    }
  }

  @override
  void handle(LogRecord record) {
    _logQueue.add(record);

    if (_queueProcessingAllowed) {
      _makeSureQueueIsEmpty();
    }
  }

  @override
  Future<void> dispose() async {
    await _append?.close();
    await super.dispose();
  }
}

final class StringLinkedListEntry<String> extends LinkedListEntry<StringLinkedListEntry<String>> {
  StringLinkedListEntry(this.value);

  String value;
}
