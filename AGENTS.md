# AGENTS.md - opencode_api

## Quick Start

```bash
cd /Users/chrisdavis/projects/my/opencode_api
dart pub get
dart run build_runner build --delete-conflicting-outputs
dart test
dart run example/example.dart
```

## Key Commands

| Command | Purpose |
|---------|---------|
| `dart run build_runner build --delete-conflicting-outputs` | Generate .g.dart files (retrofit + json_serializable) |
| `dart run build_runner watch` | Watch mode for auto-regeneration |
| `dart test` | Run all tests |
| `dart analyze` | Run static analysis (no issues expected) |

## Required Command Order

1. `dart pub get` - fetch dependencies
2. `dart run build_runner build` - generate code
3. `dart analyze` - verify no issues
4. `dart test` - run tests

## Project Structure

```
opencode_api/
├── lib/
│   ├── opencode_api.dart          # Main library exports
│   └── src/
│       ├── api/
│       │   ├── opencode_client.dart           # Retrofit @RestApi definitions
│       │   ├── opencode_client.g.dart         # GENERATED - do not edit
│       │   └── opencode_client_extension.dart # Convenience methods with logging
│       ├── models/
│       │   ├── project.dart                    # Project model
│       │   ├── session.dart                    # Session model
│       │   ├── message.dart                    # Message model
│       │   ├── file_node.dart                  # FileNode model
│       │   └── response.dart                   # API response models
│       ├── exceptions/
│       │   └── opencode_exception.dart         # Custom exception
│       └── utils/
│           └── logger.dart                     # Logger instance
├── test/
│   └── opencode_api_test.dart
└── example/
    └── example.dart
```

## Important Conventions

- All model fields must be **nullable** (`String?`, `int?`, etc.) - the opencode server returns null for missing fields
- Generated files (`*.g.dart`) are committed - regenerate after model changes
- Error handling uses try-catch with `logger.e()` to log exceptions without exposing implementation details
- API responses use `HttpResponse<T>` wrapper; convenience methods in extension return `T` directly

## API Response Format

The opencode server uses different field names than initially expected:
- `Project`: `id`, `worktree` (not `name`), `time` (with `created`/`updated` as epoch ms)
- `Session`: `id`, `slug`, `projectID`, `directory`, `title`, `summary` (`additions`/`deletions`/`files`), `permission`, `time`

## Testing Against Live Server

The example requires a running opencode server with credentials:
- Default: `http://localhost:4096`
- Default auth: `opencode:my-password`

```bash
# Start server
opencode serve --port 4096

# In another terminal, run example
dart run example/example.dart
```

## Known Issues

- `List<Map<String, dynamic>>` return types cause retrofit generator to produce invalid code - avoid these patterns
- Some endpoints (messages, file status, session todo) were removed to avoid dynamic type issues
