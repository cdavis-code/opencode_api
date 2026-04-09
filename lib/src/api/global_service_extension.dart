import 'global_service.dart';
import '../models/response.dart';

/// Extension methods for GlobalService
extension GlobalServiceExtension on GlobalService {
  /// Get server health and version (convenience method)
  Future<HealthResponse> getHealth() async {
    final response = await getHealthRaw();
    return response.data;
  }
}
