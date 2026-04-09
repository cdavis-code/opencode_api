import '../models/response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'vcs_service.g.dart';

/// Service for VCS API endpoints
@RestApi()
abstract class VcsService {
  /// Factory constructor
  factory VcsService(Dio dio, {String? baseUrl}) = _VcsService;

  /// Get VCS info for the current project
  @GET('/vcs')
  Future<HttpResponse<VcsResponse>> getVcsRaw();
}
