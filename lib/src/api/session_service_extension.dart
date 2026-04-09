import 'session_service.dart';
import '../models/session.dart';
import '../models/response.dart';

/// Extension methods for SessionService
extension SessionServiceExtension on SessionService {
  /// Get session status for all sessions (convenience method)
  Future<Map<String, SessionStatus>> getSessionStatus() async {
    final response = await getSessionStatusRaw();
    return response.data;
  }

  /// Get the todo list for a session (convenience method)
  Future<List<Todo>> getSessionTodo(String id) async {
    final response = await getSessionTodoRaw(id);
    return response.data;
  }

  /// Initialize a session (convenience method)
  Future<bool> initSession(String id, Map<String, dynamic> body) async {
    final response = await initSessionRaw(id, body);
    return response.data;
  }

  /// Fork a session (convenience method)
  Future<Session> forkSession(String id, Map<String, dynamic> body) async {
    final response = await forkSessionRaw(id, body);
    return response.data;
  }

  /// Abort a session (convenience method)
  Future<bool> abortSession(String id) async {
    final response = await abortSessionRaw(id);
    return response.data;
  }

  /// Share a session (convenience method)
  Future<Session> shareSession(String id) async {
    final response = await shareSessionRaw(id);
    return response.data;
  }

  /// Unshare a session (convenience method)
  Future<Session> unshareSession(String id) async {
    final response = await unshareSessionRaw(id);
    return response.data;
  }

  /// Get session diff (convenience method)
  Future<List<FileDiff>> getSessionDiff(String id, {String? messageID}) async {
    final response = await getSessionDiffRaw(id, messageID: messageID);
    return response.data;
  }

  /// Summarize a session (convenience method)
  Future<bool> summarizeSession(String id, Map<String, dynamic> body) async {
    final response = await summarizeSessionRaw(id, body);
    return response.data;
  }

  /// Revert a message (convenience method)
  Future<bool> revertMessage(String id, Map<String, dynamic> body) async {
    final response = await revertMessageRaw(id, body);
    return response.data;
  }

  /// Restore all reverted messages (convenience method)
  Future<bool> unrevertMessages(String id) async {
    final response = await unrevertMessagesRaw(id);
    return response.data;
  }

  /// Respond to a permission request (convenience method)
  Future<bool> respondToPermissionRequest(
    String id,
    String permissionID,
    Map<String, dynamic> body,
  ) async {
    final response = await respondToPermissionRequestRaw(id, permissionID, body);
    return response.data;
  }

  /// List messages in a session (convenience method)
  Future<List<MessageWithParts>> getMessages(String id, {int? limit}) async {
    final response = await getMessagesRaw(id, limit: limit);
    return response.data;
  }

  /// Send a message and wait for response (convenience method)
  Future<MessageWithParts> sendMessage(
    String id,
    Map<String, dynamic> body,
  ) async {
    final response = await sendMessageRaw(id, body);
    return response.data;
  }

  /// Get message details (convenience method)
  Future<MessageWithParts> getMessage(String id, String messageID) async {
    final response = await getMessageRaw(id, messageID);
    return response.data;
  }

  /// Execute a slash command (convenience method)
  Future<MessageWithParts> executeCommand(
    String id,
    Map<String, dynamic> body,
  ) async {
    final response = await executeCommandRaw(id, body);
    return response.data;
  }

  /// Run a shell command (convenience method)
  Future<MessageWithParts> runShell(
    String id,
    Map<String, dynamic> body,
  ) async {
    final response = await runShellRaw(id, body);
    return response.data;
  }
}
