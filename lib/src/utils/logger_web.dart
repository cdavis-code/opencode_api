/// Web-compatible logger stub
/// This version is used on web platforms to ensure compatibility
class Logger {
  static final Logger _instance = Logger._internal();
  factory Logger() => _instance;
  Logger._internal();

  void d(String message, {Object? error, StackTrace? stackTrace}) {
    // Intentionally empty for web compatibility
  }
  void i(String message, {Object? error, StackTrace? stackTrace}) {
    // Intentionally empty for web compatibility
  }
  void w(String message, {Object? error, StackTrace? stackTrace}) {
    // Intentionally empty for web compatibility
  }
  void e(String message, {Object? error, StackTrace? stackTrace}) {
    // Intentionally empty for web compatibility
  }
}

// Global instance
final logger = Logger();
