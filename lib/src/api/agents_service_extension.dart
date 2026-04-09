import 'agents_service.dart';
import '../models/response.dart';

/// Extension methods for AgentsService
extension AgentsServiceExtension on AgentsService {
  /// List all available agents (convenience method)
  Future<List<Agent>> getAgents() async {
    final response = await getAgentsRaw();
    return response.data;
  }
}
