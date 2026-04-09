import 'instance_service.dart';

/// Extension methods for InstanceService
extension InstanceServiceExtension on InstanceService {
  /// Dispose the current instance (convenience method)
  Future<bool> disposeInstance() async {
    final response = await disposeInstanceRaw();
    return response.data;
  }
}
