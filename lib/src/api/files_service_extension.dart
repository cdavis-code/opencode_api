import 'files_service.dart';
import '../models/response.dart';

/// Extension methods for FilesService
extension FilesServiceExtension on FilesService {
  /// Search for text in files (convenience method)
  Future<List<FindResult>> findInFiles({required String pattern}) async {
    final response = await findInFilesRaw(pattern: pattern);
    return response.data;
  }

  /// Find files and directories by name (convenience method)
  Future<List<String>> findFiles({required String query}) async {
    final response = await findFilesRaw(query: query);
    return response.data;
  }

  /// Find workspace symbols (convenience method)
  Future<List<Symbol>> findSymbols({required String query}) async {
    final response = await findSymbolsRaw(query: query);
    return response.data;
  }

  /// List files and directories (convenience method)
  Future<List<FileNodeResponse>> listFiles({String? path}) async {
    final response = await listFilesRaw(path: path);
    return response.data;
  }

  /// Read a file (convenience method)
  Future<FileContentResponse> getFileContent({required String path}) async {
    final response = await getFileContentRaw(path: path);
    return response.data;
  }

  /// Get status for tracked files (convenience method)
  Future<List<FileStatus>> getFileStatus() async {
    final response = await getFileStatusRaw();
    return response.data;
  }
}
