import 'commands_service.dart';
import '../models/response.dart';

/// Extension methods for CommandsService
extension CommandsServiceExtension on CommandsService {
  /// List all commands (convenience method)
  Future<List<Command>> getCommands() async {
    final response = await getCommandsRaw();
    return response.data;
  }
}
