# opencode_api

A Dart package that wraps the opencode.ai API using retrofit for type-safe HTTP requests.

## Quick Start

```dart
import 'package:opencode_api/opencode_api.dart';
import 'package:dio/dio.dart';

void main() async {
  final dio = OpencodeClient.createDio(
    username: 'opencode',
    password: 'your-password',
    baseUrl: 'http://localhost:4096'
  );

  final client = OpencodeClient(dio);

  final health = await client.getHealth();
  print('Server healthy: ${health.healthy}');
}
```

## Features

- **Type-safe API client** - Uses retrofit for compile-time API contracts
- **Comprehensive endpoints** - Covers all opencode.ai API endpoints
- **Secure error handling** - Custom exceptions with user-friendly messages, no implementation leaks
- **Built-in logging** - Uses logger package with platform-aware conditional imports
- **Easy authentication** - HTTP Basic Auth support

## Configuration

| Variable | Description | Default |
|----------|-------------|---------|
| `baseUrl` | Server URL | `http://localhost:4096` |
| `username` | Auth username | `opencode` |
| `password` | Auth password | (required) |

## Supported Endpoints

| Category | Endpoints |
|----------|-----------|
| **Global** | `/global/health`, `/global/event` |
| **Project** | `/project`, `/project/current` |
| **Path & VCS** | `/path`, `/vcs` |
| **Instance** | `/instance/dispose` |
| **Config** | `/config`, `/config/providers` |
| **Provider** | `/provider`, `/provider/auth`, OAuth |
| **Session** | Full CRUD + init, fork, abort, share, diff, summarize, revert, permissions |
| **Messages** | Send, list, async, command, shell |
| **Commands** | `/command` |
| **Files** | `/find`, `/find/file`, `/find/symbol`, `/file`, `/file/content`, `/file/status` |
| **Tools** | `/experimental/tool/ids`, `/experimental/tool` |
| **LSP/Formatter/MCP** | `/lsp`, `/formatter`, `/mcp` |
| **Agents** | `/agent` |
| **Logging** | `/log` |
| **TUI** | 12 endpoints for TUI control |
| **Auth** | `/auth/:id` |
| **Events** | `/event` (SSE stream) |

## Documentation

- [API Reference](./docs/api.md)
- [Architecture](./docs/architecture.md)

## Error Handling

The package provides user-friendly error messages without exposing implementation details:

```dart
try {
  final sessions = await client.getSessions();
} catch (e) {
  if (e is OpencodeException) {
    print(e.userMessage); // Safe for users
  }
}
```

## Running the Generator

After changes to API definitions:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## License

BSD-3-Clause - See [LICENSE](./LICENSE)