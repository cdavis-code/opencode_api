import 'package:json_annotation/json_annotation.dart';

import 'message.dart';

part 'response.g.dart';

/// Response model for health endpoint
@JsonSerializable()
class HealthResponse {
  final bool? healthy;
  final String? version;

  HealthResponse({this.healthy, this.version});

  factory HealthResponse.fromJson(Map<String, dynamic> json) =>
      _$HealthResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HealthResponseToJson(this);
}

/// Response model for session status
@JsonSerializable()
class SessionStatusResponse {
  final Map<String, dynamic>? status;

  SessionStatusResponse({this.status});

  factory SessionStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$SessionStatusResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SessionStatusResponseToJson(this);
}

/// Response model for path endpoint
@JsonSerializable()
class PathResponse {
  final String? path;

  PathResponse({this.path});

  factory PathResponse.fromJson(Map<String, dynamic> json) =>
      _$PathResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PathResponseToJson(this);
}

/// Response model for VCS endpoint
@JsonSerializable()
class VcsResponse {
  final String? branch;
  final String? remote;
  final bool? isClean;

  VcsResponse({this.branch, this.remote, this.isClean});

  factory VcsResponse.fromJson(Map<String, dynamic> json) =>
      _$VcsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$VcsResponseToJson(this);
}

/// Response model for file content
@JsonSerializable()
class FileContentResponse {
  final String? path;
  final String? content;
  final String? encoding;

  FileContentResponse({this.path, this.content, this.encoding});

  factory FileContentResponse.fromJson(Map<String, dynamic> json) =>
      _$FileContentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FileContentResponseToJson(this);
}

/// Response model for find results
@JsonSerializable()
class FindResult {
  final String? path;
  final List<FindMatch>? lines;

  FindResult({this.path, this.lines});

  factory FindResult.fromJson(Map<String, dynamic> json) =>
      _$FindResultFromJson(json);
  Map<String, dynamic> toJson() => _$FindResultToJson(this);
}

/// Response model for a single match in find results
@JsonSerializable()
class FindMatch {
  final int? lineNumber;
  final String? line;
  final int? absoluteOffset;
  final List<String>? submatches;

  FindMatch({this.lineNumber, this.line, this.absoluteOffset, this.submatches});

  factory FindMatch.fromJson(Map<String, dynamic> json) =>
      _$FindMatchFromJson(json);
  Map<String, dynamic> toJson() => _$FindMatchToJson(this);
}

/// Response model for symbol search
@JsonSerializable()
class Symbol {
  final String? name;
  final String? path;
  final String? kind;

  Symbol({this.name, this.path, this.kind});

  factory Symbol.fromJson(Map<String, dynamic> json) => _$SymbolFromJson(json);
  Map<String, dynamic> toJson() => _$SymbolToJson(this);
}

/// Response model for configuration
@JsonSerializable()
class ConfigResponse {
  final Map<String, dynamic>? providers;
  final Map<String, dynamic>? defaultModels;

  ConfigResponse({this.providers, this.defaultModels});

  factory ConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfigResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ConfigResponseToJson(this);
}

/// Response model for provider
@JsonSerializable()
class Provider {
  final String? id;
  final String? name;
  final String? description;
  final bool? connected;

  Provider({this.id, this.name, this.description, this.connected});

  factory Provider.fromJson(Map<String, dynamic> json) =>
      _$ProviderFromJson(json);
  Map<String, dynamic> toJson() => _$ProviderToJson(this);
}

/// Response model for provider authentication method
@JsonSerializable()
class ProviderAuthMethod {
  final String? type;
  final String? name;

  ProviderAuthMethod({this.type, this.name});

  factory ProviderAuthMethod.fromJson(Map<String, dynamic> json) =>
      _$ProviderAuthMethodFromJson(json);
  Map<String, dynamic> toJson() => _$ProviderAuthMethodToJson(this);
}

/// Response model for provider auth authorization
@JsonSerializable()
class ProviderAuthAuthorization {
  final String? url;
  final String? state;

  ProviderAuthAuthorization({this.url, this.state});

  factory ProviderAuthAuthorization.fromJson(Map<String, dynamic> json) =>
      _$ProviderAuthAuthorizationFromJson(json);
  Map<String, dynamic> toJson() => _$ProviderAuthAuthorizationToJson(this);
}

/// Response model for session status
@JsonSerializable()
class SessionStatus {
  final String? status;
  final bool? active;

  SessionStatus({this.status, this.active});

  factory SessionStatus.fromJson(Map<String, dynamic> json) =>
      _$SessionStatusFromJson(json);
  Map<String, dynamic> toJson() => _$SessionStatusToJson(this);
}

/// Response model for todo item
@JsonSerializable()
class Todo {
  final String? id;
  final String? title;
  final String? status;
  final String? priority;

  Todo({this.id, this.title, this.status, this.priority});

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
  Map<String, dynamic> toJson() => _$TodoToJson(this);
}

/// Response model for file diff
@JsonSerializable()
class FileDiff {
  final String? path;
  final String? content;
  final String? status;

  FileDiff({this.path, this.content, this.status});

  factory FileDiff.fromJson(Map<String, dynamic> json) =>
      _$FileDiffFromJson(json);
  Map<String, dynamic> toJson() => _$FileDiffToJson(this);
}

/// Response model for message response (without direct Message reference to avoid circular dependency)
@JsonSerializable()
class MessageResponse {
  final Map<String, dynamic>? info;
  final List<Map<String, dynamic>>? parts;

  MessageResponse({this.info, this.parts});

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MessageResponseToJson(this);
}

/// Response model for command
@JsonSerializable()
class Command {
  final String? id;
  final String? name;
  final String? description;
  final String? category;

  Command({this.id, this.name, this.description, this.category});

  factory Command.fromJson(Map<String, dynamic> json) =>
      _$CommandFromJson(json);
  Map<String, dynamic> toJson() => _$CommandToJson(this);
}

/// Response model for tool ID
@JsonSerializable()
class ToolIDs {
  final List<String>? ids;

  ToolIDs({this.ids});

  factory ToolIDs.fromJson(Map<String, dynamic> json) =>
      _$ToolIDsFromJson(json);
  Map<String, dynamic> toJson() => _$ToolIDsToJson(this);
}

/// Response model for tool list
@JsonSerializable()
class ToolList {
  final List<Map<String, dynamic>>? tools;

  ToolList({this.tools});

  factory ToolList.fromJson(Map<String, dynamic> json) =>
      _$ToolListFromJson(json);
  Map<String, dynamic> toJson() => _$ToolListToJson(this);
}

/// Response model for LSP status
@JsonSerializable()
class LSPStatus {
  final String? name;
  final bool? active;
  final String? status;

  LSPStatus({this.name, this.active, this.status});

  factory LSPStatus.fromJson(Map<String, dynamic> json) =>
      _$LSPStatusFromJson(json);
  Map<String, dynamic> toJson() => _$LSPStatusToJson(this);
}

/// Response model for formatter status
@JsonSerializable()
class FormatterStatus {
  final String? name;
  final bool? active;
  final String? status;

  FormatterStatus({this.name, this.active, this.status});

  factory FormatterStatus.fromJson(Map<String, dynamic> json) =>
      _$FormatterStatusFromJson(json);
  Map<String, dynamic> toJson() => _$FormatterStatusToJson(this);
}

/// Response model for MCP status
@JsonSerializable()
class MCPStatus {
  final String? name;
  final bool? active;
  final String? status;

  MCPStatus({this.name, this.active, this.status});

  factory MCPStatus.fromJson(Map<String, dynamic> json) =>
      _$MCPStatusFromJson(json);
  Map<String, dynamic> toJson() => _$MCPStatusToJson(this);
}

/// Response model for agent
@JsonSerializable()
class Agent {
  final String? id;
  final String? name;
  final String? description;
  final String? category;

  Agent({this.id, this.name, this.description, this.category});

  factory Agent.fromJson(Map<String, dynamic> json) => _$AgentFromJson(json);
  Map<String, dynamic> toJson() => _$AgentToJson(this);
}

/// Response model for log entry
@JsonSerializable()
class LogEntry {
  final String? service;
  final String? level;
  final String? message;
  final Map<String, dynamic>? extra;

  LogEntry({this.service, this.level, this.message, this.extra});

  factory LogEntry.fromJson(Map<String, dynamic> json) =>
      _$LogEntryFromJson(json);
  Map<String, dynamic> toJson() => _$LogEntryToJson(this);
}

/// Response model for auth credentials
@JsonSerializable()
class AuthCredentials {
  final String? id;
  final Map<String, dynamic>? credentials;

  AuthCredentials({this.id, this.credentials});

  factory AuthCredentials.fromJson(Map<String, dynamic> json) =>
      _$AuthCredentialsFromJson(json);
  Map<String, dynamic> toJson() => _$AuthCredentialsToJson(this);
}

/// Response model for VCS info
@JsonSerializable()
class VcsInfo {
  final String? branch;
  final String? remote;
  final bool? isClean;

  VcsInfo({this.branch, this.remote, this.isClean});

  factory VcsInfo.fromJson(Map<String, dynamic> json) =>
      _$VcsInfoFromJson(json);
  Map<String, dynamic> toJson() => _$VcsInfoToJson(this);
}

/// Response model for Path info
@JsonSerializable()
class PathInfo {
  final String? path;

  PathInfo({this.path});

  factory PathInfo.fromJson(Map<String, dynamic> json) =>
      _$PathInfoFromJson(json);
  Map<String, dynamic> toJson() => _$PathInfoToJson(this);
}

/// Response model for TUI control request
@JsonSerializable()
class ControlRequest {
  final String? id;
  final String? type;
  final Map<String, dynamic>? body;

  ControlRequest({this.id, this.type, this.body});

  factory ControlRequest.fromJson(Map<String, dynamic> json) =>
      _$ControlRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ControlRequestToJson(this);
}

/// Response model for TUI toast request
@JsonSerializable()
class ToastRequest {
  final String? title;
  final String? message;
  final String? variant;

  ToastRequest({this.title, this.message, this.variant});

  factory ToastRequest.fromJson(Map<String, dynamic> json) =>
      _$ToastRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ToastRequestToJson(this);
}

/// Response model for file node (listing)
@JsonSerializable()
class FileNodeResponse {
  final String? name;
  final String? path;
  final bool? isDirectory;
  final int? size;

  FileNodeResponse({this.name, this.path, this.isDirectory, this.size});

  factory FileNodeResponse.fromJson(Map<String, dynamic> json) =>
      _$FileNodeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FileNodeResponseToJson(this);
}

/// Response model for file status
@JsonSerializable()
class FileStatus {
  final String? path;
  final String? status;
  final bool? isTracked;

  FileStatus({this.path, this.status, this.isTracked});

  factory FileStatus.fromJson(Map<String, dynamic> json) =>
      _$FileStatusFromJson(json);
  Map<String, dynamic> toJson() => _$FileStatusToJson(this);
}

/// Response model for provider list
@JsonSerializable()
class ProviderListResponse {
  final List<Provider>? all;
  final Map<String, String>? default_;
  final List<String>? connected;

  ProviderListResponse({this.all, this.default_, this.connected});

  factory ProviderListResponse.fromJson(Map<String, dynamic> json) =>
      _$ProviderListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProviderListResponseToJson(this);
}

/// Response model for provider auth methods
@JsonSerializable()
class ProviderAuthMethodsResponse {
  final Map<String, List<ProviderAuthMethod>>? methods;

  ProviderAuthMethodsResponse({this.methods});

  factory ProviderAuthMethodsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProviderAuthMethodsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProviderAuthMethodsResponseToJson(this);
}

/// Response model for config providers
@JsonSerializable()
class ConfigProvidersResponse {
  final List<Provider>? providers;
  final Map<String, String>? default_;

  ConfigProvidersResponse({this.providers, this.default_});

  factory ConfigProvidersResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfigProvidersResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ConfigProvidersResponseToJson(this);
}

/// Response model for MCP dynamic add
@JsonSerializable()
class MCPAddRequest {
  final String? name;
  final Map<String, dynamic>? config;

  MCPAddRequest({this.name, this.config});

  factory MCPAddRequest.fromJson(Map<String, dynamic> json) =>
      _$MCPAddRequestFromJson(json);
  Map<String, dynamic> toJson() => _$MCPAddRequestToJson(this);
}

/// Response model for TUI execute command
@JsonSerializable()
class ExecuteCommandRequest {
  final String? command;

  ExecuteCommandRequest({this.command});

  factory ExecuteCommandRequest.fromJson(Map<String, dynamic> json) =>
      _$ExecuteCommandRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ExecuteCommandRequestToJson(this);
}

/// Response model for TUI append prompt
@JsonSerializable()
class AppendPromptRequest {
  final String? text;

  AppendPromptRequest({this.text});

  factory AppendPromptRequest.fromJson(Map<String, dynamic> json) =>
      _$AppendPromptRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AppendPromptRequestToJson(this);
}

/// Response model for TUI control response
@JsonSerializable()
class ControlResponse {
  final Map<String, dynamic>? body;

  ControlResponse({this.body});

  factory ControlResponse.fromJson(Map<String, dynamic> json) =>
      _$ControlResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ControlResponseToJson(this);
}

/// Response model for message with parts
@JsonSerializable()
class MessageWithParts {
  final Message? info;
  final List<MessagePart>? parts;

  MessageWithParts({this.info, this.parts});

  factory MessageWithParts.fromJson(Map<String, dynamic> json) =>
      _$MessageWithPartsFromJson(json);
  Map<String, dynamic> toJson() => _$MessageWithPartsToJson(this);
}
