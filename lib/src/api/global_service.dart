import '../models/response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'global_service.g.dart';

/// Service for global API endpoints
@RestApi()
abstract class GlobalService {
  /// Factory constructor
  factory GlobalService(Dio dio, {String? baseUrl}) = _GlobalService;

  /// Get server health and version
  @GET('/global/health')
  Future<HttpResponse<HealthResponse>> getHealthRaw();

  /// Get global events (SSE stream)
  @GET('/global/event')
  Stream<String> getGlobalEvents();
}
