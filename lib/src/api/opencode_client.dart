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
  @Deprecated("Use Opencode.global.getHealthRaw() instead")
  @GET('/global/health')
  Future<HttpResponse<HealthResponse>> getHealthRaw();

  /// Get global events (SSE stream)
  @Deprecated("Use Opencode.global.getGlobalEvents() instead")
  @GET('/global/event')
  Stream<String> getGlobalEvents();

  // =============================================================================
  // Project API endpoints
  // =============================================================================

  /// List all projects
  @Deprecated('Use Opencode.project.getProjects() instead')
  @GET('/project')
  Future<List<Project>> getProjects();

  /// Get the current project
  @Deprecated('Use Opencode.project.getCurrentProject() instead')
  @GET('/project/current')
  Future<Project> getCurrentProject();

  // =============================================================================
  // Path & VCS API endpoints
  // =============================================================================

  /// Get the current path
  @Deprecated('Use Opencode.path.getPathRaw() instead')
  @GET('/path')
  Future<HttpResponse<PathResponse>> getPathRaw();

  /// Get VCS info for the current project
  @Deprecated('Use Opencode.vcs.getVcsRaw() instead')
  @GET('/vcs')
  Future<HttpResponse<VcsResponse>> getVcsRaw();

  // =============================================================================
  // Instance API endpoints
  // =============================================================================

  /// Dispose the current instance
  @Deprecated('Use Opencode.instance.disposeInstanceRaw() instead')
  @POST('/instance/dispose')
  Future<HttpResponse<bool>> disposeInstanceRaw();

  // =============================================================================
  // Config API endpoints
  // =============================================================================

  /// Get config info
  @Deprecated('Use Opencode.config.getConfigRaw() instead')
  @GET('/config')
  Future<HttpResponse<ConfigResponse>> getConfigRaw();

  /// Update config
  @Deprecated('Use Opencode.config.updateConfigRaw() instead')
  @PATCH('/config')
  Future<HttpResponse<ConfigResponse>> updateConfigRaw(
    @Body() Map<String, dynamic> body,
  );

  /// List providers and default models
  @Deprecated('Use Opencode.config.getConfigProvidersRaw() instead')
  @GET('/config/providers')
  Future<HttpResponse<ConfigProvidersResponse>> getConfigProvidersRaw();

  // =============================================================================
  // Provider API endpoints
  // =============================================================================

  /// List all providers
  @Deprecated('Use Opencode.provider.getProvidersRaw() instead')
  @GET('/provider')
  Future<HttpResponse<ProviderListResponse>> getProvidersRaw();

  /// Get provider authentication methods
  @Deprecated('Use Opencode.provider.getProviderAuthRaw() instead')
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
  @Deprecated('Use Opencode.session.getSessions() instead')
  @GET('/session')
  Future<List<Session>> getSessions();

  /// Create a new session
  @Deprecated('Use Opencode.session.createSession() instead')
  @POST('/session')
  Future<Session> createSession(@Body() Map<String, dynamic> body);

  /// Get session status for all sessions
  @Deprecated('Use Opencode.session.getSessionStatusRaw() instead')
  @GET('/session/status')
  Future<HttpResponse<Map<String, SessionStatus>>> getSessionStatusRaw();

  /// Get session details
  @Deprecated('Use Opencode.session.getSession() instead')
  @GET('/session/{id}')
  Future<Session> getSession(@Path('id') String id);

  /// Delete a session and all its data
  @Deprecated('Use Opencode.session.deleteSession() instead')
  @DELETE('/session/{id}')
  Future<bool> deleteSession(@Path('id') String id);

  /// Update session properties
  @Deprecated('Use Opencode.session.updateSession() instead')
  @PATCH('/session/{id}')
  Future<Session> updateSession(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  /// Get a session's child sessions
  @Deprecated('Use Opencode.session.getSessionChildren() instead')
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
  @Deprecated('Use Opencode.session.forkSessionRaw() instead')
  @POST('/session/{id}/fork')
  Future<HttpResponse<Session>> forkSessionRaw(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  /// Abort a running session
  @POST('/session/{id}/abort')
  Future<HttpResponse<bool>> abortSessionRaw(@Path('id') String id);

  /// Share a session
  @Deprecated('Use Opencode.session.shareSessionRaw() instead')
  @POST('/session/{id}/share')
  Future<HttpResponse<Session>> shareSessionRaw(@Path('id') String id);

  /// Unshare a session
  @Deprecated('Use Opencode.session.unshareSessionRaw() instead')
  @DELETE('/session/{id}/share')
  Future<HttpResponse<Session>> unshareSessionRaw(@Path('id') String id);

  /// Get the diff for this session
  @Deprecated('Use Opencode.session.getSessionDiffRaw() instead')
  @GET('/session/{id}/diff')
  Future<HttpResponse<List<FileDiff>>> getSessionDiffRaw(
    @Path('id') String id, {
    @Query('messageID') String? messageID,
  });

  /// Summarize the session
  @Deprecated('Use Opencode.session.summarizeSessionRaw() instead')
  @POST('/session/{id}/summarize')
  Future<HttpResponse<bool>> summarizeSessionRaw(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  /// Revert a message
  @Deprecated('Use Opencode.session.revertMessageRaw() instead')
  @POST('/session/{id}/revert')
  Future<HttpResponse<bool>> revertMessageRaw(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  /// Restore all reverted messages
  @Deprecated('Use Opencode.session.unrevertMessagesRaw() instead')
  @POST('/session/{id}/unrevert')
  Future<HttpResponse<bool>> unrevertMessagesRaw(@Path('id') String id);

  /// Respond to a permission request
  @Deprecated('Use Opencode.session.respondToPermissionRequestRaw() instead')
  @POST('/session/{id}/permissions/{permissionID}')
  Future<HttpResponse<bool>> respondToPermissionRequestRaw(
    @Path('id') String id,
    @Path('permissionID') String permissionID,
    @Body() Map<String, dynamic> body,
  );

  /// List messages in a session
  @Deprecated('Use Opencode.session.getMessagesRaw() instead')
  @GET('/session/{id}/message')
  Future<HttpResponse<List<MessageWithParts>>> getMessagesRaw(
    @Path('id') String id, {
    @Query('limit') int? limit,
  });

  /// Send a message and wait for response
  @Deprecated('Use Opencode.session.sendMessageRaw() instead')
  @POST('/session/{id}/message')
  Future<HttpResponse<MessageWithParts>> sendMessageRaw(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  /// Get message details
  @Deprecated('Use Opencode.session.getMessageRaw() instead')
  @GET('/session/{id}/message/{messageID}')
  Future<HttpResponse<MessageWithParts>> getMessageRaw(
    @Path('id') String id,
    @Path('messageID') String messageID,
  );

  /// Send a message asynchronously (no wait)
  @Deprecated('Use Opencode.session.sendMessageAsyncRaw() instead')
  @POST('/session/{id}/prompt_async')
  Future<void> sendMessageAsyncRaw(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  /// Execute a slash command
  @Deprecated('Use Opencode.session.executeCommandRaw() instead')
  @POST('/session/{id}/command')
  Future<HttpResponse<MessageWithParts>> executeCommandRaw(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  /// Run a shell command
  @Deprecated('Use Opencode.session.runShellRaw() instead')
  @POST('/session/{id}/shell')
  Future<HttpResponse<MessageWithParts>> runShellRaw(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  // =============================================================================
  // Commands API endpoints
  // =============================================================================

  /// List all commands
  @Deprecated('Use Opencode.commands.getCommandsRaw() instead')
  @GET('/command')
  Future<HttpResponse<List<Command>>> getCommandsRaw();

  // =============================================================================
  // Files API endpoints
  // =============================================================================

  /// Search for text in files
  @Deprecated('Use Opencode.files.findInFilesRaw() instead')
  @GET('/find')
  Future<HttpResponse<List<FindResult>>> findInFilesRaw({
    @Query('pattern') required String pattern,
  });

  /// Find files and directories by name
  @Deprecated('Use Opencode.files.findFilesRaw() instead')
  @GET('/find/file')
  Future<HttpResponse<List<String>>> findFilesRaw({
    @Query('query') required String query,
  });

  /// Find workspace symbols
  @Deprecated('Use Opencode.files.findSymbolsRaw() instead')
  @GET('/find/symbol')
  Future<HttpResponse<List<Symbol>>> findSymbolsRaw({
    @Query('query') required String query,
  });

  /// List files and directories
  @Deprecated('Use Opencode.files.listFilesRaw() instead')
  @GET('/file')
  Future<HttpResponse<List<FileNodeResponse>>> listFilesRaw({
    @Query('path') String? path,
  });

  /// Read a file
  @Deprecated('Use Opencode.files.getFileContentRaw() instead')
  @GET('/file/content')
  Future<HttpResponse<FileContentResponse>> getFileContentRaw({
    @Query('path') required String path,
  });

  /// Get status for tracked files
  @Deprecated('Use Opencode.files.getFileStatusRaw() instead')
  @GET('/file/status')
  Future<HttpResponse<List<FileStatus>>> getFileStatusRaw();

  // =============================================================================
  // Tools (Experimental) API endpoints
  // =============================================================================

  /// List all tool IDs
  @Deprecated('Use Opencode.experimental.getToolIdsRaw() instead')
  @GET('/experimental/tool/ids')
  Future<HttpResponse<ToolIDs>> getToolIdsRaw();

  /// List tools with JSON schemas for a model
  @Deprecated('Use Opencode.experimental.getToolsRaw() instead')
  @GET('/experimental/tool')
  Future<HttpResponse<ToolList>> getToolsRaw({
    @Query('provider') String? provider,
    @Query('model') String? model,
  });

  // =============================================================================
  // LSP, Formatters & MCP API endpoints
  // =============================================================================

  /// Get LSP server status
  @Deprecated('Use Opencode.lspFormatterMcp.getLspStatusRaw() instead')
  @GET('/lsp')
  Future<HttpResponse<List<LSPStatus>>> getLspStatusRaw();

  /// Get formatter status
  @Deprecated('Use Opencode.lspFormatterMcp.getFormatterStatusRaw() instead')
  @GET('/formatter')
  Future<HttpResponse<List<FormatterStatus>>> getFormatterStatusRaw();

  /// Get MCP server status
  @Deprecated('Use Opencode.lspFormatterMcp.getMcpStatusRaw() instead')
  @GET('/mcp')
  Future<HttpResponse<Map<String, MCPStatus>>> getMcpStatusRaw();

  /// Add MCP server dynamically
  @Deprecated('Use Opencode.lspFormatterMcp.addMcpServerRaw() instead')
  @POST('/mcp')
  Future<HttpResponse<MCPStatus>> addMcpServerRaw(
    @Body() Map<String, dynamic> body,
  );

  // =============================================================================
  // Agents API endpoints
  // =============================================================================

  /// List all available agents
  @Deprecated('Use Opencode.agents.getAgentsRaw() instead')
  @GET('/agent')
  Future<HttpResponse<List<Agent>>> getAgentsRaw();

  // =============================================================================
  // Logging API endpoints
  // =============================================================================

  /// Write log entry
  @Deprecated('Use Opencode.logging.writeLogRaw() instead')
  @POST('/log')
  Future<HttpResponse<bool>> writeLogRaw(@Body() Map<String, dynamic> body);

  // =============================================================================
  // TUI API endpoints
  // =============================================================================

  /// Append text to the prompt
  @Deprecated('Use Opencode.tui.tuiAppendPromptRaw() instead')
  @POST('/tui/append-prompt')
  Future<HttpResponse<bool>> tuiAppendPromptRaw(
    @Body() Map<String, dynamic> body,
  );

  /// Open the help dialog
  @Deprecated('Use Opencode.tui.tuiOpenHelpRaw() instead')
  @POST('/tui/open-help')
  Future<HttpResponse<bool>> tuiOpenHelpRaw();

  /// Open the session selector
  @Deprecated('Use Opencode.tui.tuiOpenSessionsRaw() instead')
  @POST('/tui/open-sessions')
  Future<HttpResponse<bool>> tuiOpenSessionsRaw();

  /// Open the theme selector
  @Deprecated('Use Opencode.tui.tuiOpenThemesRaw() instead')
  @POST('/tui/open-themes')
  Future<HttpResponse<bool>> tuiOpenThemesRaw();

  /// Open the model selector
  @Deprecated('Use Opencode.tui.tuiOpenModelsRaw() instead')
  @POST('/tui/open-models')
  Future<HttpResponse<bool>> tuiOpenModelsRaw();

  /// Submit the current prompt
  @Deprecated('Use Opencode.tui.tuiSubmitPromptRaw() instead')
  @POST('/tui/submit-prompt')
  Future<HttpResponse<bool>> tuiSubmitPromptRaw();

  /// Clear the prompt
  @Deprecated('Use Opencode.tui.tuiClearPromptRaw() instead')
  @POST('/tui/clear-prompt')
  Future<HttpResponse<bool>> tuiClearPromptRaw();

  /// Execute a command
  @Deprecated('Use Opencode.tui.tuiExecuteCommandRaw() instead')
  @POST('/tui/execute-command')
  Future<HttpResponse<bool>> tuiExecuteCommandRaw(
    @Body() Map<String, dynamic> body,
  );

  /// Show toast
  @Deprecated('Use Opencode.tui.tuiShowToastRaw() instead')
  @POST('/tui/show-toast')
  Future<HttpResponse<bool>> tuiShowToastRaw(@Body() Map<String, dynamic> body);

  /// Wait for the next control request
  @Deprecated('Use Opencode.tui.tuiControlNextRaw() instead')
  @GET('/tui/control/next')
  Future<HttpResponse<ControlRequest>> tuiControlNextRaw();

  /// Respond to a control request
  @Deprecated('Use Opencode.tui.tuiControlResponseRaw() instead')
  @POST('/tui/control/response')
  Future<HttpResponse<bool>> tuiControlResponseRaw(
    @Body() Map<String, dynamic> body,
  );

  // =============================================================================
  // Auth API endpoints
  // =============================================================================

  /// Set authentication credentials
  @Deprecated('Use Opencode.auth.setAuthRaw() instead')
  @PUT('/auth/{id}')
  Future<HttpResponse<bool>> setAuthRaw(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  // =============================================================================
  // Events API endpoints (Server-Sent Events streams)
  // =============================================================================

  /// Get events (SSE stream)
  @Deprecated('Use Opencode.events.getEvents() instead')
  @GET('/event')
  Stream<String> getEvents();
}
