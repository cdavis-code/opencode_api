# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.0] - 2026-04-09

### Added
- Service-oriented architecture with `Opencode.connect()` method
- 17 service classes: Global, Project, Path, VCS, Instance, Config, Provider, Session, Commands, Files, Experimental, LspFormatterMcp, Agents, Logging, TUI, Auth, Events
- Convenience method extensions for all services
- Table of contents and contributors section to README
- Detailed API documentation in README with Dart return types

### Changed
- All `OpencodeClient` methods marked as deprecated with migration guidance
- Refactored API to use service groups (e.g., `opencode.global.getHealth()` instead of `client.getHealth()`)
- Updated example to demonstrate new service-oriented API
- Updated tests to verify new service architecture

### Fixed
- Fixed service classes to properly use extension methods instead of direct implementation

---

## [0.1.1] - 2026-04-08

### Added
- Added `text` field to `MessagePart` model for API compatibility

### Changed
- Simplified example/example.dart for quick start

### Fixed
- Moved documentation from `docs/` to `doc/` to avoid gitignore issues
- Added `.pubignore` to properly exclude doc/ from published package

---

## [0.1.0] - 2025-04-08

### Added
- Initial release of the opencode_api package
- Support for all major opencode.ai API endpoints:
  - Global, Project, Path & VCS, Instance, Config, Provider
  - Session (CRUD + init, fork, abort, share, diff, summarize, revert, permissions)
  - Messages (send, list, async, command, shell)
  - Commands, Files (find, list, read, status)
  - Tools (Experimental), LSP/Formatter/MCP
  - Agents, Logging, TUI (12 endpoints), Auth, Events
- Type-safe API client using retrofit
- Proper error handling with custom exceptions (`OpencodeException`)
- Built-in logging with user-friendly messages (no implementation leaks)
- Authentication support for HTTP Basic Auth
- Comprehensive documentation and examples
- All tests passing