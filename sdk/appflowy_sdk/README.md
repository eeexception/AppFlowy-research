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
    config: AppFlowyConfig.cloud(),
  );

  // Sign in
  await sdk.auth.signInWithPassword(
    email: 'user@example.com',
    password: 'password123',
  );

  // Get workspaces
  final workspaces = await sdk.getWorkspaces();
  print('You have ${workspaces.length} workspaces');
}
```

## Documentation

See [SDK_APPFLOWY.md](../../docs/sdk/SDK_APPFLOWY.md) for complete API documentation.

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
