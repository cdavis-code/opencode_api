import 'lsp_formatter_mcp_service.dart';
import '../models/response.dart';

/// Extension methods for LspFormatterMcpService
extension LspFormatterMcpServiceExtension on LspFormatterMcpService {
  /// Get LSP server status (convenience method)
  Future<List<LSPStatus>> getLspStatus() async {
    final response = await getLspStatusRaw();
    return response.data;
  }

  /// Get formatter status (convenience method)
  Future<List<FormatterStatus>> getFormatterStatus() async {
    final response = await getFormatterStatusRaw();
    return response.data;
  }

  /// Get MCP server status (convenience method)
  Future<Map<String, MCPStatus>> getMcpStatus() async {
    final response = await getMcpStatusRaw();
    return response.data;
  }

  /// Add MCP server dynamically (convenience method)
  Future<MCPStatus> addMcpServer(Map<String, dynamic> body) async {
    final response = await addMcpServerRaw(body);
    return response.data;
  }
}
