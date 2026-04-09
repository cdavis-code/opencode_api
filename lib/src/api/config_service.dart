import '../models/response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'config_service.g.dart';

/// Service for config API endpoints
@RestApi()
abstract class ConfigService {
  /// Factory constructor
  factory ConfigService(Dio dio, {String? baseUrl}) = _ConfigService;

  /// Get config info
  @GET('/config')
  Future<HttpResponse<ConfigResponse>> getConfigRaw();

  /// Update config
  @PATCH('/config')
  Future<HttpResponse<ConfigResponse>> updateConfigRaw(
    @Body() Map<String, dynamic> body,
  );

  /// List providers and default models
  @GET('/config/providers')
  Future<HttpResponse<ConfigProvidersResponse>> getConfigProvidersRaw();
}
