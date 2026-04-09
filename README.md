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

### Global

| Method | Description | Response |
|--------|-------------|----------|
| `getHealth()` | Get server health and version | `HealthResponse` |
| `getGlobalEvents()` | Get global events (SSE stream) | `Stream<String>` |

### Project

| Method | Description | Response |
|--------|-------------|----------|
| `getProjects()` | List all projects | `List<Project>` |
| `getCurrentProject()` | Get the current project | `Project` |

### Path & VCS

| Method | Description | Response |
|--------|-------------|----------|
| `getPath()` | Get the current path | `PathResponse` |
| `getVcs()` | Get VCS info for the current project | `VcsResponse` |

### Instance

| Method | Description | Response |
|--------|-------------|----------|
| `disposeInstance()` | Dispose the current instance | `bool` |

### Config

| Method | Description | Response |
|--------|-------------|----------|
| `getConfig()` | Get config info | `ConfigResponse` |
| `updateConfig(body)` | Update config | `ConfigResponse` |
| `getConfigProviders()` | List providers and default models | `ConfigProvidersResponse` |

### Provider

| Method | Description | Response |
|--------|-------------|----------|
| `getProviders()` | List all providers | `ProviderListResponse` |
| `getProviderAuth()` | Get provider authentication methods | `ProviderAuthMethodsResponse` |
| `authorizeProvider(id, body)` | Authorize a provider using OAuth | `ProviderAuthAuthorization` |
| `providerOAuthCallback(id, body)` | Handle OAuth callback for a provider | `bool` |

### Session

| Method | Description | Response |
|--------|-------------|----------|
| `getSessions()` | List all sessions | `List<Session>` |
| `createSession(body)` | Create a new session | `Session` |
| `getSessionStatus()` | Get session status for all sessions | `Map<String, SessionStatus>` |
| `getSession(id)` | Get session details | `Session` |
| `deleteSession(id)` | Delete a session and all its data | `bool` |
| `updateSession(id, body)` | Update session properties | `Session` |
| `getSessionChildren(id)` | Get a session's child sessions | `List<Session>` |
| `getSessionTodo(id)` | Get the todo list for a session | `List<Todo>` |
| `initSession(id, body)` | Analyze app and create AGENTS.md | `bool` |
| `forkSession(id, body)` | Fork an existing session at a message | `Session` |
| `abortSession(id)` | Abort a running session | `bool` |
| `shareSession(id)` | Share a session | `Session` |
| `unshareSession(id)` | Unshare a session | `Session` |
| `getSessionDiff(id, messageID?)` | Get the diff for this session | `List<FileDiff>` |
| `summarizeSession(id, body)` | Summarize the session | `bool` |
| `revertMessage(id, body)` | Revert a message | `bool` |
| `unrevertMessages(id)` | Restore all reverted messages | `bool` |
| `respondToPermissionRequest(id, permissionID, body)` | Respond to a permission request | `bool` |

### Messages (via Session Service)

| Method | Description | Response |
|--------|-------------|----------|
| `getMessages(id, limit?)` | List messages in a session | `List<MessageWithParts>` |
| `sendMessage(id, body)` | Send a message and wait for response | `MessageWithParts` |
| `getMessage(id, messageID)` | Get message details | `MessageWithParts` |
| `sendMessageAsync(id, body)` | Send a message asynchronously (no wait) | `void` |
| `executeCommand(id, body)` | Execute a slash command | `MessageWithParts` |
| `runShell(id, body)` | Run a shell command | `MessageWithParts` |

### Commands

| Method | Description | Response |
|--------|-------------|----------|
| `getCommands()` | List all commands | `List<Command>` |

### Files

| Method | Description | Response |
|--------|-------------|----------|
| `findInFiles(pattern)` | Search for text in files | `List<FindResult>` |
| `findFiles(query)` | Find files and directories by name | `List<String>` |
| `findSymbols(query)` | Find workspace symbols | `List<Symbol>` |
| `listFiles(path?)` | List files and directories | `List<FileNodeResponse>` |
| `getFileContent(path)` | Read a file | `FileContentResponse` |
| `getFileStatus()` | Get status for tracked files | `List<FileStatus>` |

### Tools (Experimental)

| Method | Description | Response |
|--------|-------------|----------|
| `getToolIds()` | List all tool IDs | `ToolIDs` |
| `getTools(provider?, model?)` | List tools with JSON schemas for a model | `ToolList` |

### LSP, Formatters & MCP

| Method | Description | Response |
|--------|-------------|----------|
| `getLspStatus()` | Get LSP server status | `List<LSPStatus>` |
| `getFormatterStatus()` | Get formatter status | `List<FormatterStatus>` |
| `getMcpStatus()` | Get MCP server status | `Map<String, MCPStatus>` |
| `addMcpServer(body)` | Add MCP server dynamically | `MCPStatus` |

### Agents

| Method | Description | Response |
|--------|-------------|----------|
| `getAgents()` | List all available agents | `List<Agent>` |

### Logging

| Method | Description | Response |
|--------|-------------|----------|
| `writeLog(body)` | Write log entry | `bool` |

### TUI

| Method | Description | Response |
|--------|-------------|----------|
| `tuiAppendPrompt(body)` | Append text to the prompt | `bool` |
| `tuiOpenHelp()` | Open the help dialog | `bool` |
| `tuiOpenSessions()` | Open the session selector | `bool` |
| `tuiOpenThemes()` | Open the theme selector | `bool` |
| `tuiOpenModels()` | Open the model selector | `bool` |
| `tuiSubmitPrompt()` | Submit the current prompt | `bool` |
| `tuiClearPrompt()` | Clear the prompt | `bool` |
| `tuiExecuteCommand(body)` | Execute a command | `bool` |
| `tuiShowToast(body)` | Show toast | `bool` |
| `tuiControlNext()` | Wait for the next control request | `ControlRequest` |
| `tuiControlResponse(body)` | Respond to a control request | `bool` |

### Auth

| Method | Description | Response |
|--------|-------------|----------|
| `setAuth(id, body)` | Set authentication credentials | `bool` |

### Events

| Method | Description | Response |
|--------|-------------|----------|
| `getEvents()` | Get events (SSE stream) | `Stream<String>` |

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
