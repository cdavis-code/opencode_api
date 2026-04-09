import '../models/session.dart';
import '../models/response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'session_service.g.dart';

/// Service for session API endpoints
@RestApi()
abstract class SessionService {
  /// Factory constructor
  factory SessionService(Dio dio, {String? baseUrl}) = _SessionService;

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
}
