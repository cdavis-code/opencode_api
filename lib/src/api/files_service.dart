import '../models/response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'files_service.g.dart';

/// Service for files API endpoints
@RestApi()
abstract class FilesService {
  /// Factory constructor
  factory FilesService(Dio dio, {String? baseUrl}) = _FilesService;

  /// Search for text in files
  @GET('/find')
  Future<HttpResponse<List<FindResult>>> findInFilesRaw({
    @Query('pattern') required String pattern,
  });

  /// Find files and directories by name
  @GET('/find/file')
  Future<HttpResponse<List<String>>> findFilesRaw({
    @Query('query') required String query,
  });

  /// Find workspace symbols
  @GET('/find/symbol')
  Future<HttpResponse<List<Symbol>>> findSymbolsRaw({
    @Query('query') required String query,
  });

  /// List files and directories
  @GET('/file')
  Future<HttpResponse<List<FileNodeResponse>>> listFilesRaw({
    @Query('path') String? path,
  });

  /// Read a file
  @GET('/file/content')
  Future<HttpResponse<FileContentResponse>> getFileContentRaw({
    @Query('path') required String path,
  });

  /// Get status for tracked files
  @GET('/file/status')
  Future<HttpResponse<List<FileStatus>>> getFileStatusRaw();
}
