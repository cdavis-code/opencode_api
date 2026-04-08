import 'package:opencode_api/opencode_api.dart';
import 'package:test/test.dart';

void main() {
  group('Opencode API Tests', () {
    late OpencodeClient client;

    setUp(() {
      final dio = OpencodeClient.createDio(baseUrl: 'http://localhost:4096');
      client = OpencodeClient(dio);
    });

    test('should create client instance', () {
      expect(client, isNotNull);
    });

    test('should create Dio instance with authentication', () {
      final dio = OpencodeClient.createDio(
        username: 'test_user',
        password: 'test_password',
        baseUrl: 'http://localhost:4096',
      );

      expect(dio, isNotNull);
      expect(dio.options.baseUrl, 'http://localhost:4096');
    });

    test('should create Dio instance without authentication', () {
      final dio = OpencodeClient.createDio(baseUrl: 'http://localhost:4096');

      expect(dio, isNotNull);
      expect(dio.options.baseUrl, 'http://localhost:4096');
    });
  });

  group('Model Tests', () {
    test('should create Project instance', () {
      final project = Project(
        id: 'test-id',
        worktree: '/path/to/project',
        path: '/path/to/project',
        description: 'A test project',
      );

      expect(project.id, 'test-id');
      expect(project.worktree, '/path/to/project');
      expect(project.path, '/path/to/project');
      expect(project.description, 'A test project');
    });

    test('should create Session instance', () {
      final session = Session(
        id: 'test-session-id',
        title: 'Test Session',
        projectID: 'global',
        directory: '/test',
      );

      expect(session.id, 'test-session-id');
      expect(session.title, 'Test Session');
      expect(session.projectID, 'global');
    });

    test('should create Message instance', () {
      final message = Message(
        id: 'test-message-id',
        sessionId: 'test-session-id',
        content: 'Test message content',
      );

      expect(message.id, 'test-message-id');
      expect(message.sessionId, 'test-session-id');
      expect(message.content, 'Test message content');
    });

    test('should create FileNode instance', () {
      final fileNode = FileNode(
        id: 'test-file-id',
        name: 'test.txt',
        path: '/path/to/test.txt',
        type: FileType.file,
        size: 1024,
      );

      expect(fileNode.id, 'test-file-id');
      expect(fileNode.name, 'test.txt');
      expect(fileNode.path, '/path/to/test.txt');
      expect(fileNode.type, FileType.file);
      expect(fileNode.size, 1024);
    });

    test('should create HealthResponse instance', () {
      final health = HealthResponse(healthy: true, version: '1.0.0');

      expect(health.healthy, true);
      expect(health.version, '1.0.0');
    });

    test('should create PathResponse instance', () {
      final path = PathResponse(path: '/test/path');

      expect(path.path, '/test/path');
    });
  });
}
