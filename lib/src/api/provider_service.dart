import '../models/response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'provider_service.g.dart';

/// Service for provider API endpoints
@RestApi()
abstract class ProviderService {
  /// Factory constructor
  factory ProviderService(Dio dio, {String? baseUrl}) = _ProviderService;

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
}
