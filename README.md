# opencode_api

A Dart package that wraps the opencode.ai API using retrofit for type-safe HTTP requests.

## Features

- Type-safe API client using retrofit
- Comprehensive coverage of opencode.ai API endpoints
- Proper error handling with custom exceptions
- Built-in logging with the logger package
- Easy authentication support

## Installation

Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  opencode_api: ^0.1.0
```

## Usage

First, create an instance of the API client:

```dart
import 'package:opencode_api/opencode_api.dart';
import 'package:dio/dio.dart';

void main() async {
  // Create the API client with authentication
  final dio = OpencodeClient.createDio(
    username: 'opencode', 
    password: 'your-password',
    baseUrl: 'http://localhost:4096'
  );
  
  final client = OpencodeClient(dio);
  
  try {
    // Get server health
    final health = await client.getHealth();
    print('Server healthy: ${health['healthy']}');
    
    // Get all projects
    final projects = await client.getProjects();
    print('Found ${projects.length} projects');
    
    // Get current project
    final currentProject = await client.getCurrentProject();
    print('Current project: ${currentProject.name}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Authentication

The API supports HTTP Basic Authentication. You can provide credentials when creating the Dio instance:

```dart
final dio = OpencodeClient.createDio(
  username: 'your-username',
  password: 'your-password',
  baseUrl: 'http://localhost:4096'
);
```

## Supported Endpoints

The package covers all major opencode.ai API endpoints:

- Global endpoints (health, events)
- Project endpoints (list, current project)
- Session endpoints (create, list, update, delete)
- Message endpoints (send, list, get)
- File endpoints (search, read, status)
- And more...

## Error Handling

All API calls are wrapped in try-catch blocks internally. Implementation details are hidden from the user, and exceptions are logged using the logger package.

```dart
try {
  final sessions = await client.getSessions();
} catch (e) {
  // The original exception is logged but not exposed directly
  print('Failed to get sessions: $e');
}
```

## Running the Generator

After making changes to the API definitions, run the code generator:

```bash
dart run build_runner build
```

For watching for changes:

```bash
dart run build_runner watch
```