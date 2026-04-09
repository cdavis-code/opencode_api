import '../models/response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'agents_service.g.dart';

/// Service for agents API endpoints
@RestApi()
abstract class AgentsService {
  /// Factory constructor
  factory AgentsService(Dio dio, {String? baseUrl}) = _AgentsService;

  /// List all available agents
  @GET('/agent')
  Future<HttpResponse<List<Agent>>> getAgentsRaw();
}
