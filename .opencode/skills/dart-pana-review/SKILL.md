# Dart Pana Review Skill

## Overview

This skill runs pana analysis on a Dart package, reviews the results, identifies issues, and provides suggested resolutions. The skill then asks the user whether to automatically apply the suggested fixes.

## Workflow

1. Run `pana .` on the current package
2. Parse the results to identify issues
3. Categorize issues by severity (critical, warning, suggestion)
4. Generate resolution suggestions for each issue
5. Present findings to user and ask if they want to apply fixes
6. If confirmed, apply suggested resolutions
7. Verify fixes by running analysis again

## Issue Categories

### Critical Issues
- Package doesn't meet minimum pub score requirements
- Missing essential files (README, CHANGELOG, LICENSE)
- Invalid pubspec.yaml
- Failing static analysis

### Warnings
- Missing documentation comments
- Low test coverage
- Platform compatibility issues
- Outdated dependencies

### Suggestions
- Improve package description
- Add more examples
- Enhance documentation
- Add topics to pubspec

## Resolution Strategies

### For Missing Files
- Create standard files with appropriate content
- README.md with proper structure
- CHANGELOG.md following Keep a Changelog format
- LICENSE with appropriate license text

### For Documentation Issues
- Add missing dartdoc comments
- Improve existing documentation
- Add more examples

### For Pubspec Issues
- Update description to be more informative
- Add proper homepage/repository/issue_tracker URLs
- Add topics for discoverability
- Fix any validation errors

### For Platform Compatibility
- Identify packages causing platform issues
- Suggest alternatives or conditional imports
- Recommend appropriate platform configurations

## Implementation Notes

- Use regex parsing to extract issues from pana output
- Maintain a mapping of issue patterns to resolution strategies
- Provide detailed explanations for each suggested fix
- Allow selective application of fixes
- Verify fixes with subsequent pana run

## Specific Platform Compatibility Fixes

### WASM/Web Compatibility Issues
When pana reports WASM or Web compatibility issues due to dart:io imports:

1. **Identify the problematic code:** Usually caused by packages that import dart:io directly
2. **Solution approaches:**
   - Use conditional imports to provide different implementations for web vs native
   - Replace dart:io-dependent packages with web-compatible alternatives
   - Restructure code to isolate platform-specific functionality

3. **Implementation:**
   - Create separate files for different platforms (e.g., `logger_native.dart`, `logger_web.dart`)
   - Use conditional exports in main file: `export 'logger_native.dart' if (dart.library.js) 'logger_web.dart';`
   - Ensure web implementation doesn't use dart:io or other non-web-compatible APIs

## Usage

The skill will:
1. Run `pana .` to analyze the current package
2. Parse the output looking for compatibility issues
3. Suggest specific fixes for each issue found
4. Ask for confirmation before applying changes
5. Apply changes if confirmed
6. Re-run analysis to verify improvements