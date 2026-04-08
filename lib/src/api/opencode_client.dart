import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/project.dart';
import '../models/session.dart';
import '../models/response.dart';
import '../exceptions/opencode_exception.dart';
import '../utils/logger.dart';

part 'opencode_client.g.dart';

/// Main API client for interacting with the opencode server
@RestApi(baseUrl: "http://localhost:4096")
abstract class OpencodeClient {
  /// Factory constructor
  factory OpencodeClient(Dio dio, {String? baseUrl}) = _OpencodeClient;

  /// Set up Dio with error handling and logging
  static Dio createDio({String? username, String? password, String? baseUrl}) {
    final dio = Dio();

    // Set up basic auth if credentials are provided
    if (username != null && password != null) {
      dio.options.headers['authorization'] =
          'Basic ' + base64Encode(utf8.encode('$username:$password'));
    }

    // Set base URL if provided
    if (baseUrl != null) {
      dio.options.baseUrl = baseUrl;
    }

    // Add interceptors for logging and error handling
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException err, ErrorInterceptorHandler handler) async {
          // Log detailed error for debugging (internal use only)
          logger.e('API Error: ${err.message}', error: err);

          // Transform DioException to custom OpencodeException
          // The userMessage property will provide safe, non-leaking messages
          final exception = OpencodeException(
            'API request failed: ${err.message}',
            statusCode: err.response?.statusCode,
            originalError: err,
          );

          logger.e('Converted to OpencodeException', error: exception);
          return handler.reject(err);
        },
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          logger.d('API Request: ${options.method} ${options.uri}');
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          logger.i(
            'API Response: ${response.statusCode} for ${response.requestOptions.path}',
          );
          return handler.next(response);
        },
      ),
    );

    return dio;
  }

  // =============================================================================
  // Global API endpoints
  // =============================================================================

  /// Get server health and version
  @GET('/global/health')
  Future<HttpResponse<HealthResponse>> getHealthRaw();

  /// Get global events (SSE stream)
  @GET('/global/event')
  Stream<String> getGlobalEvents();

  // =============================================================================
  // Project API endpoints
  // =============================================================================

  /// List all projects
  @GET('/project')
  Future<List<Project>> getProjects();

  /// Get the current project
  @GET('/project/current')
  Future<Project> getCurrentProject();

  // =============================================================================
  // Path & VCS API endpoints
  // =============================================================================

  /// Get the current path
  @GET('/path')
  Future<HttpResponse<PathResponse>> getPathRaw();

  /// Get VCS info for the current project
  @GET('/vcs')
  Future<HttpResponse<VcsResponse>> getVcsRaw();

  // =============================================================================
  // Instance API endpoints
  // =============================================================================

  /// Dispose the current instance
  @POST('/instance/dispose')
  Future<HttpResponse<bool>> disposeInstanceRaw();

  // =============================================================================
  // Config API endpoints
  // =============================================================================

  /// Get config info
  @GET('/config')
  Future<HttpResponse<ConfigResponse>> getConfigRaw();

  /// Update config
  @PATCH('/config')
  Future<HttpResponse<ConfigResponse>> updateConfigRaw(
    @Body() Map<String, dynamic> body,
  );

  /// List providers and default models
  @GET('/config/providers')
  Future<HttpResponse<ConfigProvidersResponse>> getConfigProvidersRaw();

  // =============================================================================
  // Provider API endpoints
  // =============================================================================

  /// List all providers
  @GET('/provider')
  Future<HttpResponse<ProviderListResponse>> getProvidersRaw();

  /// Get provider authentication methods
  @GET('/provider/auth')
  Future<HttpResponse<ProviderAuthMethodsResponse>> getProviderAuthRaw();

  /// Authorize a provider using OAuth
  @POST('/provider/{id}/oauth/authorize')
  Future<HttpResponse<ProviderAuthAuthorization>> authorizeProviderRaw(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  /// Handle OAuth callback for a provider
  @POST('/provider/{id}/oauth/callback')
  Future<HttpResponse<bool>> providerOAuthCallbackRaw(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  // =============================================================================
  // Session API endpoints
  // =============================================================================

  /// List all sessions
  @GET('/session')
  Future<List<Session>> getSessions();

  /// Create a new session
  @POST('/session')
  Future<Session> createSession(@Body() Map<String, dynamic> body);

  /// Get session status for all sessions
  @GET('/session/status')
  Future<HttpResponse<Map<String, SessionStatus>>> getSessionStatusRaw();

  /// Get session details
  @GET('/session/{id}')
  Future<Session> getSession(@Path('id') String id);

  /// Delete a session and all its data
  @DELETE('/session/{id}')
  Future<bool> deleteSession(@Path('id') String id);

  /// Update session properties
  @PATCH('/session/{id}')
  Future<Session> updateSession(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  /// Get a session's child sessions
  @GET('/session/{id}/children')
  Future<List<Session>> getSessionChildren(@Path('id') String id);

  /// Get the todo list for a session
  @GET('/session/{id}/todo')
  Future<HttpResponse<List<Todo>>> getSessionTodoRaw(@Path('id') String id);

  /// Analyze app and create AGENTS.md
  @POST('/session/{id}/init')
  Future<HttpResponse<bool>> initSessionRaw(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  /// Fork an existing session at a message
  @POST('/session/{id}/fork')
  Future<HttpResponse<Session>> forkSessionRaw(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  /// Abort a running session
  @POST('/session/{id}/abort')
  Future<HttpResponse<bool>> abortSessionRaw(@Path('id') String id);

  /// Share a session
  @POST('/session/{id}/share')
  Future<HttpResponse<Session>> shareSessionRaw(@Path('id') String id);

  /// Unshare a session
  @DELETE('/session/{id}/share')
  Future<HttpResponse<Session>> unshareSessionRaw(@Path('id') String id);

  /// Get the diff for this session
  @GET('/session/{id}/diff')
  Future<HttpResponse<List<FileDiff>>> getSessionDiffRaw(
    @Path('id') String id, {
    @Query('messageID') String? messageID,
  });

  /// Summarize the session
  @POST('/session/{id}/summarize')
  Future<HttpResponse<bool>> summarizeSessionRaw(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  /// Revert a message
  @POST('/session/{id}/revert')
  Future<HttpResponse<bool>> revertMessageRaw(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  /// Restore all reverted messages
  @POST('/session/{id}/unrevert')
  Future<HttpResponse<bool>> unrevertMessagesRaw(@Path('id') String id);

  /// Respond to a permission request
  @POST('/session/{id}/permissions/{permissionID}')
  Future<HttpResponse<bool>> respondToPermissionRequestRaw(
    @Path('id') String id,
    @Path('permissionID') String permissionID,
    @Body() Map<String, dynamic> body,
  );

  /// List messages in a session
  @GET('/session/{id}/message')
  Future<HttpResponse<List<MessageWithParts>>> getMessagesRaw(
    @Path('id') String id, {
    @Query('limit') int? limit,
  });

  /// Send a message and wait for response
  @POST('/session/{id}/message')
  Future<HttpResponse<MessageWithParts>> sendMessageRaw(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  /// Get message details
  @GET('/session/{id}/message/{messageID}')
  Future<HttpResponse<MessageWithParts>> getMessageRaw(
    @Path('id') String id,
    @Path('messageID') String messageID,
  );

  /// Send a message asynchronously (no wait)
  @POST('/session/{id}/prompt_async')
  Future<void> sendMessageAsyncRaw(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  /// Execute a slash command
  @POST('/session/{id}/command')
  Future<HttpResponse<MessageWithParts>> executeCommandRaw(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  /// Run a shell command
  @POST('/session/{id}/shell')
  Future<HttpResponse<MessageWithParts>> runShellRaw(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  // =============================================================================
  // Commands API endpoints
  // =============================================================================

  /// List all commands
  @GET('/command')
  Future<HttpResponse<List<Command>>> getCommandsRaw();

  // =============================================================================
  // Files API endpoints
  // =============================================================================

  /// Search for text in files
  @GET('/find')
  Future<HttpResponse<List<FindResult>>> findInFilesRaw({
    @Query('pattern') required String pattern,
  });

  /// Find files and directories by name
  @GET('/find/file')
  Future<HttpResponse<List<String>>> findFilesRaw({
    @Query('query') required String query,
  });

  /// Find workspace symbols
  @GET('/find/symbol')
  Future<HttpResponse<List<Symbol>>> findSymbolsRaw({
    @Query('query') required String query,
  });

  /// List files and directories
  @GET('/file')
  Future<HttpResponse<List<FileNodeResponse>>> listFilesRaw({
    @Query('path') String? path,
  });

  /// Read a file
  @GET('/file/content')
  Future<HttpResponse<FileContentResponse>> getFileContentRaw({
    @Query('path') required String path,
  });

  /// Get status for tracked files
  @GET('/file/status')
  Future<HttpResponse<List<FileStatus>>> getFileStatusRaw();

  // =============================================================================
  // Tools (Experimental) API endpoints
  // =============================================================================

  /// List all tool IDs
  @GET('/experimental/tool/ids')
  Future<HttpResponse<ToolIDs>> getToolIdsRaw();

  /// List tools with JSON schemas for a model
  @GET('/experimental/tool')
  Future<HttpResponse<ToolList>> getToolsRaw({
    @Query('provider') String? provider,
    @Query('model') String? model,
  });

  // =============================================================================
  // LSP, Formatters & MCP API endpoints
  // =============================================================================

  /// Get LSP server status
  @GET('/lsp')
  Future<HttpResponse<List<LSPStatus>>> getLspStatusRaw();

  /// Get formatter status
  @GET('/formatter')
  Future<HttpResponse<List<FormatterStatus>>> getFormatterStatusRaw();

  /// Get MCP server status
  @GET('/mcp')
  Future<HttpResponse<Map<String, MCPStatus>>> getMcpStatusRaw();

  /// Add MCP server dynamically
  @POST('/mcp')
  Future<HttpResponse<MCPStatus>> addMcpServerRaw(
    @Body() Map<String, dynamic> body,
  );

  // =============================================================================
  // Agents API endpoints
  // =============================================================================

  /// List all available agents
  @GET('/agent')
  Future<HttpResponse<List<Agent>>> getAgentsRaw();

  // =============================================================================
  // Logging API endpoints
  // =============================================================================

  /// Write log entry
  @POST('/log')
  Future<HttpResponse<bool>> writeLogRaw(@Body() Map<String, dynamic> body);

  // =============================================================================
  // TUI API endpoints
  // =============================================================================

  /// Append text to the prompt
  @POST('/tui/append-prompt')
  Future<HttpResponse<bool>> tuiAppendPromptRaw(
    @Body() Map<String, dynamic> body,
  );

  /// Open the help dialog
  @POST('/tui/open-help')
  Future<HttpResponse<bool>> tuiOpenHelpRaw();

  /// Open the session selector
  @POST('/tui/open-sessions')
  Future<HttpResponse<bool>> tuiOpenSessionsRaw();

  /// Open the theme selector
  @POST('/tui/open-themes')
  Future<HttpResponse<bool>> tuiOpenThemesRaw();

  /// Open the model selector
  @POST('/tui/open-models')
  Future<HttpResponse<bool>> tuiOpenModelsRaw();

  /// Submit the current prompt
  @POST('/tui/submit-prompt')
  Future<HttpResponse<bool>> tuiSubmitPromptRaw();

  /// Clear the prompt
  @POST('/tui/clear-prompt')
  Future<HttpResponse<bool>> tuiClearPromptRaw();

  /// Execute a command
  @POST('/tui/execute-command')
  Future<HttpResponse<bool>> tuiExecuteCommandRaw(
    @Body() Map<String, dynamic> body,
  );

  /// Show toast
  @POST('/tui/show-toast')
  Future<HttpResponse<bool>> tuiShowToastRaw(@Body() Map<String, dynamic> body);

  /// Wait for the next control request
  @GET('/tui/control/next')
  Future<HttpResponse<ControlRequest>> tuiControlNextRaw();

  /// Respond to a control request
  @POST('/tui/control/response')
  Future<HttpResponse<bool>> tuiControlResponseRaw(
    @Body() Map<String, dynamic> body,
  );

  // =============================================================================
  // Auth API endpoints
  // =============================================================================

  /// Set authentication credentials
  @PUT('/auth/{id}')
  Future<HttpResponse<bool>> setAuthRaw(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  // =============================================================================
  // Events API endpoints (Server-Sent Events streams)
  // =============================================================================

  /// Get events (SSE stream)
  @GET('/event')
  Stream<String> getEvents();
}
