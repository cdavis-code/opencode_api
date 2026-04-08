// Conditional export to use the appropriate logger implementation
// based on the platform to ensure WASM compatibility
export 'logger_native.dart'
    if (dart.library.js) 'logger_web.dart'
    if (dart.library.html) 'logger_web.dart';
