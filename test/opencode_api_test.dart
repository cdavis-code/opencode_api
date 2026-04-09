import 'package:opencode_api/opencode_api.dart';
import 'package:test/test.dart';

void main() {
  group('Opencode API Tests', () {
    test('should create Opencode instance with connect', () async {
      final opencode = await Opencode.connect(
        username: 'test_user',
        password: 'test_password',
        baseUrl: 'http://localhost:4096',
      );

      expect(opencode, isNotNull);
      expect(opencode.global, isNotNull);
      expect(opencode.project, isNotNull);
      expect(opencode.session, isNotNull);
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

    test('should access global service', () async {
      final opencode = await Opencode.connect(baseUrl: 'http://localhost:4096');

      expect(opencode.global.getHealthRaw, isNotNull);
      expect(opencode.global.getGlobalEvents, isNotNull);
    });

    test('should access project service', () async {
      final opencode = await Opencode.connect(baseUrl: 'http://localhost:4096');

      expect(opencode.project.getProjects, isNotNull);
      expect(opencode.project.getCurrentProject, isNotNull);
    });

    test('should access session service', () async {
      final opencode = await Opencode.connect(baseUrl: 'http://localhost:4096');

      expect(opencode.session.getSessions, isNotNull);
      expect(opencode.session.createSession, isNotNull);
      expect(opencode.session.sendMessage, isNotNull);
    });

    test('should access files service', () async {
      final opencode = await Opencode.connect(baseUrl: 'http://localhost:4096');

      expect(opencode.files.findInFiles, isNotNull);
      expect(opencode.files.findFiles, isNotNull);
      expect(opencode.files.listFiles, isNotNull);
    });

    test('should access config service', () async {
      final opencode = await Opencode.connect(baseUrl: 'http://localhost:4096');

      expect(opencode.config.getConfig, isNotNull);
      expect(opencode.config.updateConfig, isNotNull);
    });

    test('should access tui service', () async {
      final opencode = await Opencode.connect(baseUrl: 'http://localhost:4096');

      expect(opencode.tui.tuiOpenHelp, isNotNull);
      expect(opencode.tui.tuiShowToast, isNotNull);
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
