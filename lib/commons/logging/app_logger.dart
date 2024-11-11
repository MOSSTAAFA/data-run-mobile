import 'package:d2_remote/core/datarun/exception/d_exception.dart';
import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
        methodCount: 2,
        // Shows method trace for easier debugging
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart),
  );

  static void logInfo(String message, [dynamic data]) {
    _logger.i('$message ${data ?? ''}');
  }

  static void logWarning(String message, [dynamic data]) {
    _logger.w('$message ${data ?? ''}');
  }

  static void logError(String message, [dynamic data]) {
    _logger.e('$message ${data ?? ''}');
  }

  static void logException(DException exception) {
    _logger.e('Exception: ${exception.message}',
        error: exception.cause,
        stackTrace: StackTrace.current);
  }

// Other custom logging functions as needed
}
