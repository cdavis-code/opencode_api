import 'path_service.dart';
import '../models/response.dart';

/// Extension methods for PathService
extension PathServiceExtension on PathService {
  /// Get the current path (convenience method)
  Future<PathResponse> getPath() async {
    final response = await getPathRaw();
    return response.data;
  }
}
