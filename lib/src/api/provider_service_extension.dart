import 'provider_service.dart';
import '../models/response.dart';

/// Extension methods for ProviderService
extension ProviderServiceExtension on ProviderService {
  /// List all providers (convenience method)
  Future<ProviderListResponse> getProviders() async {
    final response = await getProvidersRaw();
    return response.data;
  }

  /// Get provider authentication methods (convenience method)
  Future<ProviderAuthMethodsResponse> getProviderAuth() async {
    final response = await getProviderAuthRaw();
    return response.data;
  }

  /// Authorize a provider using OAuth (convenience method)
  Future<ProviderAuthAuthorization> authorizeProvider(
    String id,
    Map<String, dynamic> body,
  ) async {
    final response = await authorizeProviderRaw(id, body);
    return response.data;
  }

  /// Handle OAuth callback for a provider (convenience method)
  Future<bool> providerOAuthCallback(
    String id,
    Map<String, dynamic> body,
  ) async {
    final response = await providerOAuthCallbackRaw(id, body);
    return response.data;
  }
}
