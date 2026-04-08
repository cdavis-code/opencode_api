/// Web-compatible logger implementation for native platforms
/// This version avoids dart:io dependencies that break WASM compatibility
class Logger {
  static final Logger _instance = Logger._internal();
  factory Logger() => _instance;
  Logger._internal();

  void d(String message, {Object? error, StackTrace? stackTrace}) {
    _log('DEBUG', message, error: error, stackTrace: stackTrace);
  }

  void i(String message, {Object? error, StackTrace? stackTrace}) {
    _log('INFO', message, error: error, stackTrace: stackTrace);
  }

  void w(String message, {Object? error, StackTrace? stackTrace}) {
    _log('WARNING', message, error: error, stackTrace: stackTrace);
  }

  void e(String message, {Object? error, StackTrace? stackTrace}) {
    _log('ERROR', message, error: error, stackTrace: stackTrace);
  }

  void _log(
    String level,
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    // Only log to console to avoid dart:io dependencies
    print('[$level] $message');
    if (error != null) {
      print('Error: $error');
    }
    if (stackTrace != null) {
      print('Stack: $stackTrace');
    }
  }
}

// Global instance
final logger = Logger();
