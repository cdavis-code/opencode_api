import 'config_service.dart';
import '../models/response.dart';

/// Extension methods for ConfigService
extension ConfigServiceExtension on ConfigService {
  /// Get config info (convenience method)
  Future<ConfigResponse> getConfig() async {
    final response = await getConfigRaw();
    return response.data;
  }

  /// Update config (convenience method)
  Future<ConfigResponse> updateConfig(Map<String, dynamic> body) async {
    final response = await updateConfigRaw(body);
    return response.data;
  }

  /// List providers and default models (convenience method)
  Future<ConfigProvidersResponse> getConfigProviders() async {
    final response = await getConfigProvidersRaw();
    return response.data;
  }
}
