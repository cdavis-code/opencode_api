import '../models/response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'tui_service.g.dart';

/// Service for TUI API endpoints
@RestApi()
abstract class TuiService {
  /// Factory constructor
  factory TuiService(Dio dio, {String? baseUrl}) = _TuiService;

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
}
