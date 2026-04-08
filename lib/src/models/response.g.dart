// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthResponse _$HealthResponseFromJson(Map<String, dynamic> json) =>
    HealthResponse(
      healthy: json['healthy'] as bool?,
      version: json['version'] as String?,
    );

Map<String, dynamic> _$HealthResponseToJson(HealthResponse instance) =>
    <String, dynamic>{'healthy': instance.healthy, 'version': instance.version};

SessionStatusResponse _$SessionStatusResponseFromJson(
  Map<String, dynamic> json,
) => SessionStatusResponse(status: json['status'] as Map<String, dynamic>?);

Map<String, dynamic> _$SessionStatusResponseToJson(
  SessionStatusResponse instance,
) => <String, dynamic>{'status': instance.status};

PathResponse _$PathResponseFromJson(Map<String, dynamic> json) =>
    PathResponse(path: json['path'] as String?);

Map<String, dynamic> _$PathResponseToJson(PathResponse instance) =>
    <String, dynamic>{'path': instance.path};

VcsResponse _$VcsResponseFromJson(Map<String, dynamic> json) => VcsResponse(
  branch: json['branch'] as String?,
  remote: json['remote'] as String?,
  isClean: json['isClean'] as bool?,
);

Map<String, dynamic> _$VcsResponseToJson(VcsResponse instance) =>
    <String, dynamic>{
      'branch': instance.branch,
      'remote': instance.remote,
      'isClean': instance.isClean,
    };

FileContentResponse _$FileContentResponseFromJson(Map<String, dynamic> json) =>
    FileContentResponse(
      path: json['path'] as String?,
      content: json['content'] as String?,
      encoding: json['encoding'] as String?,
    );

Map<String, dynamic> _$FileContentResponseToJson(
  FileContentResponse instance,
) => <String, dynamic>{
  'path': instance.path,
  'content': instance.content,
  'encoding': instance.encoding,
};

FindResult _$FindResultFromJson(Map<String, dynamic> json) => FindResult(
  path: json['path'] as String?,
  lines: (json['lines'] as List<dynamic>?)
      ?.map((e) => FindMatch.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$FindResultToJson(FindResult instance) =>
    <String, dynamic>{'path': instance.path, 'lines': instance.lines};

FindMatch _$FindMatchFromJson(Map<String, dynamic> json) => FindMatch(
  lineNumber: (json['lineNumber'] as num?)?.toInt(),
  line: json['line'] as String?,
  absoluteOffset: (json['absoluteOffset'] as num?)?.toInt(),
  submatches: (json['submatches'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$FindMatchToJson(FindMatch instance) => <String, dynamic>{
  'lineNumber': instance.lineNumber,
  'line': instance.line,
  'absoluteOffset': instance.absoluteOffset,
  'submatches': instance.submatches,
};

Symbol _$SymbolFromJson(Map<String, dynamic> json) => Symbol(
  name: json['name'] as String?,
  path: json['path'] as String?,
  kind: json['kind'] as String?,
);

Map<String, dynamic> _$SymbolToJson(Symbol instance) => <String, dynamic>{
  'name': instance.name,
  'path': instance.path,
  'kind': instance.kind,
};

ConfigResponse _$ConfigResponseFromJson(Map<String, dynamic> json) =>
    ConfigResponse(
      providers: json['providers'] as Map<String, dynamic>?,
      defaultModels: json['defaultModels'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ConfigResponseToJson(ConfigResponse instance) =>
    <String, dynamic>{
      'providers': instance.providers,
      'defaultModels': instance.defaultModels,
    };

Provider _$ProviderFromJson(Map<String, dynamic> json) => Provider(
  id: json['id'] as String?,
  name: json['name'] as String?,
  description: json['description'] as String?,
  connected: json['connected'] as bool?,
);

Map<String, dynamic> _$ProviderToJson(Provider instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'connected': instance.connected,
};

ProviderAuthMethod _$ProviderAuthMethodFromJson(Map<String, dynamic> json) =>
    ProviderAuthMethod(
      type: json['type'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProviderAuthMethodToJson(ProviderAuthMethod instance) =>
    <String, dynamic>{'type': instance.type, 'name': instance.name};

ProviderAuthAuthorization _$ProviderAuthAuthorizationFromJson(
  Map<String, dynamic> json,
) => ProviderAuthAuthorization(
  url: json['url'] as String?,
  state: json['state'] as String?,
);

Map<String, dynamic> _$ProviderAuthAuthorizationToJson(
  ProviderAuthAuthorization instance,
) => <String, dynamic>{'url': instance.url, 'state': instance.state};

SessionStatus _$SessionStatusFromJson(Map<String, dynamic> json) =>
    SessionStatus(
      status: json['status'] as String?,
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$SessionStatusToJson(SessionStatus instance) =>
    <String, dynamic>{'status': instance.status, 'active': instance.active};

Todo _$TodoFromJson(Map<String, dynamic> json) => Todo(
  id: json['id'] as String?,
  title: json['title'] as String?,
  status: json['status'] as String?,
  priority: json['priority'] as String?,
);

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'status': instance.status,
  'priority': instance.priority,
};

FileDiff _$FileDiffFromJson(Map<String, dynamic> json) => FileDiff(
  path: json['path'] as String?,
  content: json['content'] as String?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$FileDiffToJson(FileDiff instance) => <String, dynamic>{
  'path': instance.path,
  'content': instance.content,
  'status': instance.status,
};

MessageResponse _$MessageResponseFromJson(Map<String, dynamic> json) =>
    MessageResponse(
      info: json['info'] as Map<String, dynamic>?,
      parts: (json['parts'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$MessageResponseToJson(MessageResponse instance) =>
    <String, dynamic>{'info': instance.info, 'parts': instance.parts};

Command _$CommandFromJson(Map<String, dynamic> json) => Command(
  id: json['id'] as String?,
  name: json['name'] as String?,
  description: json['description'] as String?,
  category: json['category'] as String?,
);

Map<String, dynamic> _$CommandToJson(Command instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'category': instance.category,
};

ToolIDs _$ToolIDsFromJson(Map<String, dynamic> json) => ToolIDs(
  ids: (json['ids'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$ToolIDsToJson(ToolIDs instance) => <String, dynamic>{
  'ids': instance.ids,
};

ToolList _$ToolListFromJson(Map<String, dynamic> json) => ToolList(
  tools: (json['tools'] as List<dynamic>?)
      ?.map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic> _$ToolListToJson(ToolList instance) => <String, dynamic>{
  'tools': instance.tools,
};

LSPStatus _$LSPStatusFromJson(Map<String, dynamic> json) => LSPStatus(
  name: json['name'] as String?,
  active: json['active'] as bool?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$LSPStatusToJson(LSPStatus instance) => <String, dynamic>{
  'name': instance.name,
  'active': instance.active,
  'status': instance.status,
};

FormatterStatus _$FormatterStatusFromJson(Map<String, dynamic> json) =>
    FormatterStatus(
      name: json['name'] as String?,
      active: json['active'] as bool?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$FormatterStatusToJson(FormatterStatus instance) =>
    <String, dynamic>{
      'name': instance.name,
      'active': instance.active,
      'status': instance.status,
    };

MCPStatus _$MCPStatusFromJson(Map<String, dynamic> json) => MCPStatus(
  name: json['name'] as String?,
  active: json['active'] as bool?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$MCPStatusToJson(MCPStatus instance) => <String, dynamic>{
  'name': instance.name,
  'active': instance.active,
  'status': instance.status,
};

Agent _$AgentFromJson(Map<String, dynamic> json) => Agent(
  id: json['id'] as String?,
  name: json['name'] as String?,
  description: json['description'] as String?,
  category: json['category'] as String?,
);

Map<String, dynamic> _$AgentToJson(Agent instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'category': instance.category,
};

LogEntry _$LogEntryFromJson(Map<String, dynamic> json) => LogEntry(
  service: json['service'] as String?,
  level: json['level'] as String?,
  message: json['message'] as String?,
  extra: json['extra'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$LogEntryToJson(LogEntry instance) => <String, dynamic>{
  'service': instance.service,
  'level': instance.level,
  'message': instance.message,
  'extra': instance.extra,
};

AuthCredentials _$AuthCredentialsFromJson(Map<String, dynamic> json) =>
    AuthCredentials(
      id: json['id'] as String?,
      credentials: json['credentials'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$AuthCredentialsToJson(AuthCredentials instance) =>
    <String, dynamic>{'id': instance.id, 'credentials': instance.credentials};

VcsInfo _$VcsInfoFromJson(Map<String, dynamic> json) => VcsInfo(
  branch: json['branch'] as String?,
  remote: json['remote'] as String?,
  isClean: json['isClean'] as bool?,
);

Map<String, dynamic> _$VcsInfoToJson(VcsInfo instance) => <String, dynamic>{
  'branch': instance.branch,
  'remote': instance.remote,
  'isClean': instance.isClean,
};

PathInfo _$PathInfoFromJson(Map<String, dynamic> json) =>
    PathInfo(path: json['path'] as String?);

Map<String, dynamic> _$PathInfoToJson(PathInfo instance) => <String, dynamic>{
  'path': instance.path,
};

ControlRequest _$ControlRequestFromJson(Map<String, dynamic> json) =>
    ControlRequest(
      id: json['id'] as String?,
      type: json['type'] as String?,
      body: json['body'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ControlRequestToJson(ControlRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'body': instance.body,
    };

ToastRequest _$ToastRequestFromJson(Map<String, dynamic> json) => ToastRequest(
  title: json['title'] as String?,
  message: json['message'] as String?,
  variant: json['variant'] as String?,
);

Map<String, dynamic> _$ToastRequestToJson(ToastRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'message': instance.message,
      'variant': instance.variant,
    };

FileNodeResponse _$FileNodeResponseFromJson(Map<String, dynamic> json) =>
    FileNodeResponse(
      name: json['name'] as String?,
      path: json['path'] as String?,
      isDirectory: json['isDirectory'] as bool?,
      size: (json['size'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FileNodeResponseToJson(FileNodeResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'path': instance.path,
      'isDirectory': instance.isDirectory,
      'size': instance.size,
    };

FileStatus _$FileStatusFromJson(Map<String, dynamic> json) => FileStatus(
  path: json['path'] as String?,
  status: json['status'] as String?,
  isTracked: json['isTracked'] as bool?,
);

Map<String, dynamic> _$FileStatusToJson(FileStatus instance) =>
    <String, dynamic>{
      'path': instance.path,
      'status': instance.status,
      'isTracked': instance.isTracked,
    };

ProviderListResponse _$ProviderListResponseFromJson(
  Map<String, dynamic> json,
) => ProviderListResponse(
  all: (json['all'] as List<dynamic>?)
      ?.map((e) => Provider.fromJson(e as Map<String, dynamic>))
      .toList(),
  default_: (json['default_'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  connected: (json['connected'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$ProviderListResponseToJson(
  ProviderListResponse instance,
) => <String, dynamic>{
  'all': instance.all,
  'default_': instance.default_,
  'connected': instance.connected,
};

ProviderAuthMethodsResponse _$ProviderAuthMethodsResponseFromJson(
  Map<String, dynamic> json,
) => ProviderAuthMethodsResponse(
  methods: (json['methods'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(
      k,
      (e as List<dynamic>)
          .map((e) => ProviderAuthMethod.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  ),
);

Map<String, dynamic> _$ProviderAuthMethodsResponseToJson(
  ProviderAuthMethodsResponse instance,
) => <String, dynamic>{'methods': instance.methods};

ConfigProvidersResponse _$ConfigProvidersResponseFromJson(
  Map<String, dynamic> json,
) => ConfigProvidersResponse(
  providers: (json['providers'] as List<dynamic>?)
      ?.map((e) => Provider.fromJson(e as Map<String, dynamic>))
      .toList(),
  default_: (json['default_'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
);

Map<String, dynamic> _$ConfigProvidersResponseToJson(
  ConfigProvidersResponse instance,
) => <String, dynamic>{
  'providers': instance.providers,
  'default_': instance.default_,
};

MCPAddRequest _$MCPAddRequestFromJson(Map<String, dynamic> json) =>
    MCPAddRequest(
      name: json['name'] as String?,
      config: json['config'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MCPAddRequestToJson(MCPAddRequest instance) =>
    <String, dynamic>{'name': instance.name, 'config': instance.config};

ExecuteCommandRequest _$ExecuteCommandRequestFromJson(
  Map<String, dynamic> json,
) => ExecuteCommandRequest(command: json['command'] as String?);

Map<String, dynamic> _$ExecuteCommandRequestToJson(
  ExecuteCommandRequest instance,
) => <String, dynamic>{'command': instance.command};

AppendPromptRequest _$AppendPromptRequestFromJson(Map<String, dynamic> json) =>
    AppendPromptRequest(text: json['text'] as String?);

Map<String, dynamic> _$AppendPromptRequestToJson(
  AppendPromptRequest instance,
) => <String, dynamic>{'text': instance.text};

ControlResponse _$ControlResponseFromJson(Map<String, dynamic> json) =>
    ControlResponse(body: json['body'] as Map<String, dynamic>?);

Map<String, dynamic> _$ControlResponseToJson(ControlResponse instance) =>
    <String, dynamic>{'body': instance.body};

MessageWithParts _$MessageWithPartsFromJson(Map<String, dynamic> json) =>
    MessageWithParts(
      info: json['info'] == null
          ? null
          : Message.fromJson(json['info'] as Map<String, dynamic>),
      parts: (json['parts'] as List<dynamic>?)
          ?.map((e) => MessagePart.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MessageWithPartsToJson(MessageWithParts instance) =>
    <String, dynamic>{'info': instance.info, 'parts': instance.parts};
