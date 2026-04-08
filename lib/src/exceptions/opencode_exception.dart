/// Custom exception class for Opencode API errors
///
/// This exception hides implementation details from users while
/// preserving information for logging purposes.
class OpencodeException implements Exception {
  final String message;
  final int? statusCode;
  final Object? originalError;

  OpencodeException(this.message, {this.statusCode, this.originalError});

  @override
  String toString() => 'OpencodeException: $message';

  /// Returns a user-friendly message that doesn't leak implementation details
  String get userMessage {
    if (statusCode != null) {
      switch (statusCode) {
        case 401:
          return 'Authentication failed. Please check your credentials.';
        case 403:
          return 'Access denied. You do not have permission for this resource.';
        case 404:
          return 'The requested resource was not found.';
        case 500:
          return 'An internal server error occurred. Please try again later.';
        case 503:
          return 'Service temporarily unavailable. Please try again later.';
      }
    }
    return 'An error occurred while communicating with the server. Please try again.';
  }
}
