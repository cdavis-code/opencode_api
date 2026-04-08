# Platform Compatibility Fixes

Detailed guide for resolving platform compatibility issues identified by pana.

## WASM Compatibility

### The Problem

WASM (WebAssembly) requires packages to avoid `dart:io` and other platform-specific libraries. When pana reports:

```
Package not compatible with runtime wasm

Because:
* `package:myapp/main.dart` that imports:
* `package:logger/logger.dart` that imports:
* `dart:io`
```

The issue is a transitive dependency on `dart:io`.

### Solution: Conditional Exports

Use conditional exports to provide different implementations for different platforms.

**Step 1: Create platform-specific implementations**

Create `logger_native.dart` for non-web platforms:

```dart
/// Logger implementation for native platforms
class Logger {
  static final Logger _instance = Logger._internal();
  factory Logger() => _instance;
  Logger._internal();

  void d(String message, {Object? error, StackTrace? stackTrace}) {
    _log('DEBUG', message, error: error, stackTrace: stackTrace);
  }

  void e(String message, {Object? error, StackTrace? stackTrace}) {
    _log('ERROR', message, error: error, stackTrace: stackTrace);
  }

  void _log(String level, String message, {Object? error, StackTrace? stackTrace}) {
    print('[$level] $message');
    if (error != null) print('Error: $error');
    if (stackTrace != null) print('Stack: $stackTrace');
  }
}

final logger = Logger();
```

Create `logger_web.dart` for web/WASM:

```dart
/// Logger stub for web platforms
class Logger {
  static final Logger _instance = Logger._internal();
  factory Logger() => _instance;
  Logger._internal();

  void d(String message, {Object? error, StackTrace? stackTrace}) {}
  void e(String message, {Object? error, StackTrace? stackTrace}) {}
}

final logger = Logger();
```

**Step 2: Export conditionally**

Create `logger.dart`:

```dart
export 'logger_native.dart' 
    if (dart.library.js) 'logger_web.dart'
    if (dart.library.html) 'logger_web.dart';
```

**Step 3: Use the logger**

```dart
import 'package:myapp/src/utils/logger.dart';

void main() {
  logger.e('Something went wrong', error: Exception('test'));
}
```

### Common WASM-incompatible packages

These packages commonly cause WASM issues:

| Package | Issue | Alternative |
|---------|-------|-------------|
| `logger` | Uses dart:io for file output | Custom conditional implementation |
| `path` | Platform-specific path separators | Use with conditional imports |
| `shelf` | HTTP server, not for web | Use platform-appropriate server |
| `args` | Command-line parsing | Use web-compatible config |

## Web Platform Compatibility

### Platform-specific imports

Avoid direct imports of platform-specific libraries:

**Bad:**
```dart
import 'dart:io';

void saveFile(String content) {
  File('output.txt').writeAsStringSync(content);
}
```

**Good:**
```dart
// Use conditional imports or platform abstraction
import 'file_saver_stub.dart'
    if (dart.library.io) 'file_saver_io.dart'
    if (dart.library.js) 'file_saver_web.dart';

abstract class FileSaver {
  void save(String content, String filename);
}
```

### Checking platform at runtime

Use conditional imports rather than runtime checks:

**Bad:**
```dart
import 'dart:io' show Platform;

// This won't compile for web
if (Platform.isLinux) { ... }
```

**Good:**
```dart
import 'platform_stub.dart'
    if (dart.library.io) 'platform_io.dart';

// platform_io.dart exports isLinux = true
// platform_stub.dart exports isLinux = false
if (isLinux) { ... }
```

## Verification

After implementing conditional exports:

1. Run `dart analyze` to ensure no errors
2. Run `pana .` to verify platform score improved
3. Test on both native and web platforms if possible

## Target Score

A fully platform-compatible package should score:
- **20/20** for Platform Support
- **WASM-ready** designation in pana output