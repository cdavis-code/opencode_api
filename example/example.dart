import 'package:opencode_api/opencode_api.dart';

void main() async {
  try {
    final opencode = await Opencode.connect(
      username: 'opencode',
      password: 'my-password',
      baseUrl: 'http://localhost:4096',
    );

    final health = await opencode.global.getHealth();
    print('Server healthy: ${health.healthy}');
    print('Version: ${health.version}');

    final sessions = await opencode.session.getSessions();
    print('Found ${sessions.length} sessions');

    Session session;
    if (sessions.isEmpty) {
      print('Creating new session...');
      session = await opencode.session.createSession({});
      print('Created session: id=${session.id}');
    } else {
      session = sessions.first;
      print('Using existing session: id=${session.id}');
    }

    print('\nSending message: "What is 2+2?"');
    final response = await opencode.session.sendMessage(session.id!, {
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
