import 'vcs_service.dart';
import '../models/response.dart';

/// Extension methods for VcsService
extension VcsServiceExtension on VcsService {
  /// Get VCS info for the current project (convenience method)
  Future<VcsResponse> getVcs() async {
    final response = await getVcsRaw();
    return response.data;
  }
}
