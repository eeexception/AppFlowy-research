# AppFlowy SDK for Flutter/Dart

Official Dart/Flutter SDK for AppFlowy Cloud - Build applications using AppFlowy as a data layer.

## Features

✅ **Type-Safe** - Strongly typed models with full IDE support
✅ **High-Level API** - Work with Workspaces, Databases, and Rows directly
✅ **Authentication** - Email/password, guest mode, automatic token refresh
✅ **Error Handling** - Comprehensive exception hierarchy
✅ **REST API** - Simple HTTP-based communication (no WebSocket complexity)

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  appflowy_sdk: ^1.0.0-alpha
```

## Quick Start

```dart
import 'package:appflowy_sdk/appflowy_sdk.dart';

void main() async {
  // Initialize SDK
  final sdk = AppFlowySDK(
    config: AppFlowyConfig.cloud(), // Uses https://api.appflowy.io
  );

  // Sign in
  final user = await sdk.auth.signInWithPassword(
    email: 'user@example.com',
    password: 'password123',
  );
  print('✅ Signed in as: ${user.email}');

  // Get workspaces
  final workspaces = await sdk.getWorkspaces();
  print('📁 You have ${workspaces.length} workspace(s)');

  // Create a new workspace
  final workspace = await sdk.createWorkspace(name: 'My Project');
  print('✅ Created: ${workspace.name}');

  // Sign out
  await sdk.auth.signOut();
}
```

## Examples

The SDK includes comprehensive examples showing real-world usage:

- **[Basic Examples](example/main.dart)** - Authentication, workspaces, error handling
- **[Flutter App](example/flutter_app_example.dart)** - Complete Flutter app with UI
- **[More Examples](example/README.md)** - Database operations, configuration options

Run an example:
```bash
dart example/main.dart
```

## Configuration Options

### AppFlowy Cloud (Hosted)
```dart
final sdk = AppFlowySDK(
  config: AppFlowyConfig.cloud(),
);
```

### Self-Hosted Instance
```dart
final sdk = AppFlowySDK(
  config: AppFlowyConfig.selfHosted('https://your-domain.com'),
);
```

### Local Development
```dart
final sdk = AppFlowySDK(
  config: AppFlowyConfig.local(port: 80),
);
```

## Common Use Cases

### Authentication

```dart
// Email/Password
await sdk.auth.signInWithPassword(
  email: 'user@example.com',
  password: 'password123',
);

// Guest Mode
await sdk.auth.signInAsGuest();

// Get Current User
final user = await sdk.auth.getCurrentUser();

// Sign Out
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
  await sdk.auth.signInWithPassword(email: email, password: password);
} on AuthenticationException catch (e) {
  print('Login failed: ${e.message}');
} on ValidationException catch (e) {
  print('Validation error: ${e.fieldErrors}');
} on NetworkException catch (e) {
  print('Network error: ${e.message}');
}
```

## Documentation

- **[Complete API Documentation](../../docs/sdk/SDK_APPFLOWY.md)** - Full API reference with examples
- **[Example Code](example/)** - Runnable examples for common use cases
- **[Integration Tests](test/integration/)** - More usage examples

## Development

Run tests:
```bash
flutter test
```

Generate code:
```bash
flutter pub run build_runner build
```

## License

AGPL-3.0 / Commercial - See [LICENSE](../../LICENSE)
