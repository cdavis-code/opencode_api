import '../models/response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'path_service.g.dart';

/// Service for path API endpoints
@RestApi()
abstract class PathService {
  /// Factory constructor
  factory PathService(Dio dio, {String? baseUrl}) = _PathService;

  /// Get the current path
  @GET('/path')
  Future<HttpResponse<PathResponse>> getPathRaw();
}
