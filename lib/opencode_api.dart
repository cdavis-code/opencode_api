/// A Dart package that wraps the opencode.ai API using retrofit for type-safe HTTP requests.
library opencode_api;

// Service classes
export 'src/api/global_service.dart';
export 'src/api/global_service_extension.dart';
export 'src/api/project_service.dart';
export 'src/api/path_service.dart';
export 'src/api/path_service_extension.dart';
export 'src/api/vcs_service.dart';
export 'src/api/vcs_service_extension.dart';
export 'src/api/instance_service.dart';
export 'src/api/instance_service_extension.dart';
export 'src/api/config_service.dart';
export 'src/api/config_service_extension.dart';
export 'src/api/provider_service.dart';
export 'src/api/provider_service_extension.dart';
export 'src/api/session_service.dart';
export 'src/api/session_service_extension.dart';
export 'src/api/commands_service.dart';
export 'src/api/commands_service_extension.dart';
export 'src/api/files_service.dart';
export 'src/api/files_service_extension.dart';
export 'src/api/experimental_service.dart';
export 'src/api/experimental_service_extension.dart';
export 'src/api/lsp_formatter_mcp_service.dart';
export 'src/api/lsp_formatter_mcp_service_extension.dart';
export 'src/api/agents_service.dart';
export 'src/api/agents_service_extension.dart';
export 'src/api/logging_service.dart';
export 'src/api/logging_service_extension.dart';
export 'src/api/tui_service.dart';
export 'src/api/tui_service_extension.dart';
export 'src/api/auth_service.dart';
export 'src/api/auth_service_extension.dart';
export 'src/api/events_service.dart';

// Deprecated - for backward compatibility
export 'src/api/opencode_client.dart';
export 'src/api/opencode_client_extension.dart';

// OpenCode base class
export 'src/opencode_base.dart';

// Models
export 'src/models/project.dart';
export 'src/models/session.dart';
export 'src/models/message.dart';
export 'src/models/file_node.dart';
export 'src/models/response.dart';

// Exceptions
export 'src/exceptions/opencode_exception.dart';
