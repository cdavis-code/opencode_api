---
name: publishing-dart-packages
description: Prepares Dart and Flutter packages for publication to pub.dev, ensuring all metadata, documentation, and requirements are met. Use when preparing to publish a package, updating package metadata, or reviewing package publication readiness.
---

# Publishing Dart Packages

Prepare your Dart or Flutter package for publication to pub.dev.

## Prerequisites

Before publishing, run pana analysis to identify scoring issues:

```bash
pana .
```

Target a score of at least 140/160 before publishing. See the `reviewing-dart-packages` skill for details.

## Workflow

Copy this checklist and track your progress:

```
Package Publication Readiness:
- [ ] Step 1: Verify required files exist
- [ ] Step 2: Complete pubspec.yaml metadata
- [ ] Step 3: Add discoverability fields (topics, funding)
- [ ] Step 4: Validate content quality
- [ ] Step 5: Check package size
- [ ] Step 6: Run static analysis
- [ ] Step 7: Test publish (dry run)
- [ ] Step 8: Publish to pub.dev
```

**Step 1: Verify required files exist**

Check for these required files:
- `LICENSE` - Required (BSD 3-clause recommended)
- `README.md` - Required for package page
- `CHANGELOG.md` - Strongly recommended
- `pubspec.yaml` - Required, must be valid YAML

**Step 2: Complete pubspec.yaml metadata**

Review and add these fields:

```yaml
name: my_package
version: 1.0.0
description: A clear, concise description of what your package does.
homepage: https://github.com/username/my_package
repository: https://github.com/username/my_package
issue_tracker: https://github.com/username/my_package/issues
documentation: https://my_package.dev/docs  # optional

environment:
  sdk: '>=3.0.0 <4.0.0'
```

**Step 3: Add discoverability fields**

Add topics (max 5):

```yaml
topics:
  - http
  - api
  - networking
  - client
  - rest
```

Add funding links:

```yaml
funding:
  - https://github.com/sponsors/username
  - https://buymeacoffee.com/username
```

For Flutter packages, add screenshots (max 10):

```yaml
screenshots:
  - description: 'Main screen showing the app'
    path: screenshots/main.png
```

**Step 4: Validate content quality**

**README.md structure:**
- Package name and description
- Quick start / Installation
- Usage examples
- API reference link (if applicable)
- License information

**CHANGELOG.md format:**
Follow [Keep a Changelog](https://keepachangelog.com/):

```markdown
# Changelog

## [Unreleased]

## [1.0.0] - 2025-01-08
### Added
- Initial release
- Feature X
- Feature Y

### Fixed
- Bug in feature Z
```

**Step 5: Check package size**

Package limits:
- Recommended: < 100 MB (gzipped)
- Maximum: < 256 MB (uncompressed)

Large files to check:
- `example/` directories with assets
- Generated files
- Test fixtures

Use `.pubignore` to exclude unnecessary files:

```
# .pubignore
.example/
coverage/
.dart_tool/
```

**Step 6: Run static analysis**

```bash
dart analyze
```

Fix all warnings and errors before publishing.

**Step 7: Test publish (dry run)**

```bash
dart pub publish --dry-run
```

This shows exactly what files will be published. Review the list carefully.

**Step 8: Publish to pub.dev**

When ready:

```bash
dart pub publish
```

The first time, this prompts for Google Account authentication.

## Common issues and fixes

### Missing LICENSE

**Issue:** No LICENSE file found

**Fix:** Create LICENSE file:
```
Copyright (c) 2025 Your Name

Redistribution and use in source and binary forms...
```

For BSD 3-clause, see [opensou rce.org](https://opensource.org/licenses/BSD-3-Clause).

### Incomplete README

**Issue:** README missing sections

**Fix:** Add standard sections:
```markdown
# package_name

Brief description.

## Installation

```yaml
dependencies:
  package_name: ^1.0.0
```

## Usage

```dart
import 'package:package_name/package_name.dart';
```

## License

MIT
```

### Missing topics

**Issue:** No topics in pubspec

**Fix:** Add relevant topics:
```yaml
topics:
  - networking
  - http
```

Choose topics that describe your package's purpose, not implementation details.

### No funding links

**Issue:** No funding field

**Fix:** Add support links:
```yaml
funding:
  - https://github.com/sponsors/yourusername
```

### Platform compatibility warnings

**Issue:** Package not compatible with all platforms

**Fix:** Specify supported platforms explicitly:
```yaml
platforms:
  android:
  ios:
  web:
```

Or use conditional imports for platform-specific code.

### Package too large

**Issue:** Package exceeds size limits

**Fix:** Add `.pubignore` to exclude large files:
```
example/assets/
test/fixtures/large_files/
*.png
*.jpg
```

## Examples

### Example 1: Complete pubspec.yaml

```yaml
name: http_client
version: 2.1.0
description: A type-safe HTTP client with automatic retry and caching.
homepage: https://github.com/example/http_client
repository: https://github.com/example/http_client
issue_tracker: https://github.com/example/http_client/issues
documentation: https://http_client.dev
funding:
  - https://github.com/sponsors/example
  - https://buymeacoffee.com/example
topics:
  - http
  - client
  - networking
  - api
  - rest

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  meta: ^1.9.0

dev_dependencies:
  test: ^1.24.0
  lints: ^3.0.0

executables:
  http_client:
```

### Example 2: Flutter package with screenshots

```yaml
name: awesome_widget
version: 1.0.0
description: A beautiful widget for displaying user profiles.
repository: https://github.com/example/awesome_widget
topics:
  - widget
  - ui
  - profile
  - user-interface
screenshots:
  - description: 'Profile widget in light mode'
    path: screenshots/light_mode.png
  - description: 'Profile widget in dark mode'
    path: screenshots/dark_mode.png

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
```

### Example 3: Publishing prerelease

For beta testing or active development:

```yaml
version: 2.0.0-dev.1
```

Prereleases don't affect stable version users. Use suffixes like:
- `-dev.1`, `-dev.2` (development)
- `-beta.1`, `-beta.2` (beta testing)
- `-rc.1`, `-rc.2` (release candidate)

### Example 4: Verified publisher

After creating a verified publisher at pub.dev:

1. Go to package admin page
2. Click "Transfer to Publisher"
3. Enter publisher domain

Advantages:
- Shows verified badge
- Hides personal email
- Team can publish updates

## Automated checks

Run the readiness check script:

```bash
bash scripts/check_readiness.sh
```

This verifies:
- Required files exist
- Pubspec has required fields
- Package size is acceptable
- Static analysis passes

## Reference

- [Publishing packages](https://dart.dev/tools/pub/publishing)
- [Pubspec format](https://dart.dev/tools/pub/pubspec)
- [Package layout conventions](https://dart.dev/tools/pub/package-layout)
- [Writing package pages](https://dart.dev/tools/pub/writing-package-pages)