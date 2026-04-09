import 'tui_service.dart';
import '../models/response.dart';

/// Extension methods for TuiService
extension TuiServiceExtension on TuiService {
  /// Append text to the prompt (convenience method)
  Future<bool> tuiAppendPrompt(Map<String, dynamic> body) async {
    final response = await tuiAppendPromptRaw(body);
    return response.data;
  }

  /// Open the help dialog (convenience method)
  Future<bool> tuiOpenHelp() async {
    final response = await tuiOpenHelpRaw();
    return response.data;
  }

  /// Open the session selector (convenience method)
  Future<bool> tuiOpenSessions() async {
    final response = await tuiOpenSessionsRaw();
    return response.data;
  }

  /// Open the theme selector (convenience method)
  Future<bool> tuiOpenThemes() async {
    final response = await tuiOpenThemesRaw();
    return response.data;
  }

  /// Open the model selector (convenience method)
  Future<bool> tuiOpenModels() async {
    final response = await tuiOpenModelsRaw();
    return response.data;
  }

  /// Submit the current prompt (convenience method)
  Future<bool> tuiSubmitPrompt() async {
    final response = await tuiSubmitPromptRaw();
    return response.data;
  }

  /// Clear the prompt (convenience method)
  Future<bool> tuiClearPrompt() async {
    final response = await tuiClearPromptRaw();
    return response.data;
  }

  /// Execute a command (convenience method)
  Future<bool> tuiExecuteCommand(Map<String, dynamic> body) async {
    final response = await tuiExecuteCommandRaw(body);
    return response.data;
  }

  /// Show toast (convenience method)
  Future<bool> tuiShowToast(Map<String, dynamic> body) async {
    final response = await tuiShowToastRaw(body);
    return response.data;
  }

  /// Wait for the next control request (convenience method)
  Future<ControlRequest> tuiControlNext() async {
    final response = await tuiControlNextRaw();
    return response.data;
  }

  /// Respond to a control request (convenience method)
  Future<bool> tuiControlResponse(Map<String, dynamic> body) async {
    final response = await tuiControlResponseRaw(body);
    return response.data;
  }
}
