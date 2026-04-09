import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'events_service.g.dart';

/// Service for events API endpoints
@RestApi()
abstract class EventsService {
  /// Factory constructor
  factory EventsService(Dio dio, {String? baseUrl}) = _EventsService;

  /// Get events (SSE stream)
  @GET('/event')
  Stream<String> getEvents();
}
