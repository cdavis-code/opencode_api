# opencode_api

<div style="text-align: center;">
  <img src="https://github.com/cdavis-code/opencode_api/raw/main/opencode_api_logo.png" style="width: 300px;">
</div>

A Dart package that wraps the opencode.ai API using retrofit for type-safe HTTP requests.

## Table of Contents

- [Quick Start](#quick-start)
- [Features](#features)
- [Configuration](#configuration)
- [API Services](#api-services)
- [Migration from OpencodeClient](#migration-from-opencodeclient)
- [Documentation](#documentation)
- [Error Handling](#error-handling)
- [Running the Generator](#running-the-generator)
- [Contributors](#contributors)
- [Support](#support)
- [License](#license)

## Quick Start

```dart
import 'package:opencode_api/opencode_api.dart';

void main() async {
  // Connect to the opencode server
  final opencode = await Opencode.connect(
    username: 'opencode',
    password: 'your-password',
    baseUrl: 'http://localhost:4096'
  );

  // Use service groups to access API endpoints
  final health = await opencode.global.getHealth();
  print('Server healthy: ${health.healthy}');
  
  // List sessions
  final sessions = await opencode.session.getSessions();
  print('Found ${sessions.length} sessions');
}
```

## Features

- **Type-safe API client** - Uses retrofit for compile-time API contracts
- **Service-oriented architecture** - Organized API endpoints into logical service groups
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

## API Services

The `Opencode` object provides access to the following service groups:

| Service | Description | Example Methods |
|---------|-------------|----------------|
| `global` | Global endpoints | `getHealth()`, `getGlobalEvents()` |
| `project` | Project management | `getProjects()`, `getCurrentProject()` |
| `path` | Path operations | `getPath()` |
| `vcs` | Version control | `getVcs()` |
| `instance` | Instance management | `disposeInstance()` |
| `config` | Configuration | `getConfig()`, `updateConfig()` |
| `provider` | Provider management | `getProviders()`, `authorizeProvider()` |
| `session` | Session management | `getSessions()`, `createSession()`, `sendMessage()` |
| `commands` | Command operations | `getCommands()` |
| `files` | File operations | `findFiles()`, `listFiles()`, `getFileContent()` |
| `experimental` | Experimental features | `getTools()`, `getToolIds()` |
| `lspFormatterMcp` | LSP, Formatters, MCP | `getLspStatus()`, `getMcpStatus()` |
| `agents` | Agent management | `getAgents()` |
| `logging` | Logging operations | `writeLog()` |
| `tui` | TUI control | `tuiOpenHelp()`, `tuiShowToast()` |
| `auth` | Authentication | `setAuth()` |
| `events` | Event streams | `getEvents()` |

## Migration from OpencodeClient

The old `OpencodeClient` is deprecated but still available for backward compatibility. Here's how to migrate:

### Old API (Deprecated)
```dart
final dio = OpencodeClient.createDio(username: 'user', password: 'pass');
final client = OpencodeClient(dio);
final health = await client.getHealth();
```

### New API (Recommended)
```dart
final opencode = await Opencode.connect(
  username: 'user', 
  password: 'pass'
);
final health = await opencode.global.getHealth();
```

## Documentation

- [API Reference](./docs/api.md)
- [Architecture](./docs/architecture.md)

## Error Handling

The package provides user-friendly error messages without exposing implementation details:

```dart
try {
  final sessions = await opencode.session.getSessions();
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

## Contributors

Thanks to all the contributors who have helped make this package better!

- <img src="https://avatars.githubusercontent.com/u/3249991?v=4" width="25" height="25"/> [cdavis-code](https://github.com/cdavis-code) - Author and maintainer

## Support

If you find this package helpful, consider supporting its development:

[![Buy Me a Coffee](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://buymeacoffee.com/cdavis)

## License

MIT - See [LICENSE](./LICENSE)
