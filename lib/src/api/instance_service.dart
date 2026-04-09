import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'instance_service.g.dart';

/// Service for instance API endpoints
@RestApi()
abstract class InstanceService {
  /// Factory constructor
  factory InstanceService(Dio dio, {String? baseUrl}) = _InstanceService;

  /// Dispose the current instance
  @POST('/instance/dispose')
  Future<HttpResponse<bool>> disposeInstanceRaw();
}
