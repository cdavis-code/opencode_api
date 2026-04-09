import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_service.g.dart';

/// Service for auth API endpoints
@RestApi()
abstract class AuthService {
  /// Factory constructor
  factory AuthService(Dio dio, {String? baseUrl}) = _AuthService;

  /// Set authentication credentials
  @PUT('/auth/{id}')
  Future<HttpResponse<bool>> setAuthRaw(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );
}
