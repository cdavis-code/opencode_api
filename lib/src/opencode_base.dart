import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:opencode_api/src/exceptions/opencode_exception.dart'
    as opencode_exception;
import 'package:opencode_api/src/utils/logger.dart';
import 'api/global_service.dart';
import 'api/project_service.dart';
import 'api/path_service.dart';
import 'api/vcs_service.dart';
import 'api/instance_service.dart';
import 'api/config_service.dart';
import 'api/provider_service.dart';
import 'api/session_service.dart';
import 'api/commands_service.dart';
import 'api/files_service.dart';
import 'api/experimental_service.dart';
import 'api/lsp_formatter_mcp_service.dart';
import 'api/agents_service.dart';
import 'api/logging_service.dart';
import 'api/tui_service.dart';
import 'api/auth_service.dart';
import 'api/events_service.dart';

/// Main API client for interacting with the opencode server
class Opencode {
  /// Global API endpoints
  late final GlobalService global;

  /// Project API endpoints
  late final ProjectService project;

  /// Path & VCS API endpoints
  late final PathService path;
  late final VcsService vcs;

  /// Instance API endpoints
  late final InstanceService instance;

  /// Config API endpoints
  late final ConfigService config;
  late final ProviderService provider;

  /// Session API endpoints
  late final SessionService session;

  /// Commands API endpoints
  late final CommandsService commands;

  /// Files API endpoints
  late final FilesService files;

  /// Experimental API endpoints
  late final ExperimentalService experimental;

  /// LSP, Formatters & MCP API endpoints
  late final LspFormatterMcpService lspFormatterMcp;

  /// Agents API endpoints
  late final AgentsService agents;

  /// Logging API endpoints
  late final LoggingService logging;

  /// TUI API endpoints
  late final TuiService tui;

  /// Auth API endpoints
  late final AuthService auth;

  /// Events API endpoints
  late final EventsService events;

  /// The dio instance used for making http requests
  final Dio _dio;

  Opencode({required Dio dio}) : _dio = dio {
    // Initialize all service instances
    global = GlobalService(_dio);
    project = ProjectService(_dio);
    path = PathService(_dio);
    vcs = VcsService(_dio);
    instance = InstanceService(_dio);
    config = ConfigService(_dio);
    provider = ProviderService(_dio);
    session = SessionService(_dio);
    commands = CommandsService(_dio);
    files = FilesService(_dio);
    experimental = ExperimentalService(_dio);
    lspFormatterMcp = LspFormatterMcpService(_dio);
    agents = AgentsService(_dio);
    logging = LoggingService(_dio);
    tui = TuiService(_dio);
    auth = AuthService(_dio);
    events = EventsService(_dio);
  }

  /// Set up Dio with error handling and logging
  static Dio createDio({String? username, String? password, String? baseUrl}) {
    final dio = Dio();

    // Set up basic auth if credentials are provided
    if (username != null && password != null) {
      dio.options.headers['authorization'] =
          'Basic ' + base64Encode(utf8.encode('$username:$password'));
    }

    // Set base URL if provided
    if (baseUrl != null) {
      dio.options.baseUrl = baseUrl;
    }

    // Add interceptors for logging and error handling
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException err, ErrorInterceptorHandler handler) async {
          // Log detailed error for debugging (internal use only)
          logger.e('API Error: ${err.message}', error: err);

          // Transform DioException to custom OpencodeException
          // The userMessage property will provide safe, non-leaking messages
          final exception = opencode_exception.OpencodeException(
            'API request failed: ${err.message}',
            statusCode: err.response?.statusCode,
            originalError: err,
          );

          logger.e('Converted to OpencodeException', error: exception);
          return handler.reject(err);
        },
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          logger.d('API Request: ${options.method} ${options.uri}');
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          logger.i(
            'API Response: ${response.statusCode} for ${response.requestOptions.path}',
          );
          return handler.next(response);
        },
      ),
    );

    return dio;
  }

  /// Connect to the opencode server and return an Opencode instance
  static Future<Opencode> connect({
    /// The username to use for authentication
    String? username,

    /// The password to use for authentication
    String? password,

    /// The base URL of the opencode server
    String? baseUrl,
  }) async {
    final dio = createDio(
      username: username,
      password: password,
      baseUrl: baseUrl,
    );

    return Opencode(dio: dio);
  }
}
