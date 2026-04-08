# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Platform-aware conditional logger imports for web compatibility
- Improved README with Quick Start, Features table, and Configuration table
- API Reference documentation in `docs/api.md`
- Architecture documentation in `docs/architecture.md`

### Fixed
- Updated pubspec.yaml repository URLs to point to correct GitHub repo (cdavis-code)

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