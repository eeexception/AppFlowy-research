/// Complete example demonstrating AppFlowy SDK usage
///
/// This example shows:
/// - Authentication (email/password, guest)
/// - Workspace management
/// - Database operations
/// - Error handling
///
/// To run this example:
/// 1. Start AppFlowy Cloud: `docker-compose up -d`
/// 2. Run: `dart example/main.dart`

import 'package:appflowy_sdk/appflowy_sdk.dart';

void main() async {
  print('🚀 AppFlowy SDK Example\n');

  // Example 1: Basic Authentication
  await exampleBasicAuth();

  // Example 2: Guest User
  await exampleGuestUser();

  // Example 3: Workspace Management
  await exampleWorkspaceManagement();

  // Example 4: Error Handling
  await exampleErrorHandling();

  print('\n✅ All examples completed!');
}

/// Example 1: Basic Authentication Flow
Future<void> exampleBasicAuth() async {
  print('📝 Example 1: Basic Authentication');
  print('=' * 50);

  // Initialize SDK with AppFlowy Cloud
  final sdk = AppFlowySDK(
    config: AppFlowyConfig.cloud(), // Uses https://api.appflowy.io
  );

  try {
    // Sign in with email and password
    final user = await sdk.auth.signInWithPassword(
      email: 'demo@example.com',
      password: 'password123',
    );

    print('✅ Signed in as: ${user.email}');
    print('   User ID: ${user.id}');
    print('   Name: ${user.name ?? "Not set"}');

    // Check authentication status
    if (sdk.isAuthenticated) {
      print('✅ User is authenticated');
    }

    // Get current user profile
    final profile = await sdk.auth.currentUser;
    print('   Current user: ${profile?.email}');

    // Sign out
    await sdk.auth.signOut();
    print('✅ Signed out successfully\n');
  } catch (e) {
    print('❌ Error: $e\n');
  }
}

/// Example 2: Guest User Authentication
Future<void> exampleGuestUser() async {
  print('👤 Example 2: Guest User');
  print('=' * 50);

  final sdk = AppFlowySDK(
    config: AppFlowyConfig.cloud(),
  );

  try {
    // Sign in as guest (no email/password required)
    final guestUser = await sdk.auth.signInAsGuest();

    print('✅ Signed in as guest');
    print('   Guest ID: ${guestUser.id}');
    print('   Guest Email: ${guestUser.email}');

    await sdk.auth.signOut();
    print('✅ Guest signed out\n');
  } catch (e) {
    print('❌ Error: $e\n');
  }
}

/// Example 3: Workspace Management
Future<void> exampleWorkspaceManagement() async {
  print('📁 Example 3: Workspace Management');
  print('=' * 50);

  final sdk = AppFlowySDK(
    config: AppFlowyConfig.cloud(),
  );

  try {
    // Sign in first
    await sdk.auth.signInWithPassword(
      email: 'demo@example.com',
      password: 'password123',
    );

    // List all workspaces
    final workspaces = await sdk.getWorkspaces();
    print('✅ Found ${workspaces.length} workspace(s):');
    for (final workspace in workspaces) {
      print('   - ${workspace.name} (${workspace.id})');
      print('     Created: ${workspace.createdAt}');
    }

    // Create a new workspace
    final newWorkspace = await sdk.createWorkspace(
      name: 'My Project Workspace',
    );
    print('\n✅ Created new workspace:');
    print('   Name: ${newWorkspace.name}');
    print('   ID: ${newWorkspace.id}');

    // Get specific workspace
    final workspace = await sdk.getWorkspace(newWorkspace.id);
    print('\n✅ Retrieved workspace: ${workspace.name}');

    await sdk.auth.signOut();
    print('✅ Signed out\n');
  } catch (e) {
    print('❌ Error: $e\n');
  }
}

/// Example 4: Error Handling
Future<void> exampleErrorHandling() async {
  print('⚠️  Example 4: Error Handling');
  print('=' * 50);

  final sdk = AppFlowySDK(
    config: AppFlowyConfig.cloud(),
  );

  // Handle authentication errors
  try {
    await sdk.auth.signInWithPassword(
      email: 'invalid@example.com',
      password: 'wrongpassword',
    );
  } on AuthenticationException catch (e) {
    print('✅ Caught AuthenticationException:');
    print('   Message: ${e.message}');
    print('   Status Code: ${e.statusCode}');
  } on ValidationException catch (e) {
    print('✅ Caught ValidationException:');
    print('   Message: ${e.message}');
    if (e.fieldErrors != null) {
      print('   Field Errors: ${e.fieldErrors}');
    }
  } catch (e) {
    print('❌ Unexpected error: $e');
  }

  // Handle validation errors
  try {
    await sdk.auth.signInWithPassword(
      email: '', // Empty email
      password: 'password',
    );
  } on ValidationException catch (e) {
    print('\n✅ Caught ValidationException for empty email:');
    print('   Message: ${e.message}');
  }

  // Handle network errors
  final offlineSdk = AppFlowySDK(
    config: AppFlowyConfig.selfHosted('http://invalid-host:9999'),
  );

  try {
    await offlineSdk.auth.signInAsGuest();
  } on NetworkException catch (e) {
    print('\n✅ Caught NetworkException:');
    print('   Message: ${e.message}');
  } catch (e) {
    print('\n✅ Caught error connecting to invalid host');
  }

  print();
}
