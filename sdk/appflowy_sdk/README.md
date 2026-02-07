# AppFlowy SDK for Flutter/Dart

Official Dart/Flutter SDK for AppFlowy Cloud - Build applications using AppFlowy as a data layer.

## Features

✅ **Type-Safe** - Strongly typed models with full IDE support
✅ **High-Level API** - Work with Workspaces, Databases, and Rows directly
✅ **Authentication** - Email/password, guest mode, automatic token refresh
✅ **Database Operations** - Full CRUD on databases, fields, and rows
✅ **Incremental Sync** - Fetch only rows updated after a specific timestamp
✅ **Error Handling** - Comprehensive exception hierarchy
✅ **REST API** - Simple HTTP-based communication (no WebSocket complexity)
✅ **Versioning** - Semantic versioning with compatibility guarantees

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

- **[Working Todo App](example/working_todo_app.dart)** - **COMPLETE working example** showing AppFlowy as a backend
- **[Basic Examples](example/main.dart)** - Authentication, workspaces, error handling
- **[Flutter App](example/flutter_app_example.dart)** - Complete Flutter app with UI
- **[Configuration](example/configuration_examples.dart)** - Different deployment configurations
- **[More Examples](EXAMPLES.md)** - Comprehensive integration guide

Run the working todo app:
```bash
# Start AppFlowy Cloud
docker-compose up -d

# Run the example
dart example/working_todo_app.dart
```

This demonstrates:
- ✅ Authentication & session management
- ✅ Database CRUD operations (create, read, update)
- ✅ Incremental sync (get changes since timestamp)
- ✅ Schema management (add custom fields)
- ✅ Idempotent operations (upsert)

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

### Database Operations

```dart
// List databases
final databases = await sdk.database.listDatabases(workspaceId: workspaceId);

// Get database fields (schema)
final fields = await sdk.database.getFields(
  workspaceId: workspaceId,
  databaseId: databaseId,
);

// Create a new row
final rowId = await sdk.database.createRow(
  workspaceId: workspaceId,
  databaseId: databaseId,
  cellData: {
    'Name': 'John Doe',
    'Email': 'john@example.com',
    'Status': 'Active',
  },
);

// Get all rows
final rows = await sdk.database.getRows(
  workspaceId: workspaceId,
  databaseId: databaseId,
);

// Get rows updated after a timestamp (incremental sync)
final updatedRows = await sdk.database.getUpdatedRows(
  workspaceId: workspaceId,
  databaseId: databaseId,
  after: DateTime.now().subtract(Duration(hours: 1)),
);

// Upsert with idempotency
final rowId = await sdk.database.upsertRow(
  workspaceId: workspaceId,
  databaseId: databaseId,
  preHash: 'unique-identifier',
  cellData: {'Name': 'Updated Name'},
);

// Add a custom field
final fieldId = await sdk.database.addField(
  workspaceId: workspaceId,
  databaseId: databaseId,
  field: InsertDatabaseField(
    name: 'Priority',
    fieldType: FieldTypes.singleSelect,
  ),
);
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

## Versioning & Compatibility

The SDK follows [Semantic Versioning](https://semver.org/):

- **Current Version:** `1.0.0-alpha`
- **Supported AppFlowy Cloud:** `≥ 0.5.x`
- **Stability:** Alpha (breaking changes possible)

See [VERSION_COMPAT.md](VERSION_COMPAT.md) for detailed compatibility information and [CHANGELOG.md](CHANGELOG.md) for version history.

```dart
import 'package:appflowy_sdk/appflowy_sdk.dart';

// Check SDK version
print(SDKVersion.version); // "1.0.0-alpha"
print(SDKVersion.userAgent); // "AppFlowySDK/1.0.0-alpha"
```

## License

AGPL-3.0 / Commercial - See [LICENSE](../../LICENSE)
