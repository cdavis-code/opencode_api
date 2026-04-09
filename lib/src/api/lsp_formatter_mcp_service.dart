import '../models/response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'lsp_formatter_mcp_service.g.dart';

/// Service for LSP, Formatters & MCP API endpoints
@RestApi()
abstract class LspFormatterMcpService {
  /// Factory constructor
  factory LspFormatterMcpService(Dio dio, {String? baseUrl}) = _LspFormatterMcpService;

  /// Get LSP server status
  @GET('/lsp')
  Future<HttpResponse<List<LSPStatus>>> getLspStatusRaw();

  /// Get formatter status
  @GET('/formatter')
  Future<HttpResponse<List<FormatterStatus>>> getFormatterStatusRaw();

  /// Get MCP server status
  @GET('/mcp')
  Future<HttpResponse<Map<String, MCPStatus>>> getMcpStatusRaw();

  /// Add MCP server dynamically
  @POST('/mcp')
  Future<HttpResponse<MCPStatus>> addMcpServerRaw(
    @Body() Map<String, dynamic> body,
  );
}
