import '../models/response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'commands_service.g.dart';

/// Service for commands API endpoints
@RestApi()
abstract class CommandsService {
  /// Factory constructor
  factory CommandsService(Dio dio, {String? baseUrl}) = _CommandsService;

  /// List all commands
  @GET('/command')
  Future<HttpResponse<List<Command>>> getCommandsRaw();
}
