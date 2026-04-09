import 'experimental_service.dart';
import '../models/response.dart';

/// Extension methods for ExperimentalService
extension ExperimentalServiceExtension on ExperimentalService {
  /// List all tool IDs (convenience method)
  Future<ToolIDs> getToolIds() async {
    final response = await getToolIdsRaw();
    return response.data;
  }

  /// List tools with JSON schemas for a model (convenience method)
  Future<ToolList> getTools({String? provider, String? model}) async {
    final response = await getToolsRaw(provider: provider, model: model);
    return response.data;
  }
}
