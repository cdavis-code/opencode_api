import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'logging_service.g.dart';

/// Service for logging API endpoints
@RestApi()
abstract class LoggingService {
  /// Factory constructor
  factory LoggingService(Dio dio, {String? baseUrl}) = _LoggingService;

  /// Write log entry
  @POST('/log')
  Future<HttpResponse<bool>> writeLogRaw(@Body() Map<String, dynamic> body);
}
