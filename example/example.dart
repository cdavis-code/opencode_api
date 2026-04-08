import 'package:opencode_api/opencode_api.dart';

void main() async {
  final dio = OpencodeClient.createDio(
    username: 'opencode',
    password: 'my-password',
    baseUrl: 'http://localhost:4096',
  );

  final client = OpencodeClient(dio);

  try {
    final health = await client.getHealth();
    print('Server healthy: ${health.healthy}');
    print('Version: ${health.version}');

    final sessions = await client.getSessions();
    print('Found ${sessions.length} sessions');

    Session session;
    if (sessions.isEmpty) {
      print('Creating new session...');
      session = await client.createSession({});
      print('Created session: id=${session.id}');
    } else {
      session = sessions.first;
      print('Using existing session: id=${session.id}');
    }

    print('\nSending message: "What is 2+2?"');
    final response = await client.sendMessage(session.id!, {
      'parts': [
        {'type': 'text', 'text': 'What is 2+2?'},
      ],
    });

    print('\n--- Response ---');
    print('Message ID: ${response.info?.id}');
    print('Role: ${response.info?.role}');
    print('\nParts:');
    for (final part in response.parts ?? []) {
      print('  - type: ${part.type}');
      if (part.text != null && part.text!.isNotEmpty) {
        print('    text: ${part.text}');
      }
    }
  } catch (e) {
    print('Error: $e');
  }
}
