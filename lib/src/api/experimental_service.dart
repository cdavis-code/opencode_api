import '../models/response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'experimental_service.g.dart';

/// Service for experimental tools API endpoints
@RestApi()
abstract class ExperimentalService {
  /// Factory constructor
  factory ExperimentalService(Dio dio, {String? baseUrl}) = _ExperimentalService;

  /// List all tool IDs
  @GET('/experimental/tool/ids')
  Future<HttpResponse<ToolIDs>> getToolIdsRaw();

  /// List tools with JSON schemas for a model
  @GET('/experimental/tool')
  Future<HttpResponse<ToolList>> getToolsRaw({
    @Query('provider') String? provider,
    @Query('model') String? model,
  });
}
