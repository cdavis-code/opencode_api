// Conditional export to use the appropriate logger implementation
// based on the platform
export 'logger_native.dart' if (dart.library.js) 'logger_web.dart';
