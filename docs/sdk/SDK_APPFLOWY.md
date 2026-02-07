# AppFlowy SDK - Official Documentation

**Version:** 1.0.0-alpha
**Last Updated:** 2026-02-06
**Language:** Flutter/Dart (Primary), Python (Secondary)
**License:** AGPL-3.0 / Commercial

---

## Table of Contents

1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Quick Start](#quick-start)
4. [Architecture](#architecture)
5. [Authentication](#authentication)
6. [Core Concepts](#core-concepts)
7. [API Reference](#api-reference)
8. [Error Handling](#error-handling)
9. [Examples](#examples)
10. [Best Practices](#best-practices)
11. [Stability Guarantees](#stability-guarantees)
12. [Contributing](#contributing)

---

## 1. Introduction

### 1.1 What is AppFlowy SDK?

The **AppFlowy SDK** is the official software development kit that enables developers to integrate AppFlowy's collaborative workspace and database capabilities into their own applications. It provides typed, high-level abstractions over the AppFlowy Cloud REST API, making it easy to:

- **Build internal tools**: Dashboards, support tooling, CRM systems
- **Create custom applications**: Use AppFlowy as a backend for web/mobile apps
- **Integrate with third-party services**: Connect AppFlowy data to external systems
- **Automate workflows**: Build scripts and automation tools
- **Analyze data**: Read and process AppFlowy workspace data

### 1.2 Key Features

✅ **Type-Safe**: Strongly typed models with full IDE support
✅ **High-Level Abstractions**: Work with Workspaces, Databases, Rows, and Fields directly
✅ **Authentication**: Email/password, guest mode, automatic token refresh
✅ **Error Handling**: Comprehensive exception hierarchy with detailed error messages
✅ **REST API Only**: No CRDT sync complexity (for now)
✅ **All Features**: Workspace, Database, Document, AI, Storage, Search, Chat
✅ **Self-Hosted Support**: Works with both AppFlowy Cloud and self-hosted instances

### 1.3 Requirements

**Flutter/Dart:**
- Dart SDK: >=3.0.0 <4.0.0
- Flutter: >=3.16.0

**Python (Future):**
- Python: >=3.10

### 1.4 Limitations

⚠️ **No Real-Time Sync**: This SDK uses REST API only. Real-time collaborative editing via WebSocket/CRDT is not supported in v1.0.
⚠️ **No Offline Support**: Requires active internet connection.
⚠️ **Read-After-Write Consistency**: Some operations may have slight delays.

---

## 2. Installation

### 2.1 Flutter/Dart

Add to your `pubspec.yaml`:

```yaml
dependencies:
  appflowy_sdk: ^1.0.0
```

Then run:

```bash
flutter pub get
```

### 2.2 Python (Coming Soon)

```bash
pip install appflowy-sdk
```

---

## 3. Quick Start

### 3.1 Initialize SDK

```dart
import 'package:appflowy_sdk/appflowy_sdk.dart';

// For AppFlowy Cloud
final sdk = AppFlowySDK(
  config: AppFlowyConfig.cloud(),
);

// For self-hosted instance
final sdk = AppFlowySDK(
  config: AppFlowyConfig.selfHosted('https://your-instance.com'),
);
```

### 3.2 Authenticate

```dart
// Sign in with email/password
try {
  final user = await sdk.auth.signInWithPassword(
    email: 'user@example.com',
    password: 'your-password',
  );
  print('Signed in as: ${user.name}');
} on AuthenticationException catch (e) {
  print('Authentication failed: ${e.message}');
}
```

### 3.3 List Workspaces

```dart
final workspaces = await sdk.getWorkspaces();
for (final workspace in workspaces) {
  print('Workspace: ${workspace.name} (${workspace.id})');
}
```

### 3.4 Work with Database

```dart
// Get first workspace
final workspace = workspaces.first;

// Create a database
final database = await workspace.createDatabase(name: 'Customers');

// Add fields
await database.createField(name: 'Name', type: FieldType.richText);
await database.createField(name: 'Email', type: FieldType.email);

// Add a row
final row = await database.createRow({
  'Name': 'John Doe',
  'Email': 'john@example.com',
});

// Read rows
final rows = await database.getRows(limit: 10);
for (final row in rows) {
  print('${row.getCellValue('Name')}: ${row.getCellValue('Email')}');
}

// Update a row
await row.updateCell('Name', 'Jane Doe');

// Delete a row
await row.delete();
```

---

## 4. Architecture

### 4.1 SDK Layers

```
┌─────────────────────────────────────┐
│   High-Level API Layer             │
│   (Workspace, Database, Row, etc.)  │
└─────────────────────────────────────┘
           ↓
┌─────────────────────────────────────┐
│   Service Layer                     │
│   (WorkspaceService, DatabaseService)│
└─────────────────────────────────────┘
           ↓
┌─────────────────────────────────────┐
│   HTTP Client Layer                 │
│   (AppFlowyClient, Auth, Serialization)│
└─────────────────────────────────────┘
           ↓
┌─────────────────────────────────────┐
│   AppFlowy Cloud REST API           │
└─────────────────────────────────────┘
```

### 4.2 Design Principles

1. **Simplicity**: Intuitive, Dart-idiomatic API
2. **Type Safety**: Leverage Dart's type system
3. **Immutability**: Models are immutable (using Freezed)
4. **Async First**: All I/O operations are async
5. **Error Transparency**: Clear, actionable error messages
6. **Resource Management**: Automatic cleanup and connection pooling

---

## 5. Authentication

### 5.1 Sign In with Email/Password

```dart
final user = await sdk.auth.signInWithPassword(
  email: 'user@example.com',
  password: 'password123',
);
```

**Response:**
```dart
class UserProfile {
  final String id;
  final String email;
  final String name;
  final String? avatarUrl;
  final DateTime createdAt;
}
```

### 5.2 Sign In as Guest

```dart
final user = await sdk.auth.signInAsGuest();
```

### 5.3 Get Current User

```dart
final user = await sdk.auth.getCurrentUser();
print('Current user: ${user.name} (${user.email})');
```

### 5.4 Sign Out

```dart
await sdk.auth.signOut();
```

### 5.5 Token Management

The SDK automatically handles token refresh. Access tokens are stored securely and refreshed when expired.

**Manual Token Refresh:**
```dart
await sdk.auth.refreshToken();
```

**Check Token Status:**
```dart
final isAuthenticated = sdk.auth.isAuthenticated;
```

---

## 6. Core Concepts

### 6.1 Workspace

A **Workspace** is the top-level organizational unit in AppFlowy. It contains views (pages, databases, documents) and members.

```dart
class Workspace {
  final String id;
  final String name;
  final DateTime createdAt;
  final List<WorkspaceMember> members;
}
```

### 6.2 View

A **View** represents any content type: document, database, board, calendar, etc.

```dart
enum ViewLayout {
  document,
  grid,
  board,
  calendar,
  chat,
}

class View {
  final String id;
  final String name;
  final ViewLayout layout;
  final String workspaceId;
  final String? parentViewId;
}
```

### 6.3 Database

A **Database** is a structured collection of data with fields (columns) and rows.

```dart
class Database {
  final String id;
  final String name;
  final String workspaceId;
  final List<Field> fields;
}
```

### 6.4 Field (Column)

A **Field** defines the structure of a database column.

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
  createdTime,
  updatedTime,
  createdBy,
  lastEditedBy,
}

class Field {
  final String id;
  final String name;
  final FieldType type;
  final Map<String, dynamic>? typeOptions;
}
```

### 6.5 Row

A **Row** represents a record in a database.

```dart
class Row {
  final String id;
  final String databaseId;
  final Map<String, dynamic> cells;
  final DateTime createdAt;
  final DateTime updatedAt;
}
```

---

## 7. API Reference

### 7.1 AppFlowySDK

#### Constructor

```dart
AppFlowySDK({
  required AppFlowyConfig config,
  TokenStorage? tokenStorage,
})
```

**Parameters:**
- `config`: SDK configuration (cloud or self-hosted)
- `tokenStorage`: Optional custom token storage implementation

#### Properties

```dart
AuthService get auth;
bool get isAuthenticated;
```

#### Methods

```dart
// Get all workspaces
Future<List<Workspace>> getWorkspaces();

// Create a workspace
Future<Workspace> createWorkspace({
  required String name,
});

// Get a specific workspace
Future<Workspace> getWorkspace(String workspaceId);
```

---

### 7.2 AuthService

#### Methods

```dart
// Sign in with email/password
Future<UserProfile> signInWithPassword({
  required String email,
  required String password,
});

// Sign in as guest
Future<UserProfile> signInAsGuest();

// Get current user profile
Future<UserProfile> getCurrentUser();

// Update user profile
Future<void> updateProfile({
  String? name,
  String? avatarUrl,
});

// Refresh authentication token
Future<void> refreshToken();

// Sign out
Future<void> signOut();

// Delete account
Future<void> deleteAccount();
```

#### Properties

```dart
bool get isAuthenticated;
UserProfile? get currentUser;
```

---

### 7.3 Workspace

#### Properties

```dart
String get id;
String get name;
DateTime get createdAt;
List<WorkspaceMember> get members;
```

#### Methods

```dart
// Refresh workspace data
Future<void> refresh();

// Update workspace
Future<void> update({
  String? name,
});

// Get all views in workspace
Future<List<View>> getViews();

// Create a view
Future<View> createView({
  required String name,
  required ViewLayout layout,
  String? parentViewId,
});

// Get workspace members
Future<List<WorkspaceMember>> getMembers();

// Invite a member
Future<void> inviteMember({
  required String email,
  required Role role,
});

// Remove a member
Future<void> removeMember(String email);

// Get workspace usage statistics
Future<WorkspaceUsage> getUsage();

// Create a database (convenience method)
Future<Database> createDatabase({
  required String name,
  String? parentViewId,
});

// Get a database
Future<Database> getDatabase(String databaseId);

// Create a document (convenience method)
Future<Document> createDocument({
  required String name,
  String? parentViewId,
});

// Get a document
Future<Document> getDocument(String documentId);

// Delete workspace
Future<void> delete();

// Leave workspace
Future<void> leave();
```

---

### 7.4 Database

#### Properties

```dart
String get id;
String get name;
String get workspaceId;
List<Field> get fields;
```

#### Methods

```dart
// Refresh database metadata
Future<void> refresh();

// Update database
Future<void> update({String? name});

// ===== Field Operations =====

// Get all fields
Future<List<Field>> getFields();

// Create a field
Future<Field> createField({
  required String name,
  required FieldType type,
  Map<String, dynamic>? typeOptions,
});

// Update a field
Future<void> updateField(
  String fieldId, {
  String? name,
  Map<String, dynamic>? typeOptions,
});

// Delete a field
Future<void> deleteField(String fieldId);

// ===== Row Operations =====

// Get all rows
Future<List<Row>> getRows({
  int? limit,
  int? offset,
});

// Get a specific row
Future<Row> getRow(String rowId);

// Create a row
Future<Row> createRow(Map<String, dynamic> cellData);

// Update a row
Future<Row> updateRow(
  String rowId,
  Map<String, dynamic> cellData,
);

// Delete a row
Future<void> deleteRow(String rowId);

// ===== Batch Operations =====

// Create multiple rows at once
Future<List<Row>> batchCreateRows(
  List<Map<String, dynamic>> rowsData,
);

// Update multiple rows at once
Future<void> batchUpdateRows(
  Map<String, Map<String, dynamic>> updates,
);

// Delete multiple rows at once
Future<void> batchDeleteRows(List<String> rowIds);
```

---

### 7.5 Row

#### Properties

```dart
String get id;
String get databaseId;
Map<String, dynamic> get cells;
DateTime get createdAt;
DateTime get updatedAt;
```

#### Methods

```dart
// Get cell value by field ID or name
dynamic getCellValue(String fieldIdOrName);

// Update a single cell
Future<void> updateCell(String fieldIdOrName, dynamic value);

// Update multiple cells
Future<void> update(Map<String, dynamic> cellUpdates);

// Delete this row
Future<void> delete();

// Refresh row data
Future<void> refresh();
```

---

### 7.6 Field

#### Properties

```dart
String get id;
String get name;
FieldType get type;
Map<String, dynamic>? get typeOptions;
```

#### Methods

```dart
// Update field
Future<void> update({
  String? name,
  Map<String, dynamic>? typeOptions,
});

// Delete field
Future<void> delete();
```

---

### 7.7 Document

#### Properties

```dart
String get id;
String get name;
String get workspaceId;
```

#### Methods

```dart
// Get document content (as JSON string)
Future<String> getContent();

// Update document content
Future<void> updateContent(String content);

// Append content to document
Future<void> appendContent(String content);

// Update document metadata
Future<void> update({String? name});

// Delete document
Future<void> delete();
```

---

### 7.8 StorageService

#### Methods

```dart
// Upload a file
Future<UploadedFile> uploadFile({
  required String workspaceId,
  required Uint8List fileData,
  required String fileName,
  String? mimeType,
});

// Download a file
Future<Uint8List> downloadFile({
  required String workspaceId,
  required String fileId,
});

// Delete a file
Future<void> deleteFile({
  required String workspaceId,
  required String fileId,
});
```

---

### 7.9 AIService

#### Methods

```dart
// Summarize database row
Future<String> summarizeRow({
  required String workspaceId,
  required String databaseId,
  required Map<String, String> rowContent,
});

// Translate database row
Future<Map<String, String>> translateRow({
  required String workspaceId,
  required Map<String, String> rowContent,
  required String targetLanguage,
});
```

---

### 7.10 SearchService

#### Methods

```dart
// Search workspace
Future<List<SearchResult>> search({
  required String workspaceId,
  required String query,
  int? limit,
});
```

**SearchResult:**
```dart
class SearchResult {
  final String id;
  final String type; // 'document', 'database', 'row', etc.
  final String name;
  final String? preview;
  final Map<String, dynamic> metadata;
}
```

---

### 7.11 ChatService

#### Methods

```dart
// Send a chat message
Future<ChatMessage> sendMessage({
  required String workspaceId,
  required String chatId,
  required String content,
});

// Get chat history
Future<List<ChatMessage>> getChatHistory({
  required String workspaceId,
  required String chatId,
  int? limit,
});
```

---

## 8. Error Handling

### 8.1 Exception Hierarchy

```dart
abstract class AppFlowyException implements Exception {
  final String message;
  final int? statusCode;
  final String? details;
}

// Authentication errors (401)
class AuthenticationException extends AppFlowyException {}

// Authorization/Permission errors (403)
class AuthorizationException extends AppFlowyException {}

// Resource not found (404)
class NotFoundException extends AppFlowyException {}

// Validation errors (400)
class ValidationException extends AppFlowyException {
  final Map<String, List<String>>? fieldErrors;
}

// Network connectivity issues
class NetworkException extends AppFlowyException {}

// Server errors (500)
class ServerException extends AppFlowyException {}

// Rate limiting (429)
class RateLimitException extends AppFlowyException {
  final Duration? retryAfter;
}
```

### 8.2 Error Handling Best Practices

```dart
try {
  final workspaces = await sdk.getWorkspaces();
} on AuthenticationException catch (e) {
  // Token expired or invalid
  print('Authentication failed: ${e.message}');
  // Redirect to login
} on AuthorizationException catch (e) {
  // User doesn't have permission
  print('Access denied: ${e.message}');
} on NotFoundException catch (e) {
  // Resource doesn't exist
  print('Not found: ${e.message}');
} on ValidationException catch (e) {
  // Invalid input data
  print('Validation error: ${e.message}');
  print('Field errors: ${e.fieldErrors}');
} on NetworkException catch (e) {
  // Network issue
  print('Network error: ${e.message}');
  // Show offline message
} on ServerException catch (e) {
  // Server error
  print('Server error: ${e.message}');
  // Show retry message
} on AppFlowyException catch (e) {
  // Catch-all for any AppFlowy error
  print('AppFlowy error: ${e.message}');
}
```

---

## 9. Examples

### 9.1 Building a Simple Dashboard

```dart
import 'package:appflowy_sdk/appflowy_sdk.dart';

Future<void> buildDashboard() async {
  // Initialize SDK
  final sdk = AppFlowySDK(config: AppFlowyConfig.cloud());

  // Authenticate
  await sdk.auth.signInWithPassword(
    email: 'user@example.com',
    password: 'password',
  );

  // Get workspaces
  final workspaces = await sdk.getWorkspaces();
  print('You have ${workspaces.length} workspaces');

  // Get first workspace
  final workspace = workspaces.first;
  print('Workspace: ${workspace.name}');

  // Get all databases in workspace
  final views = await workspace.getViews();
  final databases = views.where((v) => v.layout == ViewLayout.grid);

  print('Found ${databases.length} databases');

  // Display each database
  for (final dbView in databases) {
    final database = await workspace.getDatabase(dbView.id);
    print('\nDatabase: ${database.name}');
    print('Fields: ${database.fields.map((f) => f.name).join(', ')}');

    final rows = await database.getRows(limit: 5);
    print('Row count: ${rows.length}');
  }
}
```

### 9.2 Creating a CRM

```dart
Future<void> createCRM() async {
  final sdk = AppFlowySDK(config: AppFlowyConfig.cloud());
  await sdk.auth.signInWithPassword(email: 'admin@company.com', password: 'pass');

  final workspace = (await sdk.getWorkspaces()).first;

  // Create Customers database
  final customersDb = await workspace.createDatabase(name: 'Customers');

  // Add fields
  await customersDb.createField(name: 'Company Name', type: FieldType.richText);
  await customersDb.createField(name: 'Contact Email', type: FieldType.email);
  await customersDb.createField(name: 'Phone', type: FieldType.phone);
  await customersDb.createField(name: 'Status', type: FieldType.singleSelect);
  await customersDb.createField(name: 'Deal Value', type: FieldType.number);
  await customersDb.createField(name: 'Last Contact', type: FieldType.date);

  // Add sample customers
  await customersDb.batchCreateRows([
    {
      'Company Name': 'Acme Corp',
      'Contact Email': 'contact@acme.com',
      'Phone': '+1-555-0100',
      'Status': 'Active',
      'Deal Value': 50000,
    },
    {
      'Company Name': 'TechStart Inc',
      'Contact Email': 'hello@techstart.io',
      'Phone': '+1-555-0200',
      'Status': 'Lead',
      'Deal Value': 25000,
    },
  ]);

  print('CRM created successfully!');
}
```

### 9.3 Data Migration Script

```dart
Future<void> migrateData() async {
  final sdk = AppFlowySDK(config: AppFlowyConfig.cloud());
  await sdk.auth.signInWithPassword(email: 'user@example.com', password: 'pass');

  final workspace = (await sdk.getWorkspaces()).first;
  final database = await workspace.getDatabase('old-database-id');

  // Fetch all rows
  final rows = await database.getRows();

  print('Migrating ${rows.length} rows...');

  // Transform and update
  for (final row in rows) {
    final oldStatus = row.getCellValue('Status') as String?;
    String? newStatus;

    // Transform status values
    switch (oldStatus) {
      case 'TODO':
        newStatus = 'Not Started';
        break;
      case 'IN_PROGRESS':
        newStatus = 'In Progress';
        break;
      case 'DONE':
        newStatus = 'Completed';
        break;
    }

    if (newStatus != null) {
      await row.updateCell('Status', newStatus);
    }
  }

  print('Migration complete!');
}
```

### 9.4 Automated Report Generator

```dart
Future<void> generateWeeklyReport() async {
  final sdk = AppFlowySDK(config: AppFlowyConfig.cloud());
  await sdk.auth.signInWithPassword(email: 'bot@company.com', password: 'pass');

  final workspace = (await sdk.getWorkspaces()).first;
  final tasksDb = await workspace.getDatabase('tasks-database-id');

  // Get all tasks completed this week
  final rows = await tasksDb.getRows();
  final completedThisWeek = rows.where((row) {
    final status = row.getCellValue('Status');
    final completedDate = row.getCellValue('Completed Date') as DateTime?;
    return status == 'Completed' &&
        completedDate != null &&
        completedDate.isAfter(DateTime.now().subtract(Duration(days: 7)));
  }).toList();

  // Create report document
  final report = await workspace.createDocument(name: 'Weekly Report');

  final content = '''
# Weekly Report

**Period:** ${DateTime.now().subtract(Duration(days: 7))} to ${DateTime.now()}

## Summary
- Total tasks completed: ${completedThisWeek.length}

## Completed Tasks
${completedThisWeek.map((r) => '- ${r.getCellValue('Name')}').join('\n')}
  ''';

  await report.updateContent(content);

  print('Report generated successfully!');
}
```

### 9.5 Integration with External Service

```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> syncToSlack() async {
  final sdk = AppFlowySDK(config: AppFlowyConfig.cloud());
  await sdk.auth.signInWithPassword(email: 'bot@company.com', password: 'pass');

  final workspace = (await sdk.getWorkspaces()).first;
  final tasksDb = await workspace.getDatabase('tasks-id');

  // Get high-priority tasks
  final rows = await tasksDb.getRows();
  final highPriority = rows.where((r) => r.getCellValue('Priority') == 'High');

  if (highPriority.isEmpty) return;

  // Send to Slack
  final slackWebhookUrl = 'https://hooks.slack.com/services/YOUR/WEBHOOK/URL';
  final message = {
    'text': '🚨 High Priority Tasks:',
    'attachments': highPriority.map((row) => {
      'title': row.getCellValue('Name'),
      'text': row.getCellValue('Description'),
      'color': 'danger',
    }).toList(),
  };

  await http.post(
    Uri.parse(slackWebhookUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(message),
  );

  print('Synced ${highPriority.length} tasks to Slack');
}
```

---

## 10. Best Practices

### 10.1 Authentication

✅ **DO:**
- Store tokens securely using `flutter_secure_storage`
- Handle token expiration gracefully
- Sign out users when they close the app (if needed)

❌ **DON'T:**
- Store passwords in plain text
- Log authentication tokens
- Share tokens between users

### 10.2 Error Handling

✅ **DO:**
- Catch specific exception types
- Provide user-friendly error messages
- Retry failed requests with exponential backoff
- Log errors for debugging

❌ **DON'T:**
- Swallow exceptions silently
- Show technical error messages to users
- Retry indefinitely

### 10.3 Performance

✅ **DO:**
- Use pagination for large datasets
- Cache frequently accessed data
- Use batch operations when possible
- Debounce rapid API calls

❌ **DON'T:**
- Fetch all rows without limits
- Make sequential API calls in loops
- Ignore rate limits

### 10.4 Data Integrity

✅ **DO:**
- Validate data before sending to API
- Handle concurrent modifications gracefully
- Use transactions where available

❌ **DON'T:**
- Assume operations always succeed
- Ignore validation errors
- Make assumptions about data structure

---

## 11. Stability Guarantees

### 11.1 Versioning

The SDK follows **Semantic Versioning (SemVer)**:

- **Major version** (1.x.x): Breaking API changes
- **Minor version** (x.1.x): New features, backward compatible
- **Patch version** (x.x.1): Bug fixes, backward compatible

### 11.2 Deprecation Policy

- Deprecated features will be marked with `@Deprecated` annotation
- Deprecation warnings will be provided at least **2 minor versions** before removal
- Migration guides will be provided for breaking changes

### 11.3 Backward Compatibility

Within a major version:
- ✅ Public API signatures won't change
- ✅ Existing functionality won't break
- ⚠️ Internal implementation may change
- ⚠️ New optional parameters may be added

### 11.4 API Stability Levels

| Level | Description | Example |
|-------|-------------|---------|
| **Stable** | Production-ready, won't change | `sdk.auth.signInWithPassword()` |
| **Beta** | Feature-complete, may have minor changes | `sdk.ai.summarizeRow()` |
| **Alpha** | Experimental, may change significantly | `sdk.experimental.*` |

---

## 12. Contributing

We welcome contributions to the AppFlowy SDK!

### 12.1 How to Contribute

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Write tests for your changes
4. Ensure all tests pass (`flutter test`)
5. Commit your changes (`git commit -m 'Add amazing feature'`)
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

### 12.2 Development Setup

```bash
# Clone the repository
git clone https://github.com/AppFlowy-IO/AppFlowy-SDK.git
cd AppFlowy-SDK/sdk/appflowy_sdk

# Install dependencies
flutter pub get

# Run tests
flutter test

# Run integration tests (requires local AppFlowy Cloud instance)
flutter test integration_test/
```

### 12.3 Code Style

- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use `dart format` for formatting
- Use `dart analyze` for linting
- Write dartdoc comments for public APIs

### 12.4 Testing Requirements

- All new features must have unit tests
- Integration tests for API interactions
- Minimum 90% code coverage

---

## Appendix A: Complete REST API Endpoint Reference

### Authentication & User

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/user/verify/{access_token}` | Verify user token |
| GET | `/api/user/profile` | Get user profile |
| GET | `/api/user/workspace` | Get user workspace info |
| POST | `/api/user/update` | Update user profile |
| DELETE | `/api/user` | Delete user account |
| GET | `/api/user/asset/image/person/{person_id}/file/{file_id}` | Get user image |
| POST | `/api/user/asset/image` | Upload user image |

### Workspace Management

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/workspace` | List all workspaces |
| POST | `/api/workspace` | Create workspace |
| PATCH | `/api/workspace` | Update workspace |
| DELETE | `/api/workspace/{workspace_id}` | Delete workspace |
| PUT | `/api/workspace/{workspace_id}/open` | Open workspace |
| POST | `/api/workspace/{workspace_id}/leave` | Leave workspace |
| GET | `/api/workspace/{workspace_id}/settings` | Get workspace settings |
| POST | `/api/workspace/{workspace_id}/settings` | Update workspace settings |
| GET | `/api/workspace/{workspace_id}/usage` | Get workspace usage |

### Workspace Members

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/workspace/{workspace_id}/member` | List members |
| PUT | `/api/workspace/{workspace_id}/member` | Update member |
| DELETE | `/api/workspace/{workspace_id}/member` | Remove member |
| POST | `/api/workspace/{workspace_id}/invite` | Invite member |
| GET | `/api/workspace/invite` | List invitations |
| POST | `/api/workspace/accept-invite/{invite_id}` | Accept invitation |

### Views & Pages

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/workspace/{workspace_id}/folder` | Get folder structure |
| POST | `/api/workspace/{workspace_id}/page-view` | Create page |
| GET | `/api/workspace/{workspace_id}/page-view/{view_id}` | Get page |
| PATCH | `/api/workspace/{workspace_id}/page-view/{view_id}` | Update page |
| POST | `/api/workspace/{workspace_id}/page-view/{view_id}/move` | Move page |
| POST | `/api/workspace/{workspace_id}/page-view/{view_id}/move-to-trash` | Trash page |
| POST | `/api/workspace/{workspace_id}/page-view/{view_id}/restore-from-trash` | Restore page |
| DELETE | `/api/workspace/{workspace_id}/trash/{view_id}` | Delete permanently |

### Collaboration Objects (Collab)

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/workspace/{workspace_id}/collab/{object_id}` | Create collab |
| GET | `/api/workspace/v1/{workspace_id}/collab/{object_id}` | Get collab |
| PUT | `/api/workspace/{workspace_id}/collab/{object_id}` | Update collab |
| DELETE | `/api/workspace/{workspace_id}/collab/{object_id}` | Delete collab |
| POST | `/api/workspace/{workspace_id}/batch/collab` | Batch create |
| GET/POST | `/api/workspace/{workspace_id}/collab_list` | Batch retrieve |

### Database Operations

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/workspace/{workspace_id}/database` | List databases |
| GET | `/api/workspace/{workspace_id}/database/{database_id}/row` | List rows |
| POST | `/api/workspace/{workspace_id}/database/{database_id}/row` | Create row |
| PUT | `/api/workspace/{workspace_id}/database/{database_id}/row` | Update row |
| GET | `/api/workspace/{workspace_id}/database/{database_id}/fields` | Get fields |
| POST | `/api/workspace/{workspace_id}/database/{database_id}/fields` | Create field |
| GET | `/api/workspace/{workspace_id}/database/{database_id}/row/detail` | Get row details |

### Publishing

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/workspace/{workspace_id}/page-view/{view_id}/publish` | Publish page |
| POST | `/api/workspace/{workspace_id}/page-view/{view_id}/unpublish` | Unpublish page |
| GET | `/api/workspace/published/{publish_namespace}` | Get published info |
| GET | `/api/workspace/{workspace_id}/published-info` | List published items |

---

## Appendix B: Field Type Options

### SingleSelect / MultiSelect

```dart
{
  'options': [
    {'id': 'opt1', 'name': 'Option 1', 'color': 'blue'},
    {'id': 'opt2', 'name': 'Option 2', 'color': 'green'},
  ]
}
```

### Number

```dart
{
  'format': 'number', // 'number', 'currency', 'percent'
  'decimals': 2,
  'currency': 'USD', // if format is 'currency'
}
```

### Date

```dart
{
  'date_format': 'MM/DD/YYYY',
  'time_format': 'HH:mm',
  'include_time': true,
}
```

---

## Appendix C: Change Log

### Version 1.0.0-alpha (2026-02-06)

**Added:**
- Initial SDK release
- Authentication (email/password, guest)
- Workspace management
- Database CRUD operations
- Document operations
- Storage service
- AI service
- Search service
- Chat service
- Comprehensive error handling
- Full API documentation

**Known Issues:**
- No real-time sync support
- No offline mode
- Limited batch operation support

---

## Support

- **Documentation**: https://docs.appflowy.io
- **GitHub Issues**: https://github.com/AppFlowy-IO/AppFlowy-SDK/issues
- **Discord**: https://discord.gg/9Q2xaN37tV
- **Email**: support@appflowy.io

---

**© 2026 AppFlowy. Licensed under AGPL-3.0.**
