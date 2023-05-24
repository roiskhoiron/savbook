import 'package:logger/logger.dart';

class Log {
  // static const String _name = 'Logger';
  static late Logger _instance;

  static void init() {
    _instance = Logger(
      printer: PrettyPrinter(
          methodCount: 2,
          // number of method calls to be displayed
          errorMethodCount: 8,
          // number of method calls if stacktrace is provided
          lineLength: 120,
          // width of the output
          colors: true,
          // Colorful log messages
          printEmojis: true,
          // Print an emoji for each log message
          printTime: false // Should each log print contain a timestamp
          ),
    );
  }

  static void setLevel(Level level) {
    Logger.level = level;
  }

  static void info(message, [Object? error, StackTrace? stackTrace]) {
    _instance.i(message, error, stackTrace);
  }

  static void warning(message, [Object? error, StackTrace? stackTrace]) {
    _instance.w(message, error, stackTrace);
  }

  static void verbose(message, [Object? error, StackTrace? stackTrace]) {
    _instance.v(message, error, stackTrace);
  }

  static void debug(message, [Object? error, StackTrace? stackTrace]) {
    _instance.d(message, error, stackTrace);
  }

  static void wtf(message, [Object? error, StackTrace? stackTrace]) {
    _instance.wtf(message, error, stackTrace);
  }

  static void error(message, [Object? error, StackTrace? stackTrace]) {
    _instance.e(message, error, stackTrace);
  }
}
