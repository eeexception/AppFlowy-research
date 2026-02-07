# Step 2: SDK Implementation Plan

**Date:** 2026-02-06
**Status:** Ready for Review
**Engineer:** AI Assistant (Claude)

## Executive Summary

This document outlines the detailed implementation plan for the official AppFlowy SDK. The SDK will provide typed, high-level abstractions over the AppFlowy Cloud REST API, enabling developers to build custom applications, dashboards, and integrations using AppFlowy as a data layer.

## 1. SDK Requirements (Confirmed)

### 1.1 Scope
- ✅ **Transport**: REST API only (no WebSocket/CRDT sync initially)
- ✅ **Authentication**: Email/password, guest mode, token-based with refresh
- ✅ **Features**: All features (Workspace, Database, Document, AI, Storage, Search, Chat)
- ✅ **Languages**: Flutter/Dart (primary), Python (secondary)
- ✅ **Development Order**: Flutter/Dart first, then Python

### 1.2 Target Use Cases
1. **Internal Tools**: Dashboards, support tooling, small CRMs
2. **Custom Applications**: Web/mobile apps using AppFlowy as backend
3. **Integrations**: Third-party service integrations
4. **Data Analysis**: Reading and analyzing AppFlowy data
5. **Automation**: Scripts and workflows

## 2. Technology Stack

### 2.1 Flutter/Dart SDK

**Core Dependencies:**
```yaml
dependencies:
  http: ^1.2.0              # HTTP client
  dio: ^5.4.0               # Advanced HTTP client with interceptors
  json_annotation: ^4.8.1   # JSON serialization
  freezed: ^2.4.7           # Immutable models

dev_dependencies:
  build_runner: ^2.4.8      # Code generation
  json_serializable: ^6.7.1 # JSON codegen
  freezed_annotation: ^2.4.1
  mockito: ^5.4.4           # Mocking for tests
  test: ^1.24.9             # Testing framework
```

**Architecture:**
- **Layer 1**: High-level API (Workspace, Database, Row, Field abstractions)
- **Layer 2**: Service layer (WorkspaceService, DatabaseService, etc.)
- **Layer 3**: HTTP client layer (API client, request/response handling)
- **Layer 4**: Core utilities (auth, serialization, error handling)

### 2.2 Python SDK (Future)

**Python Version:** 3.12.8
**Environment Manager:** pipenv or venv

**Core Dependencies:**
```toml
# Pipfile (for pipenv)
[packages]
httpx = ">=0.27.0"        # Async HTTP client
pydantic = ">=2.5.0"      # Data validation and serialization
python-dotenv = ">=1.0.0" # Environment configuration

[dev-packages]
pytest = ">=8.0.0"        # Testing
pytest-asyncio = ">=0.23.0"
black = ">=24.0.0"        # Code formatting
mypy = ">=1.8.0"          # Type checking
ruff = ">=0.1.0"          # Linting

[requires]
python_version = "3.12.8"
```

## 3. SDK Architecture

### 3.1 Directory Structure

```
sdk/
├── appflowy_sdk/                    # Main SDK package
│   ├── lib/
│   │   ├── src/
│   │   │   ├── core/
│   │   │   │   ├── client.dart          # HTTP client
│   │   │   │   ├── auth.dart            # Authentication
│   │   │   │   ├── config.dart          # Configuration
│   │   │   │   ├── exceptions.dart      # Error handling
│   │   │   │   └── types.dart           # Base types
│   │   │   ├── models/
│   │   │   │   ├── workspace.dart       # Workspace models
│   │   │   │   ├── database.dart        # Database models
│   │   │   │   ├── view.dart            # View models
│   │   │   │   ├── row.dart             # Row models
│   │   │   │   ├── field.dart           # Field models
│   │   │   │   ├── user.dart            # User models
│   │   │   │   ├── document.dart        # Document models
│   │   │   │   └── common.dart          # Common models
│   │   │   ├── services/
│   │   │   │   ├── auth_service.dart        # Authentication service
│   │   │   │   ├── workspace_service.dart   # Workspace operations
│   │   │   │   ├── database_service.dart    # Database operations
│   │   │   │   ├── document_service.dart    # Document operations
│   │   │   │   ├── storage_service.dart     # File storage
│   │   │   │   ├── search_service.dart      # Search functionality
│   │   │   │   ├── ai_service.dart          # AI features
│   │   │   │   └── chat_service.dart        # Chat service
│   │   │   └── appflowy_sdk.dart        # Main SDK export
│   │   └── appflowy_sdk.dart            # Public API export
│   ├── test/                            # Unit tests
│   │   ├── unit/
│   │   ├── integration/
│   │   └── mocks/
│   ├── example/                         # Example applications
│   │   ├── simple_dashboard/
│   │   ├── database_crud/
│   │   └── authentication/
│   ├── pubspec.yaml
│   └── README.md
│
└── appflowy_sdk_python/                 # Python SDK (Phase 2)
    ├── appflowy_sdk/
    │   ├── __init__.py
    │   ├── client.py
    │   ├── models/
    │   ├── services/
    │   └── exceptions.py
    ├── tests/
    ├── examples/
    ├── setup.py
    └── README.md
```

### 3.2 Core Components

#### 3.2.1 AppFlowyClient (Core HTTP Client)

```dart
class AppFlowyClient {
  final String baseUrl;
  final String? authToken;
  final Dio _dio;

  AppFlowyClient({
    required this.baseUrl,
    this.authToken,
    Duration timeout = const Duration(seconds: 30),
  });

  // Low-level HTTP methods
  Future<Response> get(String path, {Map<String, dynamic>? params});
  Future<Response> post(String path, {dynamic data});
  Future<Response> put(String path, {dynamic data});
  Future<Response> delete(String path);
  Future<Response> patch(String path, {dynamic data});

  // Token management
  void setAuthToken(String token);
  void clearAuthToken();
  Future<void> refreshToken();
}
```

#### 3.2.2 Authentication System

```dart
class AuthService {
  final AppFlowyClient _client;

  // Email/Password authentication
  Future<AuthResponse> signInWithPassword({
    required String email,
    required String password,
  });

  // Guest authentication
  Future<AuthResponse> signInAsGuest();

  // Token refresh
  Future<TokenResponse> refreshToken(String refreshToken);

  // User profile
  Future<UserProfile> getCurrentUser();

  // Sign out
  Future<void> signOut();
}
```

#### 3.2.3 High-Level Abstractions

**Workspace:**
```dart
class Workspace {
  final String id;
  final String name;
  final DateTime createdAt;
  final List<WorkspaceMember> members;

  // Operations
  Future<List<View>> getViews();
  Future<View> createView({required String name, required ViewLayout layout});
  Future<void> inviteMember({required String email, required Role role});
  Future<List<WorkspaceMember>> getMembers();
}
```

**Database:**
```dart
class Database {
  final String id;
  final String name;
  final String workspaceId;

  // Structure operations
  Future<List<Field>> getFields();
  Future<Field> createField({required String name, required FieldType type});
  Future<void> updateField(String fieldId, {String? name});
  Future<void> deleteField(String fieldId);

  // Data operations
  Future<List<Row>> getRows({int? limit, int? offset});
  Future<Row> getRow(String rowId);
  Future<Row> createRow(Map<String, dynamic> data);
  Future<Row> updateRow(String rowId, Map<String, dynamic> data);
  Future<void> deleteRow(String rowId);

  // Batch operations
  Future<List<Row>> batchCreateRows(List<Map<String, dynamic>> dataList);
  Future<void> batchUpdateRows(Map<String, Map<String, dynamic>> updates);
}
```

**Row:**
```dart
class Row {
  final String id;
  final String databaseId;
  final Map<String, dynamic> cells;
  final DateTime createdAt;
  final DateTime updatedAt;

  // Cell operations
  dynamic getCellValue(String fieldId);
  Future<void> updateCell(String fieldId, dynamic value);
  Future<void> update(Map<String, dynamic> updates);
  Future<void> delete();
}
```

**Field:**
```dart
enum FieldType {
  richText,
  number,
  date,
  singleSelect,
  multiSelect,
  checkbox,
  url,
  email,
  phone,
  // ... other types
}

class Field {
  final String id;
  final String name;
  final FieldType type;
  final Map<String, dynamic>? typeOptions;

  Future<void> update({String? name, Map<String, dynamic>? typeOptions});
  Future<void> delete();
}
```

**Document:**
```dart
class Document {
  final String id;
  final String name;
  final String workspaceId;

  // Content operations
  Future<String> getContent(); // Returns JSON or markdown
  Future<void> updateContent(String content);
  Future<void> appendContent(String content);
}
```

## 4. API Endpoints Mapping

Based on the Rust implementation analysis, here are the REST API endpoints:

### 4.1 Authentication Endpoints

| Method | Endpoint | Description | SDK Method |
|--------|----------|-------------|------------|
| POST | `/api/user/sign_in` | Sign in with email/password | `authService.signInWithPassword()` |
| POST | `/api/user/sign_up` | Register new user | `authService.signUp()` |
| POST | `/api/user/magic_link` | Request magic link | `authService.signInWithMagicLink()` |
| POST | `/api/user/passcode` | Sign in with passcode | `authService.signInWithPasscode()` |
| GET | `/api/user/profile` | Get user profile | `authService.getCurrentUser()` |
| PUT | `/api/user/profile` | Update user profile | `authService.updateProfile()` |
| POST | `/api/user/refresh` | Refresh access token | `authService.refreshToken()` |
| DELETE | `/api/user` | Delete account | `authService.deleteAccount()` |

### 4.2 Workspace Endpoints

| Method | Endpoint | Description | SDK Method |
|--------|----------|-------------|------------|
| GET | `/api/workspace` | List workspaces | `sdk.getWorkspaces()` |
| POST | `/api/workspace` | Create workspace | `sdk.createWorkspace()` |
| GET | `/api/workspace/{id}` | Get workspace details | `workspace.refresh()` |
| PATCH | `/api/workspace/{id}` | Update workspace | `workspace.update()` |
| GET | `/api/workspace/{id}/views` | List views | `workspace.getViews()` |
| GET | `/api/workspace/{id}/members` | List members | `workspace.getMembers()` |
| POST | `/api/workspace/{id}/invite` | Invite member | `workspace.inviteMember()` |
| DELETE | `/api/workspace/{id}/members/{email}` | Remove member | `workspace.removeMember()` |

### 4.3 View/Folder Endpoints

| Method | Endpoint | Description | SDK Method |
|--------|----------|-------------|------------|
| POST | `/api/view` | Create view | `workspace.createView()` |
| GET | `/api/view/{id}` | Get view details | `view.refresh()` |
| PUT | `/api/view/{id}` | Update view | `view.update()` |
| DELETE | `/api/view/{id}` | Delete view | `view.delete()` |
| POST | `/api/view/{id}/move` | Move view | `view.move()` |

### 4.4 Database Endpoints

| Method | Endpoint | Description | SDK Method |
|--------|----------|-------------|------------|
| GET | `/api/database/{id}` | Get database metadata | `database.refresh()` |
| GET | `/api/database/{id}/fields` | Get fields | `database.getFields()` |
| POST | `/api/database/{id}/fields` | Create field | `database.createField()` |
| PUT | `/api/database/{id}/fields/{field_id}` | Update field | `field.update()` |
| DELETE | `/api/database/{id}/fields/{field_id}` | Delete field | `field.delete()` |
| GET | `/api/database/{id}/rows` | Get rows | `database.getRows()` |
| POST | `/api/database/{id}/rows` | Create row | `database.createRow()` |
| GET | `/api/database/{id}/rows/{row_id}` | Get row | `database.getRow()` |
| PUT | `/api/database/{id}/rows/{row_id}` | Update row | `row.update()` |
| DELETE | `/api/database/{id}/rows/{row_id}` | Delete row | `row.delete()` |

### 4.5 Document Endpoints

| Method | Endpoint | Description | SDK Method |
|--------|----------|-------------|------------|
| GET | `/api/document/{id}` | Get document content | `document.getContent()` |
| PUT | `/api/document/{id}` | Update document | `document.updateContent()` |

### 4.6 Storage Endpoints

| Method | Endpoint | Description | SDK Method |
|--------|----------|-------------|------------|
| POST | `/api/file/upload` | Upload file | `storageService.uploadFile()` |
| GET | `/api/file/{id}` | Download file | `storageService.downloadFile()` |
| DELETE | `/api/file/{id}` | Delete file | `storageService.deleteFile()` |

### 4.7 AI Endpoints

| Method | Endpoint | Description | SDK Method |
|--------|----------|-------------|------------|
| POST | `/api/ai/summarize` | Summarize row data | `aiService.summarizeRow()` |
| POST | `/api/ai/translate` | Translate row data | `aiService.translateRow()` |
| POST | `/api/ai/chat` | Send chat message | `chatService.sendMessage()` |

### 4.8 Search Endpoints

| Method | Endpoint | Description | SDK Method |
|--------|----------|-------------|------------|
| GET | `/api/search` | Search workspace | `searchService.search()` |

**Note:** These endpoints are inferred from the Rust `client-api` usage. The actual implementation will need to be verified against the AppFlowy-Cloud OpenAPI specification.

## 5. Data Serialization Strategy

### 5.1 Model Generation

Use **Freezed** and **json_serializable** for Dart models:

```dart
@freezed
class Workspace with _$Workspace {
  const factory Workspace({
    required String id,
    required String name,
    required DateTime createdAt,
    @Default([]) List<WorkspaceMember> members,
  }) = _Workspace;

  factory Workspace.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceFromJson(json);
}
```

### 5.2 Protobuf Compatibility

While the SDK uses JSON for REST API communication, we should ensure compatibility with the existing Protobuf schemas for consistency:

- Field names match protobuf definitions
- Type mappings align with protobuf types
- Enum values match protobuf enums

## 6. Error Handling Strategy

### 6.1 Exception Hierarchy

```dart
abstract class AppFlowyException implements Exception {
  final String message;
  final int? statusCode;
  final String? details;

  AppFlowyException(this.message, {this.statusCode, this.details});
}

class AuthenticationException extends AppFlowyException { }
class AuthorizationException extends AppFlowyException { }
class NotFoundException extends AppFlowyException { }
class ValidationException extends AppFlowyException { }
class NetworkException extends AppFlowyException { }
class ServerException extends AppFlowyException { }
class RateLimitException extends AppFlowyException { }
```

### 6.2 Error Response Handling

```dart
class ErrorResponse {
  final String code;
  final String message;
  final Map<String, dynamic>? details;

  factory ErrorResponse.fromJson(Map<String, dynamic> json);
}
```

## 7. Authentication & Token Management

### 7.1 Token Storage

```dart
abstract class TokenStorage {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> saveRefreshToken(String token);
  Future<String?> getRefreshToken();
  Future<void> clearTokens();
}

// Implementations
class SecureTokenStorage implements TokenStorage { } // flutter_secure_storage
class InMemoryTokenStorage implements TokenStorage { } // For testing
```

### 7.2 Automatic Token Refresh

```dart
class AuthInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Attempt token refresh
      final refreshed = await _authService.refreshToken();
      if (refreshed) {
        // Retry original request
        return handler.resolve(await _retry(err.requestOptions));
      }
    }
    handler.next(err);
  }
}
```

## 8. Testing Strategy

### 8.1 Test Levels

1. **Unit Tests** (90%+ coverage target)
   - Model serialization/deserialization
   - Service logic
   - Error handling
   - Utility functions

2. **Integration Tests**
   - Full API flows
   - Authentication flows
   - CRUD operations
   - Error scenarios

3. **Mock Tests**
   - HTTP client mocking with Mockito
   - Predictable test data

### 8.2 Test Structure

```
test/
├── unit/
│   ├── models/
│   │   ├── workspace_test.dart
│   │   ├── database_test.dart
│   │   └── ...
│   ├── services/
│   │   ├── auth_service_test.dart
│   │   ├── workspace_service_test.dart
│   │   └── ...
│   └── core/
│       ├── client_test.dart
│       └── exceptions_test.dart
├── integration/
│   ├── auth_flow_test.dart
│   ├── database_crud_test.dart
│   ├── workspace_operations_test.dart
│   └── ...
└── mocks/
    ├── mock_client.dart
    ├── mock_responses.dart
    └── test_data.dart
```

### 8.3 Test Data

Create mock API responses based on actual AppFlowy Cloud responses:

```dart
class MockData {
  static const workspaceJson = {
    'id': 'workspace-123',
    'name': 'Test Workspace',
    'created_at': '2024-01-01T00:00:00Z',
    'members': [...],
  };

  static const databaseJson = { ... };
  static const rowJson = { ... };
}
```

## 9. Implementation Phases

### Phase 1: Core Foundation (Week 1)
- [ ] Set up project structure
- [ ] Implement `AppFlowyClient` (HTTP client)
- [ ] Implement authentication system
- [ ] Implement token management
- [ ] Implement error handling
- [ ] Write unit tests for core components

### Phase 2: Models & Serialization (Week 1-2)
- [ ] Define all model classes (Workspace, Database, View, Row, Field, etc.)
- [ ] Implement JSON serialization with Freezed
- [ ] Write model tests
- [ ] Create mock data fixtures

### Phase 3: Service Layer (Week 2-3)
- [ ] Implement `AuthService`
- [ ] Implement `WorkspaceService`
- [ ] Implement `DatabaseService`
- [ ] Implement `DocumentService`
- [ ] Implement `StorageService`
- [ ] Implement `AIService`
- [ ] Implement `SearchService`
- [ ] Implement `ChatService`
- [ ] Write service unit tests (mocked)

### Phase 4: High-Level API (Week 3)
- [ ] Implement `Workspace` class
- [ ] Implement `Database` class
- [ ] Implement `Row` class
- [ ] Implement `Field` class
- [ ] Implement `Document` class
- [ ] Implement `View` class
- [ ] Write high-level API tests

### Phase 5: Integration & Testing (Week 4)
- [ ] Set up local AppFlowy Cloud instance for testing
- [ ] Write integration tests
- [ ] Test all CRUD operations
- [ ] Test authentication flows
- [ ] Test error scenarios
- [ ] Performance testing

### Phase 6: Documentation & Examples (Week 4)
- [ ] Write API documentation
- [ ] Create example applications
- [ ] Write usage guide
- [ ] Create migration guide (if needed)

### Phase 7: Python SDK (Week 5-6)
- [ ] Port architecture to Python
- [ ] Implement core client
- [ ] Implement services
- [ ] Write tests
- [ ] Write documentation

## 10. Configuration & Initialization

### 10.1 SDK Configuration

```dart
class AppFlowyConfig {
  final String baseUrl;
  final Duration timeout;
  final bool enableLogging;
  final TokenStorage? tokenStorage;

  const AppFlowyConfig({
    required this.baseUrl,
    this.timeout = const Duration(seconds: 30),
    this.enableLogging = false,
    this.tokenStorage,
  });

  // Presets
  factory AppFlowyConfig.cloud() => AppFlowyConfig(
    baseUrl: 'https://api.appflowy.io',
  );

  factory AppFlowyConfig.selfHosted(String url) => AppFlowyConfig(
    baseUrl: url,
  );
}
```

### 10.2 SDK Initialization

```dart
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

// Work with database
final database = await workspaces.first.getDatabase('db-id');
final rows = await database.getRows();
```

## 11. Usage Examples

### 11.1 Basic Authentication

```dart
final sdk = AppFlowySDK(config: AppFlowyConfig.cloud());

// Sign in
final user = await sdk.auth.signInWithPassword(
  email: 'user@example.com',
  password: 'password',
);

print('Signed in as: ${user.name}');
```

### 11.2 Database Operations

```dart
// Get workspace
final workspaces = await sdk.getWorkspaces();
final workspace = workspaces.first;

// Create database
final database = await workspace.createDatabase(name: 'Customers');

// Add fields
await database.createField(name: 'Name', type: FieldType.richText);
await database.createField(name: 'Email', type: FieldType.email);
await database.createField(name: 'Status', type: FieldType.singleSelect);

// Add rows
await database.createRow({
  'Name': 'John Doe',
  'Email': 'john@example.com',
  'Status': 'Active',
});

// Query rows
final rows = await database.getRows(limit: 10);
for (final row in rows) {
  print('${row.getCellValue('Name')}: ${row.getCellValue('Email')}');
}

// Update row
await rows.first.updateCell('Status', 'Inactive');

// Delete row
await rows.last.delete();
```

### 11.3 Document Operations

```dart
// Get document
final document = await workspace.getDocument('doc-id');

// Update content
await document.updateContent('# Hello World\n\nThis is my document.');

// Get content
final content = await document.getContent();
print(content);
```

## 12. Performance Considerations

### 12.1 Caching Strategy
- Cache workspace and database metadata
- Implement TTL-based cache invalidation
- Support manual cache refresh

### 12.2 Batch Operations
- Provide batch APIs for bulk operations
- Minimize round-trips to server

### 12.3 Pagination
- Support cursor-based pagination for large datasets
- Lazy loading for collections

## 13. Security Considerations

### 13.1 Token Security
- Store tokens securely (flutter_secure_storage)
- Never log sensitive data
- Clear tokens on logout

### 13.2 Input Validation
- Validate all user inputs
- Sanitize data before sending to API

### 13.3 HTTPS Only
- Enforce HTTPS for all API calls
- Certificate pinning for production (optional)

## 14. Versioning & Compatibility

### 14.1 SDK Versioning
- Follow semantic versioning (SemVer)
- Maintain changelog
- Support backward compatibility within major versions

### 14.2 API Versioning
- Support API version headers
- Handle API version mismatches gracefully

## 15. Deliverables

### 15.1 Code Deliverables
- ✅ `sdk/appflowy_sdk/` - Full SDK implementation
- ✅ Unit tests (90%+ coverage)
- ✅ Integration tests
- ✅ Example applications

### 15.2 Documentation Deliverables
- ✅ API Reference Documentation
- ✅ Usage Guide
- ✅ Migration Guide
- ✅ Architecture Documentation
- ✅ Contribution Guide

### 15.3 CI/CD Setup (Draft)

**Note:** This is a draft configuration. Not tested or verified.

**GitHub Actions Workflows:**

#### Workflow 1: CI Pipeline (`.github/workflows/ci.yml`)

```yaml
name: CI Pipeline

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main, develop ]

jobs:
  flutter-tests:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        flutter-version: ['3.16.0', '3.24.0']

    steps:
      - uses: actions/checkout@v4

      - name: Setup Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: ${{ matrix.flutter-version }}
          channel: 'stable'

      - name: Install dependencies
        working-directory: sdk/appflowy_sdk
        run: flutter pub get

      - name: Analyze code
        working-directory: sdk/appflowy_sdk
        run: flutter analyze

      - name: Check formatting
        working-directory: sdk/appflowy_sdk
        run: dart format --set-exit-if-changed .

      - name: Run unit tests
        working-directory: sdk/appflowy_sdk
        run: flutter test --coverage

      - name: Upload coverage to Codecov
        uses: codecov/codecov-action@v3
        with:
          files: sdk/appflowy_sdk/coverage/lcov.info
          flags: flutter

  python-tests:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4

      - name: Setup Python 3.12.8
        uses: actions/setup-python@v5
        with:
          python-version: '3.12.8'

      - name: Install pipenv
        run: pip install pipenv

      - name: Install dependencies
        working-directory: sdk/appflowy_sdk_python
        run: pipenv install --dev

      - name: Lint with ruff
        working-directory: sdk/appflowy_sdk_python
        run: pipenv run ruff check .

      - name: Type check with mypy
        working-directory: sdk/appflowy_sdk_python
        run: pipenv run mypy appflowy_sdk

      - name: Format check with black
        working-directory: sdk/appflowy_sdk_python
        run: pipenv run black --check .

      - name: Run unit tests
        working-directory: sdk/appflowy_sdk_python
        run: pipenv run pytest --cov=appflowy_sdk --cov-report=xml

      - name: Upload coverage to Codecov
        uses: codecov/codecov-action@v3
        with:
          files: sdk/appflowy_sdk_python/coverage.xml
          flags: python
```

#### Workflow 2: Release Pipeline (`.github/workflows/release.yml`)

```yaml
name: Release Pipeline

on:
  push:
    tags:
      - 'v*.*.*'

jobs:
  build-and-publish-flutter:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4

      - name: Setup Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.24.0'

      - name: Install dependencies
        working-directory: sdk/appflowy_sdk
        run: flutter pub get

      - name: Run tests
        working-directory: sdk/appflowy_sdk
        run: flutter test

      - name: Publish to pub.dev
        working-directory: sdk/appflowy_sdk
        run: flutter pub publish --force
        env:
          PUB_CREDENTIALS: ${{ secrets.PUB_CREDENTIALS }}

      - name: Create GitHub Release
        uses: softprops/action-gh-release@v1
        with:
          files: CHANGELOG.md
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

  build-and-publish-python:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4

      - name: Setup Python 3.12.8
        uses: actions/setup-python@v5
        with:
          python-version: '3.12.8'

      - name: Install pipenv and build tools
        run: pip install pipenv build twine

      - name: Install dependencies
        working-directory: sdk/appflowy_sdk_python
        run: pipenv install --dev

      - name: Run tests
        working-directory: sdk/appflowy_sdk_python
        run: pipenv run pytest

      - name: Build package
        working-directory: sdk/appflowy_sdk_python
        run: python -m build

      - name: Publish to PyPI
        working-directory: sdk/appflowy_sdk_python
        run: twine upload dist/*
        env:
          TWINE_USERNAME: __token__
          TWINE_PASSWORD: ${{ secrets.PYPI_TOKEN }}
```

**Pre-commit Hooks (`.pre-commit-config.yaml`):**

```yaml
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.5.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
      - id: check-yaml
      - id: check-added-large-files

  - repo: local
    hooks:
      - id: flutter-analyze
        name: Flutter Analyze
        entry: bash -c 'cd sdk/appflowy_sdk && flutter analyze'
        language: system
        pass_filenames: false

      - id: flutter-test
        name: Flutter Test
        entry: bash -c 'cd sdk/appflowy_sdk && flutter test'
        language: system
        pass_filenames: false

  - repo: https://github.com/psf/black
    rev: 24.1.1
    hooks:
      - id: black
        args: [--config=sdk/appflowy_sdk_python/pyproject.toml]

  - repo: https://github.com/astral-sh/ruff-pre-commit
    rev: v0.1.14
    hooks:
      - id: ruff
        args: [--fix, --config=sdk/appflowy_sdk_python/pyproject.toml]
```

## 16. Success Criteria

The SDK will be considered successful when:

1. ✅ All core features implemented and tested
2. ✅ 90%+ test coverage achieved
3. ✅ Integration tests pass against live AppFlowy Cloud
4. ✅ Example applications demonstrate key use cases
5. ✅ Documentation is complete and clear
6. ✅ Performance benchmarks meet targets
7. ✅ Security audit passes

## 17. Risks & Mitigations

| Risk | Impact | Mitigation |
|------|--------|------------|
| API endpoints differ from inferred structure | High | Verify against AppFlowy-Cloud OpenAPI spec early |
| Authentication flow complexity | Medium | Reference existing Dart implementation closely |
| Performance issues with large datasets | Medium | Implement pagination and caching early |
| Breaking changes in AppFlowy Cloud API | High | Version SDK separately, maintain compatibility layer |
| Insufficient test coverage | Medium | Enforce coverage requirements in CI/CD |

## 18. Questions & Clarifications Needed

Before proceeding to Step 3 (Public API Design):

1. ✅ **API Specification**: Can you provide access to the AppFlowy-Cloud repository or OpenAPI spec?
2. ✅ **Test Environment**: Do you have a test/staging AppFlowy Cloud instance available?
3. ✅ **Authentication**: Are there any special requirements for API keys or OAuth apps?
4. ✅ **Rate Limiting**: What are the API rate limits?
5. ✅ **Webhook Support**: Should the SDK support webhooks for change notifications?

## 19. Next Steps

Upon approval of this plan:

1. Proceed to **Step 3: Public API Design & Documentation**
2. Create `SDK_APPFLOWY.md` with detailed API specifications
3. Define all public interfaces and method signatures
4. Create comprehensive usage examples
5. Document stability guarantees and versioning policy

---

**End of Implementation Plan**

**Awaiting user confirmation to proceed to Step 3.**
