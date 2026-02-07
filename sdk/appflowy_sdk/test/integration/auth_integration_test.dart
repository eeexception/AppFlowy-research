import 'package:test/test.dart';
import 'package:appflowy_sdk/appflowy_sdk.dart';

/// Integration tests for authentication
///
/// Prerequisites:
/// 1. AppFlowy Cloud running locally (Docker)
/// 2. Test user created with credentials below
///
/// To run AppFlowy Cloud locally:
/// ```bash
/// docker-compose up -d
/// ```
void main() {
  group('Authentication Integration Tests', () {
    late AppFlowySDK sdk;

    setUp(() {
      // Use local AppFlowy Cloud instance (nginx proxy on port 80)
      sdk = AppFlowySDK(
        config: AppFlowyConfig.local(port: 80),
      );
    });

    test('should connect to AppFlowy Cloud', () async {
      // Try to sign in as guest to verify server is reachable
      try {
        await sdk.auth.signInAsGuest();
        expect(sdk.isAuthenticated, isTrue);
        print('✅ Successfully connected to AppFlowy Cloud');
      } catch (e) {
        fail('Cannot connect to AppFlowy Cloud at http://localhost:8000. '
            'Make sure AppFlowy Cloud is running. Error: $e');
      }
    });

    test('should authenticate with valid credentials', () async {
      // NOTE: This requires a test user to exist in your local AppFlowy Cloud
      // Create a test user first or modify these credentials
      try {
        final user = await sdk.auth.signInWithPassword(
          email: 'test@appflowy.io',
          password: 'testpassword123',
        );

        expect(user.email, equals('test@appflowy.io'));
        expect(sdk.isAuthenticated, isTrue);

        print('✅ Authentication successful!');
        print('   User ID: ${user.id}');
        print('   Email: ${user.email}');
        print('   Name: ${user.name}');
      } catch (e) {
        print('❌ Authentication failed: $e');
        print('   Make sure test user exists:');
        print('   Email: test@appflowy.io');
        print('   Password: testpassword123');
        rethrow;
      }
    });

    test('should fail authentication with invalid credentials', () async {
      // GoTrue returns 400 (ValidationException) for invalid credentials
      expect(
        () => sdk.auth.signInWithPassword(
          email: 'invalid@example.com',
          password: 'wrongpassword',
        ),
        throwsA(isA<AppFlowyException>()),
      );
    });

    test('should create and authenticate as guest user', () async {
      try {
        final user = await sdk.auth.signInAsGuest();

        expect(user.email, contains('guest'));
        expect(sdk.isAuthenticated, isTrue);

        print('✅ Guest authentication successful!');
        print('   User ID: ${user.id}');
        print('   Email: ${user.email}');
      } catch (e) {
        print('❌ Guest authentication failed: $e');
        rethrow;
      }
    });

    test('should get current user profile after authentication', () async {
      // Sign in first
      await sdk.auth.signInWithPassword(
        email: 'test@appflowy.io',
        password: 'testpassword123',
      );

      // Get user profile
      final user = await sdk.auth.getCurrentUser();

      expect(user.email, equals('test@appflowy.io'));
      expect(user.id, isNotEmpty);

      print('✅ Got user profile!');
      print('   ${user.name} (${user.email})');
    });

    test('should sign out successfully', () async {
      // Sign in first
      await sdk.auth.signInWithPassword(
        email: 'test@appflowy.io',
        password: 'testpassword123',
      );

      expect(sdk.isAuthenticated, isTrue);

      // Sign out
      await sdk.auth.signOut();

      expect(sdk.isAuthenticated, isFalse);
      expect(sdk.auth.currentUser, isNull);

      print('✅ Sign out successful!');
    });
  });

  group('Workspace Integration Tests', () {
    late AppFlowySDK sdk;

    setUp(() async {
      sdk = AppFlowySDK(config: AppFlowyConfig.local(port: 80));

      // Authenticate before workspace tests
      try {
        await sdk.auth.signInWithPassword(
          email: 'test@appflowy.io',
          password: 'testpassword123',
        );
      } catch (e) {
        // Skip if can't authenticate
      }
    });

    test('should list workspaces', () async {
      // Note: Workspace operations require AppFlowy Cloud user initialization
      // beyond just GoTrue authentication. Skipping for now.
      final workspaces = await sdk.getWorkspaces();

      expect(workspaces, isNotNull);
      expect(workspaces, isA<List<Workspace>>());

      print('✅ Got ${workspaces.length} workspaces');
      for (final ws in workspaces) {
        print('   - ${ws.name} (${ws.id})');
      }
    });

    test('should create a new workspace', () async {
      final workspace = await sdk.createWorkspace(name: 'Test Workspace');

      expect(workspace.name, equals('Test Workspace'));
      expect(workspace.id, isNotEmpty);

      print('✅ Created workspace: ${workspace.name}');
      print('   ID: ${workspace.id}');
    });
  });
}
