import 'logging_service.dart';

/// Extension methods for LoggingService
extension LoggingServiceExtension on LoggingService {
  /// Write log entry (convenience method)
  Future<bool> writeLog(Map<String, dynamic> body) async {
    final response = await writeLogRaw(body);
    return response.data;
  }
}
