import '../models/project.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'project_service.g.dart';

/// Service for project API endpoints
@RestApi()
abstract class ProjectService {
  /// Factory constructor
  factory ProjectService(Dio dio, {String? baseUrl}) = _ProjectService;

  /// List all projects
  @GET('/project')
  Future<List<Project>> getProjects();

  /// Get the current project
  @GET('/project/current')
  Future<Project> getCurrentProject();
}
