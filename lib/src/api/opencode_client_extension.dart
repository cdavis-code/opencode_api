import 'opencode_client.dart';
import '../models/response.dart';
import '../models/session.dart';
import '../utils/logger.dart';

/// Extension methods for easier usage of the OpencodeClient
extension OpencodeClientExtension on OpencodeClient {
  /// Get server health and version (convenience method that handles response extraction)
  @Deprecated('Use Opencode.global.getHealth() instead')
  Future<HealthResponse> getHealth() async {
    try {
      final response = await getHealthRaw();
      return response.data;
    } catch (e) {
      logger.e('Error getting health information', error: e);
      rethrow;
    }
  }

  /// Get the current path (convenience method that handles response extraction)
  @Deprecated('Use Opencode.path.getPath() instead')
  Future<PathResponse> getPath() async {
    try {
      final response = await getPathRaw();
      return response.data;
    } catch (e) {
      logger.e('Error getting path information', error: e);
      rethrow;
    }
  }

  /// Get VCS info for the current project (convenience method that handles response extraction)
  @Deprecated('Use Opencode.vcs.getVcs() instead')
  Future<VcsResponse> getVcs() async {
    try {
      final response = await getVcsRaw();
      return response.data;
    } catch (e) {
      logger.e('Error getting VCS information', error: e);
      rethrow;
    }
  }

  /// Search for text in files (convenience method that handles response extraction)
  @Deprecated('Use Opencode.files.findInFiles() instead')
  Future<List<FindResult>> findInFiles({required String pattern}) async {
    try {
      final response = await findInFilesRaw(pattern: pattern);
      return response.data;
    } catch (e) {
      logger.e('Error finding in files', error: e);
      rethrow;
    }
  }

  /// Find files and directories by name (convenience method that handles response extraction)
  @Deprecated('Use Opencode.files.findFiles() instead')
  Future<List<String>> findFiles({required String query}) async {
    try {
      final response = await findFilesRaw(query: query);
      return response.data;
    } catch (e) {
      logger.e('Error finding files', error: e);
      rethrow;
    }
  }

  /// Find workspace symbols (convenience method that handles response extraction)
  @Deprecated('Use Opencode.files.findSymbols() instead')
  Future<List<Symbol>> findSymbols({required String query}) async {
    try {
      final response = await findSymbolsRaw(query: query);
      return response.data;
    } catch (e) {
      logger.e('Error finding symbols', error: e);
      rethrow;
    }
  }

  /// Read a file (convenience method that handles response extraction)
  @Deprecated('Use Opencode.files.getFileContent() instead')
  Future<FileContentResponse> getFileContent({required String path}) async {
    try {
      final response = await getFileContentRaw(path: path);
      return response.data;
    } catch (e) {
      logger.e('Error getting file content', error: e);
      rethrow;
    }
  }

  /// Get the todo list for a session (convenience method that handles response extraction)
  @Deprecated('Use Opencode.session.getSessionTodo() instead')
  Future<List<Todo>> getSessionTodo(String id) async {
    try {
      final response = await getSessionTodoRaw(id);
      return response.data;
    } catch (e) {
      logger.e('Error getting session todo', error: e);
      rethrow;
    }
  }

  /// Initialize a session (convenience method that handles response extraction)
  @Deprecated('Use Opencode.session.initSession() instead')
  Future<bool> initSession(String id, Map<String, dynamic> body) async {
    try {
      final response = await initSessionRaw(id, body);
      return response.data;
    } catch (e) {
      logger.e('Error initializing session', error: e);
      rethrow;
    }
  }

  /// Fork a session (convenience method that handles response extraction)
  @Deprecated('Use Opencode.session.forkSession() instead')
  Future<Session> forkSession(String id, Map<String, dynamic> body) async {
    try {
      final response = await forkSessionRaw(id, body);
      return response.data;
    } catch (e) {
      logger.e('Error forking session', error: e);
      rethrow;
    }
  }

  /// Abort a session (convenience method that handles response extraction)
  @Deprecated('Use Opencode.session.abortSession() instead')
  Future<bool> abortSession(String id) async {
    try {
      final response = await abortSessionRaw(id);
      return response.data;
    } catch (e) {
      logger.e('Error aborting session', error: e);
      rethrow;
    }
  }

  /// Share a session (convenience method that handles response extraction)
  @Deprecated('Use Opencode.session.shareSession() instead')
  Future<Session> shareSession(String id) async {
    try {
      final response = await shareSessionRaw(id);
      return response.data;
    } catch (e) {
      logger.e('Error sharing session', error: e);
      rethrow;
    }
  }

  /// Unshare a session (convenience method that handles response extraction)
  @Deprecated('Use Opencode.session.unshareSession() instead')
  Future<Session> unshareSession(String id) async {
    try {
      final response = await unshareSessionRaw(id);
      return response.data;
    } catch (e) {
      logger.e('Error unsharing session', error: e);
      rethrow;
    }
  }

  /// Get session diff (convenience method that handles response extraction)
  @Deprecated('Use Opencode.session.getSessionDiff() instead')
  Future<List<FileDiff>> getSessionDiff(String id, {String? messageID}) async {
    try {
      final response = await getSessionDiffRaw(id, messageID: messageID);
      return response.data;
    } catch (e) {
      logger.e('Error getting session diff', error: e);
      rethrow;
    }
  }

  /// Summarize a session (convenience method that handles response extraction)
  @Deprecated('Use Opencode.session.summarizeSession() instead')
  Future<bool> summarizeSession(String id, Map<String, dynamic> body) async {
    try {
      final response = await summarizeSessionRaw(id, body);
      return response.data;
    } catch (e) {
      logger.e('Error summarizing session', error: e);
      rethrow;
    }
  }

  /// Revert a message (convenience method that handles response extraction)
  @Deprecated('Use Opencode.session.revertMessage() instead')
  Future<bool> revertMessage(String id, Map<String, dynamic> body) async {
    try {
      final response = await revertMessageRaw(id, body);
      return response.data;
    } catch (e) {
      logger.e('Error reverting message', error: e);
      rethrow;
    }
  }

  /// Restore all reverted messages (convenience method that handles response extraction)
  @Deprecated('Use Opencode.session.unrevertMessages() instead')
  Future<bool> unrevertMessages(String id) async {
    try {
      final response = await unrevertMessagesRaw(id);
      return response.data;
    } catch (e) {
      logger.e('Error unreverting messages', error: e);
      rethrow;
    }
  }

  /// Respond to a permission request (convenience method that handles response extraction)
  @Deprecated('Use Opencode.session.respondToPermissionRequest() instead')
  Future<bool> respondToPermissionRequest(
    String id,
    String permissionID,
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await respondToPermissionRequestRaw(
        id,
        permissionID,
        body,
      );
      return response.data;
    } catch (e) {
      logger.e('Error responding to permission request', error: e);
      rethrow;
    }
  }

  // =============================================================================
  // Instance API endpoints
  // =============================================================================

  /// Dispose the current instance
  @Deprecated('Use Opencode.instance.disposeInstance() instead')
  Future<bool> disposeInstance() async {
    try {
      final response = await disposeInstanceRaw();
      return response.data;
    } catch (e) {
      logger.e('Error disposing instance', error: e);
      rethrow;
    }
  }

  // =============================================================================
  // Config API endpoints
  // =============================================================================

  /// Get config info
  @Deprecated('Use Opencode.config.getConfig() instead')
  Future<ConfigResponse> getConfig() async {
    try {
      final response = await getConfigRaw();
      return response.data;
    } catch (e) {
      logger.e('Error getting config', error: e);
      rethrow;
    }
  }

  /// Update config
  @Deprecated('Use Opencode.config.updateConfig() instead')
  Future<ConfigResponse> updateConfig(Map<String, dynamic> body) async {
    try {
      final response = await updateConfigRaw(body);
      return response.data;
    } catch (e) {
      logger.e('Error updating config', error: e);
      rethrow;
    }
  }

  /// List providers and default models
  @Deprecated('Use Opencode.config.getConfigProviders() instead')
  Future<ConfigProvidersResponse> getConfigProviders() async {
    try {
      final response = await getConfigProvidersRaw();
      return response.data;
    } catch (e) {
      logger.e('Error getting config providers', error: e);
      rethrow;
    }
  }

  // =============================================================================
  // Provider API endpoints
  // =============================================================================

  /// List all providers
  @Deprecated('Use Opencode.provider.getProviders() instead')
  Future<ProviderListResponse> getProviders() async {
    try {
      final response = await getProvidersRaw();
      return response.data;
    } catch (e) {
      logger.e('Error getting providers', error: e);
      rethrow;
    }
  }

  /// Get provider authentication methods
  @Deprecated('Use Opencode.provider.getProviderAuth() instead')
  Future<ProviderAuthMethodsResponse> getProviderAuth() async {
    try {
      final response = await getProviderAuthRaw();
      return response.data;
    } catch (e) {
      logger.e('Error getting provider auth methods', error: e);
      rethrow;
    }
  }

  /// Authorize a provider using OAuth
  @Deprecated('Use Opencode.provider.authorizeProvider() instead')
  Future<ProviderAuthAuthorization> authorizeProvider(
    String id,
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await authorizeProviderRaw(id, body);
      return response.data;
    } catch (e) {
      logger.e('Error authorizing provider', error: e);
      rethrow;
    }
  }

  /// Handle OAuth callback for a provider
  @Deprecated('Use Opencode.provider.providerOAuthCallback() instead')
  Future<bool> providerOAuthCallback(
    String id,
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await providerOAuthCallbackRaw(id, body);
      return response.data;
    } catch (e) {
      logger.e('Error handling OAuth callback', error: e);
      rethrow;
    }
  }

  // =============================================================================
  // Session Status API endpoint
  // =============================================================================

  /// Get session status for all sessions
  @Deprecated('Use Opencode.session.getSessionStatus() instead')
  Future<Map<String, SessionStatus>> getSessionStatus() async {
    try {
      final response = await getSessionStatusRaw();
      return response.data;
    } catch (e) {
      logger.e('Error getting session status', error: e);
      rethrow;
    }
  }

  // =============================================================================
  // Commands API endpoints
  // =============================================================================

  /// List all commands
  @Deprecated('Use Opencode.commands.getCommands() instead')
  Future<List<Command>> getCommands() async {
    try {
      final response = await getCommandsRaw();
      return response.data;
    } catch (e) {
      logger.e('Error getting commands', error: e);
      rethrow;
    }
  }

  // =============================================================================
  // Messages API endpoints
  // =============================================================================

  /// List messages in a session
  @Deprecated('Use Opencode.session.getMessages() instead')
  Future<List<MessageWithParts>> getMessages(String id, {int? limit}) async {
    try {
      final response = await getMessagesRaw(id, limit: limit);
      return response.data;
    } catch (e) {
      logger.e('Error getting messages', error: e);
      rethrow;
    }
  }

  /// Send a message and wait for response
  @Deprecated('Use Opencode.session.sendMessage() instead')
  Future<MessageWithParts> sendMessage(
    String id,
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await sendMessageRaw(id, body);
      return response.data;
    } catch (e) {
      logger.e('Error sending message', error: e);
      rethrow;
    }
  }

  /// Get message details
  @Deprecated('Use Opencode.session.getMessage() instead')
  Future<MessageWithParts> getMessage(String id, String messageID) async {
    try {
      final response = await getMessageRaw(id, messageID);
      return response.data;
    } catch (e) {
      logger.e('Error getting message', error: e);
      rethrow;
    }
  }

  /// Send a message asynchronously (no wait)
  @Deprecated('Use Opencode.session.sendMessageAsync() instead')
  Future<void> sendMessageAsync(String id, Map<String, dynamic> body) async {
    try {
      await sendMessageAsyncRaw(id, body);
    } catch (e) {
      logger.e('Error sending async message', error: e);
      rethrow;
    }
  }

  /// Execute a slash command
  @Deprecated('Use Opencode.session.executeCommand() instead')
  Future<MessageWithParts> executeCommand(
    String id,
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await executeCommandRaw(id, body);
      return response.data;
    } catch (e) {
      logger.e('Error executing command', error: e);
      rethrow;
    }
  }

  /// Run a shell command
  @Deprecated('Use Opencode.session.runShell() instead')
  Future<MessageWithParts> runShell(
    String id,
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await runShellRaw(id, body);
      return response.data;
    } catch (e) {
      logger.e('Error running shell command', error: e);
      rethrow;
    }
  }

  // =============================================================================
  // Files API endpoints
  // =============================================================================

  /// List files and directories
  @Deprecated('Use Opencode.files.listFiles() instead')
  Future<List<FileNodeResponse>> listFiles({String? path}) async {
    try {
      final response = await listFilesRaw(path: path);
      return response.data;
    } catch (e) {
      logger.e('Error listing files', error: e);
      rethrow;
    }
  }

  /// Get status for tracked files
  @Deprecated('Use Opencode.files.getFileStatus() instead')
  Future<List<FileStatus>> getFileStatus() async {
    try {
      final response = await getFileStatusRaw();
      return response.data;
    } catch (e) {
      logger.e('Error getting file status', error: e);
      rethrow;
    }
  }

  // =============================================================================
  // Tools (Experimental) API endpoints
  // =============================================================================

  /// List all tool IDs
  @Deprecated('Use Opencode.experimental.getToolIds() instead')
  Future<ToolIDs> getToolIds() async {
    try {
      final response = await getToolIdsRaw();
      return response.data;
    } catch (e) {
      logger.e('Error getting tool IDs', error: e);
      rethrow;
    }
  }

  /// List tools with JSON schemas for a model
  @Deprecated('Use Opencode.experimental.getTools() instead')
  Future<ToolList> getTools({String? provider, String? model}) async {
    try {
      final response = await getToolsRaw(provider: provider, model: model);
      return response.data;
    } catch (e) {
      logger.e('Error getting tools', error: e);
      rethrow;
    }
  }

  // =============================================================================
  // LSP, Formatters & MCP API endpoints
  // =============================================================================

  /// Get LSP server status
  @Deprecated('Use Opencode.lspFormatterMcp.getLspStatus() instead')
  Future<List<LSPStatus>> getLspStatus() async {
    try {
      final response = await getLspStatusRaw();
      return response.data;
    } catch (e) {
      logger.e('Error getting LSP status', error: e);
      rethrow;
    }
  }

  /// Get formatter status
  @Deprecated('Use Opencode.lspFormatterMcp.getFormatterStatus() instead')
  Future<List<FormatterStatus>> getFormatterStatus() async {
    try {
      final response = await getFormatterStatusRaw();
      return response.data;
    } catch (e) {
      logger.e('Error getting formatter status', error: e);
      rethrow;
    }
  }

  /// Get MCP server status
  @Deprecated('Use Opencode.lspFormatterMcp.getMcpStatus() instead')
  Future<Map<String, MCPStatus>> getMcpStatus() async {
    try {
      final response = await getMcpStatusRaw();
      return response.data;
    } catch (e) {
      logger.e('Error getting MCP status', error: e);
      rethrow;
    }
  }

  /// Add MCP server dynamically
  @Deprecated('Use Opencode.lspFormatterMcp.addMcpServer() instead')
  Future<MCPStatus> addMcpServer(Map<String, dynamic> body) async {
    try {
      final response = await addMcpServerRaw(body);
      return response.data;
    } catch (e) {
      logger.e('Error adding MCP server', error: e);
      rethrow;
    }
  }

  // =============================================================================
  // Agents API endpoints
  // =============================================================================

  /// List all available agents
  @Deprecated('Use Opencode.agents.getAgents() instead')
  Future<List<Agent>> getAgents() async {
    try {
      final response = await getAgentsRaw();
      return response.data;
    } catch (e) {
      logger.e('Error getting agents', error: e);
      rethrow;
    }
  }

  // =============================================================================
  // Logging API endpoints
  // =============================================================================

  /// Write log entry
  @Deprecated('Use Opencode.logging.writeLog() instead')
  Future<bool> writeLog(Map<String, dynamic> body) async {
    try {
      final response = await writeLogRaw(body);
      return response.data;
    } catch (e) {
      logger.e('Error writing log', error: e);
      rethrow;
    }
  }

  // =============================================================================
  // TUI API endpoints
  // =============================================================================

  /// Append text to the prompt
  @Deprecated('Use Opencode.tui.tuiAppendPrompt() instead')
  Future<bool> tuiAppendPrompt(Map<String, dynamic> body) async {
    try {
      final response = await tuiAppendPromptRaw(body);
      return response.data;
    } catch (e) {
      logger.e('Error appending prompt', error: e);
      rethrow;
    }
  }

  /// Open the help dialog
  @Deprecated('Use Opencode.tui.tuiOpenHelp() instead')
  Future<bool> tuiOpenHelp() async {
    try {
      final response = await tuiOpenHelpRaw();
      return response.data;
    } catch (e) {
      logger.e('Error opening help', error: e);
      rethrow;
    }
  }

  /// Open the session selector
  @Deprecated('Use Opencode.tui.tuiOpenSessions() instead')
  Future<bool> tuiOpenSessions() async {
    try {
      final response = await tuiOpenSessionsRaw();
      return response.data;
    } catch (e) {
      logger.e('Error opening sessions', error: e);
      rethrow;
    }
  }

  /// Open the theme selector
  @Deprecated('Use Opencode.tui.tuiOpenThemes() instead')
  Future<bool> tuiOpenThemes() async {
    try {
      final response = await tuiOpenThemesRaw();
      return response.data;
    } catch (e) {
      logger.e('Error opening themes', error: e);
      rethrow;
    }
  }

  /// Open the model selector
  @Deprecated('Use Opencode.tui.tuiOpenModels() instead')
  Future<bool> tuiOpenModels() async {
    try {
      final response = await tuiOpenModelsRaw();
      return response.data;
    } catch (e) {
      logger.e('Error opening models', error: e);
      rethrow;
    }
  }

  /// Submit the current prompt
  @Deprecated('Use Opencode.tui.tuiSubmitPrompt() instead')
  Future<bool> tuiSubmitPrompt() async {
    try {
      final response = await tuiSubmitPromptRaw();
      return response.data;
    } catch (e) {
      logger.e('Error submitting prompt', error: e);
      rethrow;
    }
  }

  /// Clear the prompt
  @Deprecated('Use Opencode.tui.tuiClearPrompt() instead')
  Future<bool> tuiClearPrompt() async {
    try {
      final response = await tuiClearPromptRaw();
      return response.data;
    } catch (e) {
      logger.e('Error clearing prompt', error: e);
      rethrow;
    }
  }

  /// Execute a command
  @Deprecated('Use Opencode.tui.tuiExecuteCommand() instead')
  Future<bool> tuiExecuteCommand(Map<String, dynamic> body) async {
    try {
      final response = await tuiExecuteCommandRaw(body);
      return response.data;
    } catch (e) {
      logger.e('Error executing TUI command', error: e);
      rethrow;
    }
  }

  /// Show toast
  @Deprecated('Use Opencode.tui.tuiShowToast() instead')
  Future<bool> tuiShowToast(Map<String, dynamic> body) async {
    try {
      final response = await tuiShowToastRaw(body);
      return response.data;
    } catch (e) {
      logger.e('Error showing toast', error: e);
      rethrow;
    }
  }

  /// Wait for the next control request
  @Deprecated('Use Opencode.tui.tuiControlNext() instead')
  Future<ControlRequest> tuiControlNext() async {
    try {
      final response = await tuiControlNextRaw();
      return response.data;
    } catch (e) {
      logger.e('Error getting control request', error: e);
      rethrow;
    }
  }

  /// Respond to a control request
  @Deprecated('Use Opencode.tui.tuiControlResponse() instead')
  Future<bool> tuiControlResponse(Map<String, dynamic> body) async {
    try {
      final response = await tuiControlResponseRaw(body);
      return response.data;
    } catch (e) {
      logger.e('Error sending control response', error: e);
      rethrow;
    }
  }

  // =============================================================================
  // Auth API endpoints
  // =============================================================================

  /// Set authentication credentials
  @Deprecated('Use Opencode.auth.setAuth() instead')
  Future<bool> setAuth(String id, Map<String, dynamic> body) async {
    try {
      final response = await setAuthRaw(id, body);
      return response.data;
    } catch (e) {
      logger.e('Error setting auth', error: e);
      rethrow;
    }
  }
}
