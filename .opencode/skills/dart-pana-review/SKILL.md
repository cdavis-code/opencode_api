---
name: reviewing-dart-packages
description: Runs pana analysis on Dart packages, identifies scoring issues, and suggests fixes to achieve higher pub scores. Use when improving package quality, preparing for pub.dev publication, or when pana score issues are mentioned.
---

# Dart Package Review with Pana

## Quick start

Run pana on the current package:

```bash
pana .
```

## Workflow

Copy this checklist and track your progress:

```
Package Review Progress:
- [ ] Step 1: Run pana analysis
- [ ] Step 2: Identify scoring issues
- [ ] Step 3: Categorize by severity
- [ ] Step 4: Suggest resolutions
- [ ] Step 5: Apply fixes (with user confirmation)
- [ ] Step 6: Verify improvements
```

**Step 1: Run pana analysis**

Execute `pana .` and review the output. The tool scores packages on:
- Dart file conventions (30 points)
- Documentation (20 points)
- Platform support (20 points)
- Static analysis (50 points)
- Dependencies (40 points)

**Step 2: Identify scoring issues**

Look for sections marked with ✗ or [~] (partial credit). Parse the output for:
- Critical: Missing files, invalid pubspec, analysis failures
- Warnings: Platform compatibility, documentation gaps
- Suggestions: Topics, examples, description improvements

**Step 3: Categorize by severity**

**Critical Issues** (must fix):
- Package score below 100
- Missing README, CHANGELOG, or LICENSE
- Invalid pubspec.yaml
- Failing static analysis

**Warnings** (should fix):
- Platform compatibility issues (especially WASM)
- Documentation coverage below 20%
- Outdated dependencies

**Suggestions** (nice to have):
- Add topics to pubspec
- Improve package description
- Add more examples

**Step 4: Suggest resolutions**

For each issue, provide:
1. Clear explanation of the problem
2. Specific fix recommendation
3. Example code or command if applicable

**Step 5: Apply fixes**

Ask user for confirmation before making changes. Present as:
```
Issue: [description]
Fix: [specific action]
Apply? (yes/no)
```

**Step 6: Verify improvements**

Re-run `pana .` and compare scores. Iterate if issues remain.

## Common issues and fixes

### Missing files

**README.md**: Create with standard structure (title, description, installation, usage, license)

**CHANGELOG.md**: Use Keep a Changelog format:
```markdown
# Changelog

## [Unreleased]

## [0.1.0] - 2025-01-01
### Added
- Initial release
```

**LICENSE**: Add MIT, BSD, or appropriate license file

### Platform compatibility

See [platform-compatibility.md](platform-compatibility.md) for WASM/Web issues.

### Static analysis failures

Run `dart analyze` and fix all issues before re-running pana.

### Documentation coverage

Add dartdoc comments to public APIs:
```dart
/// Returns the user's display name.
/// 
/// Returns null if the user has not set a display name.
String? getDisplayName() { ... }
```

## Examples

### Example 1: WASM compatibility issue

**Pana output:**
```
## ✗ Platform support (10 / 20)
Package not compatible with runtime wasm

Because:
* `package:myapp/main.dart` that imports:
* `package:logger/logger.dart` that imports:
* `dart:io`
```

**Fix:**
Replace logger with conditional imports:
```dart
// lib/src/utils/logger.dart
export 'logger_native.dart' if (dart.library.js) 'logger_web.dart';

// lib/src/utils/logger_native.dart
class Logger {
  void e(String message, {Object? error, StackTrace? stackTrace}) {
    print('[ERROR] $message');
  }
}

// lib/src/utils/logger_web.dart
class Logger {
  void e(String message, {Object? error, StackTrace? stackTrace}) {}
}
```

### Example 2: Missing documentation

**Pana output:**
```
20% or more of the public API has dartdoc comments
45 out of 200 API elements (22.5%) have documentation comments
```

**Fix:**
Add documentation to undocumented elements:
```dart
// Before
class User {
  String? name;
  int? age;
}

// After
/// Represents a user in the system.
class User {
  /// The user's display name.
  String? name;
  
  /// The user's age in years.
  int? age;
}
```

### Example 3: Formatting issues

**Pana output:**
```
lib/main.dart doesn't match the Dart formatter
```

**Fix:**
```bash
dart format .
```

## Reference

- [Pana documentation](https://pub.dev/packages/pana)
- [Pub package requirements](https://pub.dev/help)
- [Platform compatibility guide](platform-compatibility.md)