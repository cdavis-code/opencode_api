import 'package:opencode_api/opencode_api.dart';

void main() async {
  // Create the API client with authentication
  final dio = OpencodeClient.createDio(
    username: 'opencode',
    password: 'my-password', // Replace with your actual password
    baseUrl: 'http://localhost:4096', // Replace with your server URL
  );

  final client = OpencodeClient(dio);

  try {
    // Get server health
    final health = await client.getHealth();
    print('Server healthy: ${health.healthy}');
    print('Version: ${health.version}');

    // Get all projects
    final projects = await client.getProjects();
    print('Found ${projects.length} projects');

    if (projects.isNotEmpty) {
      // Get current project
      final currentProject = await client.getCurrentProject();
      print(
        'Current project: id=${currentProject.id}, worktree=${currentProject.worktree}',
      );

      // List all sessions
      final sessions = await client.getSessions();
      print('Found ${sessions.length} sessions');

      // Print first session details
      if (sessions.isNotEmpty) {
        final firstSession = sessions.first;
        print(
          'First session: id=${firstSession.id}, title=${firstSession.title}',
        );
      }
    }

    // Example of error handling
    try {
      // This might fail if no projects exist
      if (projects.isNotEmpty) {
        final project = await client.getCurrentProject();
        print('Successfully fetched current project: id=${project.id}');
      }
    } catch (e) {
      print('Could not get current project: $e');
    }

    // Example of using TUI endpoints to send a prompt
    print('\n--- TUI Prompt Example ---');
    try {
      // Append text to the TUI prompt
      final appendSuccess = await client.tuiAppendPrompt({
        'text': 'Hello, world!',
      });
      print('Prompt appended: $appendSuccess');

      if (appendSuccess) {
        // Submit the prompt
        final submitSuccess = await client.tuiSubmitPrompt();
        print('Prompt submitted: $submitSuccess');

        if (submitSuccess) {
          // Wait for the next control request (response)
          // Note: This will block until a control request is available
          print('Waiting for response...');
          final controlRequest = await client.tuiControlNext();
          print('Control request received:');
          print('  ID: ${controlRequest.id}');
          print('  Type: ${controlRequest.type}');
          print('  Body: ${controlRequest.body}');
        }
      }
    } catch (e) {
      print('TUI example failed: $e');
      print('Note: TUI endpoints require an active TUI session');
    }
  } catch (e) {
    print('Error: $e');
  }
}
