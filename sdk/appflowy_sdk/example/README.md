# AppFlowy SDK Examples

This directory contains practical examples showing how to use the AppFlowy SDK in real applications.

## Running Examples

### Prerequisites

1. **AppFlowy Cloud Running**
   ```bash
   # Option 1: Use Docker (recommended)
   docker run -d -p 80:80 appflowyio/appflowy_cloud:latest

   # Option 2: Use local AppFlowy Cloud
   cd AppFlowy-Cloud
   docker-compose up -d
   ```

2. **Create Test User**
   ```bash
   curl -X POST http://localhost/gotrue/signup \
     -H "Content-Type: application/json" \
     -d '{"email":"demo@example.com","password":"password123"}'
   ```

3. **Run Examples**
   ```bash
   # Run the main example
   dart example/main.dart

   # Or run specific examples
   dart example/flutter_app_example.dart
   ```

## Examples Overview

### 1. `main.dart` - Complete SDK Overview
Demonstrates all major features:
- ✅ Email/password authentication
- ✅ Guest user authentication
- ✅ Workspace management
- ✅ Error handling

**Run:** `dart example/main.dart`

### 2. `flutter_app_example.dart` - Flutter App Integration
Shows how to integrate the SDK in a real Flutter application:
- ✅ Provider state management
- ✅ UI integration
- ✅ Login screen
- ✅ Workspace list

**Run:** `flutter run example/flutter_app_example.dart`

### 3. `database_operations.dart` - Database CRUD
Demonstrates database operations:
- ✅ Create databases
- ✅ Query rows
- ✅ Update fields
- ✅ Delete records

**Run:** `dart example/database_operations.dart`

### 4. `configuration_examples.dart` - SDK Configuration
Shows different configuration options:
- ✅ AppFlowy Cloud (hosted)
- ✅ Self-hosted instance
- ✅ Local development
- ✅ Custom token storage

**Run:** `dart example/configuration_examples.dart`

## Common Patterns

### Initialize SDK

```dart
import 'package:appflowy_sdk/appflowy_sdk.dart';

// For AppFlowy Cloud (hosted)
final sdk = AppFlowySDK(
  config: AppFlowyConfig.cloud(),
);

// For self-hosted instance
final sdk = AppFlowySDK(
  config: AppFlowyConfig.selfHosted('https://your-domain.com'),
);

// For local development
final sdk = AppFlowySDK(
  config: AppFlowyConfig.local(port: 80),
);
```

### Authentication

```dart
// Sign in with email/password
final user = await sdk.auth.signInWithPassword(
  email: 'user@example.com',
  password: 'password123',
);

// Sign in as guest
final guestUser = await sdk.auth.signInAsGuest();

// Get current user
final currentUser = await sdk.auth.getCurrentUser();

// Sign out
await sdk.auth.signOut();
```

### Workspace Management

```dart
// List workspaces
final workspaces = await sdk.getWorkspaces();

// Create workspace
final workspace = await sdk.createWorkspace(name: 'My Workspace');

// Get specific workspace
final workspace = await sdk.getWorkspace(workspaceId);
```

### Error Handling

```dart
try {
  await sdk.auth.signInWithPassword(
    email: 'user@example.com',
    password: 'wrong',
  );
} on AuthenticationException catch (e) {
  print('Login failed: ${e.message}');
} on ValidationException catch (e) {
  print('Validation error: ${e.fieldErrors}');
} on NetworkException catch (e) {
  print('Network error: ${e.message}');
}
```

## Testing

Each example includes its own test file:

```bash
# Test main example
flutter test test/example/main_test.dart

# Test all examples
flutter test test/example/
```

## Troubleshooting

### "Cannot connect to AppFlowy Cloud"

**Solution:** Make sure AppFlowy Cloud is running:
```bash
curl http://localhost/api/health
```

### "Authentication failed"

**Solution:** Check that test user exists or create one:
```bash
curl -X POST http://localhost/gotrue/signup \
  -H "Content-Type: application/json" \
  -d '{"email":"demo@example.com","password":"password123"}'
```

### "User not found" errors

**Solution:** The user exists in GoTrue but not initialized in AppFlowy Cloud. The SDK should automatically initialize users, but if you see this error, manually initialize:
```bash
TOKEN="your-access-token"
curl http://localhost/api/user/verify/$TOKEN
```

## Next Steps

- Read the [Complete API Documentation](../../docs/sdk/SDK_APPFLOWY.md)
- Check the [Integration Tests](../test/integration/) for more examples
- Join the [AppFlowy Discord](https://discord.gg/9Q2xaN37tV) for help

## Contributing

Found an issue or want to add an example? Contributions welcome!
