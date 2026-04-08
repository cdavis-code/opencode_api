import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../exceptions/opencode_exception.dart';
import '../utils/logger.dart';

/// Call adapter to handle errors and wrap API calls in try-catch
class ErrorHandlingCallAdapter<T> extends CallAdapter<Future<T>, Future<T>> {
  @override
  Future<T> adapt(Future<T> Function() call) async {
    try {
      return await call();
    } catch (e) {
      logger.e('API call failed:', error: e);

      // Convert DioExceptions to our custom exception
      if (e is DioException) {
        final errorMessage = e.message ?? 'Unknown error occurred';
        final statusCode = e.response?.statusCode;

        final opencodeException = OpencodeException(
          errorMessage,
          statusCode: statusCode,
          originalError: e,
        );

        logger.e(
          'Converted DioException to OpencodeException:',
          error: opencodeException,
        );
        throw opencodeException;
      } else {
        // For any other type of exception
        final opencodeException = OpencodeException(
          e.toString(),
          originalError: e,
        );

        logger.e(
          'Wrapped unknown exception in OpencodeException:',
          error: opencodeException,
        );
        throw opencodeException;
      }
    }
  }
}
