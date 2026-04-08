# Platform Compatibility Fixes

Detailed guide for resolving platform compatibility issues identified by pana.

## WASM Compatibility

### The Problem

WASM (WebAssembly) requires packages to avoid `dart:io` and other platform-specific libraries. When pana reports:

```
Package not compatible with runtime wasm

Because:
* `package:myapp/main.dart` that imports:
* `package:some_package/some_package.dart` that imports:
* `dart:io`
```

The issue is a transitive dependency on `dart:io`.

### Solution: Conditional Exports

Use conditional exports to provide different implementations for different platforms.

**Step 1: Create platform-specific implementations**

Create `my_class_native.dart` for non-web platforms:

```dart
/// Implementation for native platforms (desktop, mobile)
class MyClass {
  void doSomething() {
    // Native-specific implementation
    print('Running on native platform');
  }
}
```

Create `my_class_web.dart` for web/WASM:

```dart
/// Implementation for web platforms
class MyClass {
  void doSomething() {
    // Web-specific implementation (no dart:io)
    print('Running on web platform');
  }
}
```

**Step 2: Export conditionally**

Create `my_class.dart`:

```dart
export 'my_class_native.dart' 
    if (dart.library.js) 'my_class_web.dart'
    if (dart.library.html) 'my_class_web.dart';
```

**Step 3: Use the class**

```dart
import 'package:myapp/src/my_class.dart';

void main() {
  final myClass = MyClass();
  myClass.doSomething();
}
```

### Common WASM-incompatible patterns

| Pattern | Issue | Solution |
|---------|-------|----------|
| `import 'dart:io'` | Not available on web | Use conditional exports |
| `import 'dart:html'` | Only available on web | Use conditional exports |
| File system operations | No file system on web | Use web storage APIs |
| Platform checks | Not portable | Use conditional imports |

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

## Creating Conditional Import Files

### Stub file (default)

Create `feature_stub.dart` with default or no-op implementations:

```dart
/// Default implementation - used when no platform-specific version matches
void doSomething() {
  // No-op or default behavior
}
```

### Platform-specific file

Create `feature_io.dart` for platforms with `dart:io`:

```dart
import 'dart:io';

void doSomething() {
  // Platform-specific implementation using dart:io
  stdout.writeln('Hello from native!');
}
```

### Main file

Create `feature.dart` that exports the right version:

```dart
export 'feature_stub.dart'
    if (dart.library.io) 'feature_io.dart';
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