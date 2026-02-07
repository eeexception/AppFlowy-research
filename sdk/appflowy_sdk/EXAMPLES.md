# AppFlowy SDK - Examples & Integration Guide

Complete guide to integrating and using the AppFlowy SDK in your applications.

## 📚 Quick Links

- [Installation](#installation)
- [Quick Start](#quick-start)
- [Examples](#examples)
- [Common Patterns](#common-patterns)
- [API Reference](../../docs/sdk/SDK_APPFLOWY.md)

---

## Installation

### 1. Add Dependency

Add to your `pubspec.yaml`:

```yaml
dependencies:
  appflowy_sdk: ^1.0.0-alpha
```

### 2. Install

```bash
flutter pub get
```

### 3. Import

```dart
import 'package:appflowy_sdk/appflowy_sdk.dart';
```

---

## Quick Start

### 5-Minute Integration

```dart
import 'package:appflowy_sdk/appflowy_sdk.dart';

void main() async {
  // 1. Initialize SDK
  final sdk = AppFlowySDK(
    config: AppFlowyConfig.cloud(),
  );

  // 2. Sign in
  await sdk.auth.signInWithPassword(
    email: 'user@example.com',
    password: 'password123',
  );

  // 3. Use it!
  final workspaces = await sdk.getWorkspaces();
  print('Found ${workspaces.length} workspaces');
}
```

---

## Examples

All examples are in the [`example/`](example/) directory and can be run directly.

### 1. Complete Overview [`example/main.dart`](example/main.dart)

**What it shows:**
- ✅ Email/password authentication
- ✅ Guest user authentication
- ✅ Workspace management
- ✅ Error handling

**Run it:**
```bash
dart example/main.dart
```

**Key code snippet:**
```dart
// Sign in
final user = await sdk.auth.signInWithPassword(
  email: 'demo@example.com',
  password: 'password123',
);

// List workspaces
final workspaces = await sdk.getWorkspaces();

// Create workspace
final workspace = await sdk.createWorkspace(name: 'My Project');
```

### 2. Flutter App [`example/flutter_app_example.dart`](example/flutter_app_example.dart)

**What it shows:**
- ✅ Real Flutter app with UI
- ✅ Login screen
- ✅ Workspace list
- ✅ State management
- ✅ Error handling in UI

**Run it:**
```bash
flutter run example/flutter_app_example.dart
```

**Screenshot:**
```
┌─────────────────────────┐
│  AppFlowy SDK Example   │
│                         │
│   📧 Email              │
│   🔒 Password           │
│                         │
│   [ Sign In ]           │
│   [ Continue as Guest ] │
└─────────────────────────┘
```

### 3. Configuration [`example/configuration_examples.dart`](example/configuration_examples.dart)

**What it shows:**
- ✅ AppFlowy Cloud (hosted)
- ✅ Self-hosted instances
- ✅ Local development
- ✅ Custom token storage
- ✅ Environment-based config

**Run it:**
```bash
dart example/configuration_examples.dart
```

**Key code snippets:**
```dart
// Production: AppFlowy Cloud
final sdk = AppFlowySDK(
  config: AppFlowyConfig.cloud(),
);

// Your infrastructure
final sdk = AppFlowySDK(
  config: AppFlowyConfig.selfHosted('https://your-domain.com'),
);

// Local development
final sdk = AppFlowySDK(
  config: AppFlowyConfig.local(port: 80),
);
```

---

## Common Patterns

### Authentication

#### Email/Password Login
```dart
try {
  final user = await sdk.auth.signInWithPassword(
    email: 'user@example.com',
    password: 'password123',
  );
  print('Signed in as: ${user.email}');
} on AuthenticationException catch (e) {
  print('Login failed: ${e.message}');
}
```

#### Guest Mode
```dart
final guestUser = await sdk.auth.signInAsGuest();
print('Guest ID: ${guestUser.id}');
```

#### Check Authentication Status
```dart
if (sdk.isAuthenticated) {
  final user = sdk.auth.currentUser;
  print('Logged in as: ${user?.email}');
} else {
  print('Not authenticated');
}
```

#### Sign Out
```dart
await sdk.auth.signOut();
```

### Workspace Management

#### List Workspaces
```dart
final workspaces = await sdk.getWorkspaces();
for (final workspace in workspaces) {
  print('${workspace.name} (${workspace.id})');
}
```

#### Create Workspace
```dart
final workspace = await sdk.createWorkspace(
  name: 'My New Workspace',
);
print('Created: ${workspace.name}');
```

#### Get Specific Workspace
```dart
final workspace = await sdk.getWorkspace(workspaceId);
print('Workspace: ${workspace.name}');
```

### Error Handling

#### Catch Specific Exceptions
```dart
try {
  await sdk.auth.signInWithPassword(email: email, password: password);
} on ValidationException catch (e) {
  // Input validation failed
  print('Validation error: ${e.fieldErrors}');
} on AuthenticationException catch (e) {
  // Invalid credentials
  print('Authentication failed: ${e.message}');
} on NetworkException catch (e) {
  // Network/connection issues
  print('Network error: ${e.message}');
} on AppFlowyException catch (e) {
  // Any other AppFlowy error
  print('Error: ${e.message}');
}
```

#### Check Error Types
```dart
try {
  // ... operation
} catch (e) {
  if (e is ValidationException && e.fieldErrors != null) {
    for (final entry in e.fieldErrors!.entries) {
      print('${entry.key}: ${entry.value.join(", ")}');
    }
  }
}
```

### Flutter Integration

#### With State Management
```dart
class AppState extends ChangeNotifier {
  final AppFlowySDK _sdk;
  bool _isAuthenticated = false;

  AppState(this._sdk);

  bool get isAuthenticated => _isAuthenticated;

  Future<void> signIn(String email, String password) async {
    await _sdk.auth.signInWithPassword(email: email, password: password);
    _isAuthenticated = true;
    notifyListeners();
  }

  Future<void> signOut() async {
    await _sdk.auth.signOut();
    _isAuthenticated = false;
    notifyListeners();
  }
}
```

#### In a Widget
```dart
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late AppFlowySDK _sdk;
  List<Workspace>? _workspaces;

  @override
  void initState() {
    super.initState();
    _sdk = AppFlowySDK(config: AppFlowyConfig.cloud());
    _loadWorkspaces();
  }

  Future<void> _loadWorkspaces() async {
    final workspaces = await _sdk.getWorkspaces();
    setState(() => _workspaces = workspaces);
  }

  @override
  Widget build(BuildContext context) {
    if (_workspaces == null) {
      return CircularProgressIndicator();
    }
    return ListView.builder(
      itemCount: _workspaces!.length,
      itemBuilder: (context, index) {
        final workspace = _workspaces![index];
        return ListTile(
          title: Text(workspace.name),
          subtitle: Text(workspace.id),
        );
      },
    );
  }
}
```

---

## Configuration Options

### AppFlowyConfig Properties

```dart
AppFlowyConfig(
  baseUrl: 'https://api.appflowy.io',  // API endpoint
  timeout: Duration(seconds: 30),       // Request timeout
  enableLogging: false,                 // Debug logging
  tokenStorage: myTokenStorage,         // Custom token storage
)
```

### Presets

| Preset | Usage | Base URL |
|--------|-------|----------|
| `AppFlowyConfig.cloud()` | AppFlowy Cloud (hosted) | `https://api.appflowy.io` |
| `AppFlowyConfig.selfHosted(url)` | Your infrastructure | Custom URL |
| `AppFlowyConfig.local(port: 80)` | Local development | `http://localhost:{port}` |

---

## Testing Your Integration

### 1. Unit Tests

Test your business logic with mocked SDK:

```dart
import 'package:mockito/mockito.dart';
import 'package:appflowy_sdk/appflowy_sdk.dart';

class MockAppFlowySDK extends Mock implements AppFlowySDK {}

void main() {
  test('handles authentication', () async {
    final mockSdk = MockAppFlowySDK();
    when(mockSdk.auth.signInWithPassword(
      email: anyNamed('email'),
      password: anyNamed('password'),
    )).thenAnswer((_) async => UserProfile(
      id: 'test-id',
      email: 'test@example.com',
    ));

    // Test your code that uses mockSdk
  });
}
```

### 2. Integration Tests

Test against real AppFlowy Cloud:

```dart
void main() {
  test('integration test', () async {
    final sdk = AppFlowySDK(
      config: AppFlowyConfig.local(port: 80),
    );

    final user = await sdk.auth.signInWithPassword(
      email: 'test@appflowy.io',
      password: 'testpassword123',
    );

    expect(user.email, equals('test@appflowy.io'));
  });
}
```

---

## Troubleshooting

### "Cannot connect to AppFlowy Cloud"

**Solution:** Make sure AppFlowy Cloud is running:
```bash
# Check if it's accessible
curl http://localhost/api/health

# Start it with Docker
docker-compose up -d
```

### "Authentication failed"

**Solution:** Verify credentials or create a test user:
```bash
curl -X POST http://localhost/gotrue/signup \
  -H "Content-Type: application/json" \
  -d '{"email":"test@appflowy.io","password":"testpassword123"}'
```

### "User not found" errors

**Solution:** User exists in authentication but not initialized in AppFlowy Cloud. The SDK should auto-initialize, but if you see this:

```bash
# Get your access token first
TOKEN="your-access-token"

# Initialize manually
curl http://localhost/api/user/verify/$TOKEN
```

---

## Next Steps

- 📖 [Complete API Documentation](../../docs/sdk/SDK_APPFLOWY.md)
- 🧪 [Integration Tests](test/integration/) - More examples
- 💬 [AppFlowy Discord](https://discord.gg/9Q2xaN37tV) - Get help
- 🐛 [Report Issues](https://github.com/AppFlowy-IO/AppFlowy/issues)

---

## Need Help?

- Check the [API Documentation](../../docs/sdk/SDK_APPFLOWY.md)
- Look at [Integration Tests](test/integration/) for more examples
- Ask in [AppFlowy Discord](https://discord.gg/9Q2xaN37tV)
- Open an issue on [GitHub](https://github.com/AppFlowy-IO/AppFlowy/issues)

Happy building with AppFlowy! 🚀
