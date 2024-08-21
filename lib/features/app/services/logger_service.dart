import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:logging/logging.dart';

class LoggerService {
  late Logger _logger;
  final DateFormat _dateFormatter = DateFormat("H:m:s.S");

  final String appName;
  final bool debugMode;
  final bool verbose;
  final bool forceLogging;

  LoggerService({this.appName = "my_app", this.debugMode = true, this.verbose = false, this.forceLogging = false}) {
    Logger.root.level = Level.ALL;

    Logger.root.onRecord.listen(verbose ? _verboseRecordHandler  : _recordHandler);

    _logger = Logger(appName);
  }

  void _recordHandler(LogRecord rec) {
    final msg = '${rec.level.name} (${_dateFormatter.format(rec.time)}): ${rec.message}';

    if (debugMode) {
      debugPrint(msg);
      _errorHandler(rec);
    }
    else {
      // for better response time, do it async (since the onRecord stream is sync)
      Future(() {
        debugPrint(msg);
        _errorHandler(rec);
      });
    }
  }

  void _verboseRecordHandler(LogRecord rec) {
    // for better response time, do it async (since the onRecord stream is sync)
    Future(() {
      debugPrint("${rec.time}:${rec.loggerName}:${rec.sequenceNumber}\n"
          "${rec.level}: ${rec.message}");

      _errorHandler(rec);
    });
  }

  void _errorHandler(LogRecord rec) {
    if (rec.error != null) {
      debugPrint("Cause: ${rec.error}");
    }

    if (rec.stackTrace != null) {
      debugPrint("${rec.stackTrace}");
    }
  }

  /// Log message at level [Level.FINEST].
  void finest(Object? message, [Object? error, StackTrace? stackTrace]) =>
      _logger.finest(message, error, stackTrace);

  /// Log message at level [Level.FINER].
  void finer(Object? message, [Object? error, StackTrace? stackTrace]) =>
      _logger.finer(message, error, stackTrace);

  /// Log message at level [Level.FINE].
  void fine(Object? message, [Object? error, StackTrace? stackTrace]) =>
      _logger.fine(message, error, stackTrace);

  /// Log message at level [Level.CONFIG].
  void config(Object? message, [Object? error, StackTrace? stackTrace]) =>
      _logger.config(message, error, stackTrace);

  /// Log message at level [Level.INFO].
  void info(Object? message, [Object? error, StackTrace? stackTrace]) =>
      _logger.info(message, error, stackTrace);

  /// Log message at level [Level.WARNING].
  void warning(Object? message, [Object? error, StackTrace? stackTrace]) =>
      _logger.warning(message, error, stackTrace);

  /// Log message at level [Level.SEVERE].
  void error(Object? message, [Object? error, StackTrace? stackTrace]) =>
      _logger.severe(message, error, stackTrace);

  /// Log message at level [Level.SEVERE].
  void severe(Object? message, [Object? error, StackTrace? stackTrace]) =>
      _logger.severe(message, error, stackTrace);

  /// Log message at level [Level.SHOUT].
  void shout(Object? message, [Object? error, StackTrace? stackTrace]) =>
      _logger.shout(message, error, stackTrace);
}
