import 'auth_service.dart';

/// Extension methods for AuthService
extension AuthServiceExtension on AuthService {
  /// Set authentication credentials (convenience method)
  Future<bool> setAuth(String id, Map<String, dynamic> body) async {
    final response = await setAuthRaw(id, body);
    return response.data;
  }
}
