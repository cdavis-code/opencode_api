/// No-op logger stub for web platforms
/// This file is used when dart:io is not available (web/WASM)
class Logger {
  Logger({Printer? printer});

  void log(
    Level level,
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) {}
  void v(String message, {Object? error, StackTrace? stackTrace}) {}
  void d(String message, {Object? error, StackTrace? stackTrace}) {}
  void i(String message, {Object? error, StackTrace? stackTrace}) {}
  void w(String message, {Object? error, StackTrace? stackTrace}) {}
  void e(String message, {Object? error, StackTrace? stackTrace}) {}
  void wtf(String message, {Object? error, StackTrace? stackTrace}) {}
}

enum Level { verbose, debug, info, warning, error, fatal }

abstract class Printer {
  void log(
    Level level,
    String message, {
    Object? error,
    StackTrace? stackTrace,
  });
}

class LogEvent {
  final Level level;
  final String message;
  final Object? error;
  final StackTrace? stackTrace;

  LogEvent(this.level, this.message, {this.error, this.stackTrace});
}
