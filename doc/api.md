# API Reference

## Global Endpoints

### GET /global/health

Get server health and version.

**Response:**
```json
{
  "healthy": true,
  "version": "1.0.0"
}
```

**Dart:**
```dart
Future<HealthResponse> getHealth();
```

---

### GET /global/event

Get global events as Server-Sent Events stream.

**Returns:** `Stream<String>`

---

## Project Endpoints

### GET /project

List all projects.

**Returns:** `List<Project>`

---

### GET /project/current

Get the current project.

**Returns:** `Project`

---

## Session Endpoints

### GET /session

List all sessions.

**Returns:** `List<Session>`

---

### POST /session

Create a new session.

**Body:**
```json
{
  "parentID": "optional-parent-id",
  "title": "optional-title"
}
```

**Returns:** `Session`

---

### GET /session/{id}

Get session details.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| id | string | Yes | Session ID |

**Returns:** `Session`

---

### DELETE /session/{id}

Delete a session and all its data.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| id | string | Yes | Session ID |

**Returns:** `bool`

---

### PATCH /session/{id}

Update session properties.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| id | string | Yes | Session ID |

**Body:**
```json
{
  "title": "new-title"
}
```

**Returns:** `Session`

---

### GET /session/{id}/children

Get a session's child sessions.

**Returns:** `List<Session>`

---

### GET /session/{id}/todo

Get the todo list for a session.

**Returns:** `List<Todo>`

---

### POST /session/{id}/init

Analyze app and create AGENTS.md.

**Body:**
```json
{
  "messageID": "optional-message-id",
  "providerID": "provider-id",
  "modelID": "model-id"
}
```

**Returns:** `bool`

---

### POST /session/{id}/fork

Fork an existing session at a message.

**Body:**
```json
{
  "messageID": "optional-message-id"
}
```

**Returns:** `Session`

---

### POST /session/{id}/abort

Abort a running session.

**Returns:** `bool`

---

### POST /session/{id}/share

Share a session.

**Returns:** `Session`

---

### DELETE /session/{id}/share

Unshare a session.

**Returns:** `Session`

---

### GET /session/{id}/diff

Get the diff for this session.

**Query Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| messageID | string | No | Filter by message ID |

**Returns:** `List<FileDiff>`

---

### POST /session/{id}/summarize

Summarize the session.

**Body:**
```json
{
  "providerID": "provider-id",
  "modelID": "model-id"
}
```

**Returns:** `bool`

---

### POST /session/{id}/revert

Revert a message.

**Body:**
```json
{
  "messageID": "message-id",
  "partID": "optional-part-id"
}
```

**Returns:** `bool`

---

### POST /session/{id}/unrevert

Restore all reverted messages.

**Returns:** `bool`

---

### POST /session/{id}/permissions/{permissionID}

Respond to a permission request.

**Body:**
```json
{
  "response": "approve|deny",
  "remember": true
}
```

**Returns:** `bool`

---

## Message Endpoints

### GET /session/{id}/message

List messages in a session.

**Query Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| limit | int | No | Maximum messages to return |

**Returns:** `List<MessageWithParts>`

---

### POST /session/{id}/message

Send a message and wait for response.

**Body:**
```json
{
  "messageID": "optional-message-id",
  "model": "optional-model",
  "agent": "optional-agent",
  "noReply": false,
  "system": "optional-system-prompt",
  "tools": ["tool1", "tool2"],
  "parts": []
}
```

**Returns:** `MessageWithParts`

---

### GET /session/{id}/message/{messageID}

Get message details.

**Returns:** `MessageWithParts`

---

### POST /session/{id}/prompt_async

Send a message asynchronously (no wait).

**Returns:** `void` (204 No Content)

---

### POST /session/{id}/command

Execute a slash command.

**Body:**
```json
{
  "messageID": "optional-message-id",
  "agent": "optional-agent",
  "model": "optional-model",
  "command": "/command-name",
  "arguments": {}
}
```

**Returns:** `MessageWithParts`

---

### POST /session/{id}/shell

Run a shell command.

**Body:**
```json
{
  "agent": "agent-name",
  "model": "optional-model",
  "command": "shell-command"
}
```

**Returns:** `MessageWithParts`

---

## File Endpoints

### GET /find?pattern={pattern}

Search for text in files.

**Query Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| pattern | string | Yes | Search pattern |

**Returns:** `List<FindResult>`

---

### GET /find/file?query={query}

Find files and directories by name.

**Query Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| query | string | Yes | Search query |
| type | string | No | Limit to "file" or "directory" |
| directory | string | No | Override project root |
| limit | int | No | Max results (1-200) |

**Returns:** `List<String>`

---

### GET /find/symbol?query={query}

Find workspace symbols.

**Query Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| query | string | Yes | Search query |

**Returns:** `List<Symbol>`

---

### GET /file?path={path}

List files and directories.

**Query Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| path | string | No | Directory path |

**Returns:** `List<FileNodeResponse>`

---

### GET /file/content?path={path}

Read a file.

**Query Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| path | string | Yes | File path |

**Returns:** `FileContentResponse`

---

### GET /file/status

Get status for tracked files.

**Returns:** `List<FileStatus>`

---

## TUI Endpoints

All TUI endpoints return `bool` indicating success.

| Endpoint | Description |
|----------|-------------|
| `POST /tui/append-prompt` | Append text to prompt |
| `POST /tui/open-help` | Open help dialog |
| `POST /tui/open-sessions` | Open session selector |
| `POST /tui/open-themes` | Open theme selector |
| `POST /tui/open-models` | Open model selector |
| `POST /tui/submit-prompt` | Submit current prompt |
| `POST /tui/clear-prompt` | Clear the prompt |
| `POST /tui/execute-command` | Execute a command |
| `POST /tui/show-toast` | Show toast notification |
| `GET /tui/control/next` | Wait for next control request |
| `POST /tui/control/response` | Respond to control request |