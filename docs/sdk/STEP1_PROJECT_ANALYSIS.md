# Step 1: Project Analysis & Baseline Validation

**Date:** 2026-02-06
**Status:** In Progress
**Engineer:** AI Assistant (Claude)

## Executive Summary

This document contains the findings from analyzing the AppFlowy codebase to understand the current architecture, Cloud REST API implementation, data models, and build infrastructure. This analysis serves as the foundation for designing and implementing the official AppFlowy SDK.

## 1. Project Structure

### High-Level Architecture

AppFlowy follows a **hybrid architecture** with:
- **Frontend**: Flutter/Dart application (`frontend/appflowy_flutter/`)
- **Backend**: Rust libraries (`frontend/rust-lib/`)
- **Communication**: FFI (Foreign Function Interface) + Protobuf

```
AppFlowy/
├── frontend/
│   ├── appflowy_flutter/          # Flutter UI application
│   │   ├── lib/                   # Main application code
│   │   │   ├── plugins/           # Feature plugins (database, document, etc.)
│   │   │   ├── user/              # User management & authentication
│   │   │   ├── workspace/         # Workspace management
│   │   │   └── ...
│   │   ├── packages/              # Local packages
│   │   │   ├── appflowy_backend/  # FFI bridge to Rust
│   │   │   ├── appflowy_result/   # Result type
│   │   │   └── ...
│   │   └── integration_test/      # Integration tests
│   └── rust-lib/                  # Rust backend libraries
│       ├── flowy-core/            # Core application logic
│       ├── flowy-user/            # User management
│       ├── flowy-folder/          # Folder/workspace structure
│       ├── flowy-database2/       # Database operations
│       ├── flowy-document/        # Document management
│       ├── flowy-server/          # Server communication layer
│       ├── flowy-storage/         # File storage
│       ├── flowy-ai/              # AI features
│       ├── dart-ffi/              # FFI bindings for Dart
│       └── ...
```

## 2. Cloud API Architecture

### 2.1 AppFlowy Cloud Client

AppFlowy uses the **`client-api`** crate from the [AppFlowy-Cloud](https://github.com/AppFlowy-IO/AppFlowy-Cloud) repository:

**Location:** Defined in `frontend/rust-lib/Cargo.toml`
```toml
client-api = { git = "https://github.com/AppFlowy-IO/AppFlowy-Cloud", rev = "592f644" }
client-api-entity = { git = "https://github.com/AppFlowy-IO/AppFlowy-Cloud", rev = "592f644" }
```

### 2.2 Server Implementation Structure

**File:** `frontend/rust-lib/flowy-server/src/af_cloud/server.rs`

The `AppFlowyCloudServer` struct provides:
- HTTP REST client (`AFCloudClient`)
- WebSocket client for real-time sync (`WSClient`)
- Authentication token management
- Connection state management

```rust
pub struct AppFlowyCloudServer {
  pub(crate) config: AFCloudConfiguration,
  pub(crate) client: Arc<AFCloudClient>,
  enable_sync: Arc<AtomicBool>,
  network_reachable: Arc<AtomicBool>,
  pub device_id: String,
  ws_client: Arc<WSClient>,
  // ...
}
```

### 2.3 Cloud Service Implementations

Located in `frontend/rust-lib/flowy-server/src/af_cloud/impls/`:

- **`user/cloud_service_impl.rs`** - User authentication and profile management
- **`folder.rs`** - Workspace and folder operations
- **`database.rs`** - Database operations
- **`document.rs`** - Document operations
- **`file_storage.rs`** - File upload/download
- **`search.rs`** - Search functionality
- **`chat.rs`** - AI chat features

Each service implements a corresponding trait defined in the `-pub` crates (e.g., `flowy-user-pub`, `flowy-folder-pub`).

## 3. Authentication Mechanisms

### 3.1 Authentication Flow

**File:** `frontend/appflowy_flutter/lib/user/application/auth/af_cloud_auth_service.dart`

Supported authentication methods:
1. **Email + Password**: Traditional login
2. **Magic Link**: Passwordless email authentication
3. **Passcode**: One-time code authentication
4. **OAuth**: Third-party providers (Google, GitHub, Discord, Apple)
5. **Guest**: Anonymous access

### 3.2 Authentication Services

- **BackendAuthService**: Core authentication logic (Rust FFI)
- **AppFlowyCloudAuthService**: Dart wrapper for cloud authentication
- **UserService**: User profile management

### 3.3 OAuth Implementation

OAuth flow:
1. Client requests OAuth URL from backend
2. Opens web browser with OAuth provider
3. Provider redirects to deep link
4. Deep link handler completes authentication
5. User profile created/retrieved

```dart
Future<FlowyResult<UserProfilePB, FlowyError>> signUpWithOAuth({
  required String platform,  // 'google', 'github', 'discord', 'apple'
  Map<String, String> params = const {},
})
```

## 4. Data Models

### 4.1 Core Entities

AppFlowy uses **Protocol Buffers** for data serialization between Dart and Rust.

#### Workspace
**Rust:** `frontend/rust-lib/flowy-user/src/entities/workspace.rs`

```rust
pub struct WorkspaceMemberPB {
  pub email: String,
  pub name: String,
  pub role: AFRolePB,
  pub avatar_url: Option<String>,
  pub joined_at: Option<i64>,
}
```

#### View (Documents, Databases, etc.)
**Dart:** `frontend/appflowy_flutter/lib/workspace/application/view/view_service.dart`

Views represent any content type (document, database, board, calendar, etc.)

```dart
class ViewService {
  Future<FlowyResult<ViewPB, FlowyError>> createView({
    required String parentViewId,
    required String name,
    required ViewLayoutPB layout,
    // ...
  });
}
```

#### Database
**Dart:** `frontend/appflowy_flutter/lib/plugins/database/domain/database_view_service.dart`

```dart
class DatabaseViewBackendService {
  Future<FlowyResult<DatabasePB, FlowyError>> openDatabase();
  Future<FlowyResult<List<FieldPB>, FlowyError>> getFields();
  Future<FlowyResult<void, FlowyError>> moveRow({
    required String fromRowId,
    required String toRowId,
  });
}
```

**Key Database Entities:**
- `DatabasePB` - Database metadata
- `FieldPB` - Column/field definition
- `RowPB` - Row data
- `CellPB` - Individual cell value
- `ViewPB` - Database view (Grid, Board, Calendar, etc.)

### 4.2 CRDT Integration

AppFlowy uses **Yrs** (Yata CRDT) for collaborative editing:

**Dependencies:**
```toml
collab = { git = "https://github.com/AppFlowy-IO/AppFlowy-Collab", rev = "4dfccef" }
collab-entity = { git = "https://github.com/AppFlowy-IO/AppFlowy-Collab", rev = "4dfccef" }
collab-folder = { git = "https://github.com/AppFlowy-IO/AppFlowy-Collab", rev = "4dfccef" }
collab-document = { git = "https://github.com/AppFlowy-IO/AppFlowy-Collab", rev = "4dfccef" }
collab-database = { git = "https://github.com/AppFlowy-IO/AppFlowy-Collab", rev = "4dfccef" }
```

These libraries provide:
- Real-time collaborative editing
- Conflict-free data synchronization
- Offline editing with sync when online
- WebSocket-based change propagation

## 5. Communication Architecture

### 5.1 FFI Bridge

**Flutter → Rust Communication:**

1. **Dart Side:** `appflowy_backend` package
   - File: `frontend/appflowy_flutter/packages/appflowy_backend/lib/dispatch/dispatch.dart`
   - Uses FFI to call Rust functions
   - Serializes requests using Protobuf

2. **Rust Side:** `dart-ffi` crate
   - File: `frontend/rust-lib/dart-ffi/src/lib.rs`
   - Exposes C-compatible functions
   - Deserializes Protobuf requests
   - Routes to appropriate handlers

### 5.2 Event System

AppFlowy uses an **event-driven architecture**:

```dart
// Example: Get workspace views
FolderEventReadWorkspaceViews(payload).send()

// Example: Open database
DatabaseEventGetDatabase(payload).send()

// Example: Sign in
UserEventSignInWithEmailPassword(payload).send()
```

Events are defined in:
- `flowy-folder/src/event_handler.rs`
- `flowy-database2/src/event_handler.rs`
- `flowy-user/src/event_handler.rs`

## 6. REST API Endpoints (Inferred)

Based on the `client-api` usage in `flowy-server`, the AppFlowy Cloud REST API includes:

### User/Auth Endpoints
- POST `/api/user/sign_in` - Email/password login
- POST `/api/user/sign_up` - Register new user
- POST `/api/user/magic_link` - Request magic link
- GET `/api/user/profile` - Get user profile
- POST `/api/oauth/{provider}` - OAuth authentication

### Workspace Endpoints
- GET `/api/workspace` - List workspaces
- POST `/api/workspace` - Create workspace
- GET `/api/workspace/{id}` - Get workspace details
- GET `/api/workspace/{id}/members` - List members
- POST `/api/workspace/{id}/invite` - Invite member

### Folder/View Endpoints
- GET `/api/workspace/{id}/views` - List views
- POST `/api/workspace/{id}/views` - Create view
- PUT `/api/view/{id}` - Update view
- DELETE `/api/view/{id}` - Delete view

### Database Endpoints
- GET `/api/database/{id}` - Get database
- GET `/api/database/{id}/fields` - Get fields
- GET `/api/database/{id}/rows` - Get rows
- POST `/api/database/{id}/rows` - Create row
- PUT `/api/database/{id}/rows/{row_id}` - Update row
- DELETE `/api/database/{id}/rows/{row_id}` - Delete row

### Document Endpoints
- GET `/api/document/{id}` - Get document
- PUT `/api/document/{id}` - Update document

### Storage Endpoints
- POST `/api/file/upload` - Upload file
- GET `/api/file/{id}` - Download file

**Note:** These endpoints are inferred from the Rust service implementations. The actual OpenAPI specification should be obtained from the AppFlowy-Cloud repository.

## 7. Build System & Infrastructure

### 7.1 Flutter

**Version:** Flutter 3.38.7 (Dart 3.10.7)

**Main pubspec.yaml:** `frontend/appflowy_flutter/pubspec.yaml`

**Build Issue Identified:**
```
Dependency conflict with leak_tracker package.
Status: Non-blocking for SDK development (different package)
```

### 7.2 Rust

**Toolchain:** Rust 1.85 (specified in `frontend/rust-toolchain.toml`)

**Workspace Structure:** Cargo workspace with 33 crates

**Build Command:** `cargo check` or `cargo build`

**Status:** Build initiated successfully, dependencies downloading

### 7.3 Protobuf Generation

Protobuf definitions are **generated at build time** and not committed to git.

**Generation happens via:**
- Rust: `build.rs` scripts in each crate
- Dart: Generated into `appflowy_backend/lib/protobuf/`

## 8. Testing Infrastructure

### 8.1 Integration Tests

**Location:** `frontend/appflowy_flutter/integration_test/`

Test categories:
- `desktop/cloud/` - Cloud-specific tests
- `mobile/cloud/` - Mobile cloud tests
- Local tests for offline functionality

**Example Tests:**
- `cloud/uncategorized/appflowy_cloud_auth_test.dart` - Authentication
- `cloud/database/database_test_runner.dart` - Database operations
- `cloud/workspace/workspace_settings_test.dart` - Workspace management

### 8.2 Rust Tests

**Location:** `frontend/rust-lib/event-integration-test/tests/`

Test structure:
- `user/af_cloud_test/` - User service tests
- `database/af_cloud/` - Database tests
- `document/af_cloud_test/` - Document tests
- `folder/local_test/` - Folder tests

## 9. Key Findings for SDK Design

### 9.1 Strengths to Leverage

1. **Well-defined service layer** - Clear separation between UI and business logic
2. **Protobuf schemas** - Strong typing already exists
3. **Event-driven architecture** - Clean abstraction over FFI
4. **Cloud client library** - `client-api` crate provides REST client
5. **CRDT integration** - Collaborative features already implemented

### 9.2 SDK Architecture Considerations

1. **Layered Approach:**
   ```
   SDK High-Level API (Workspace, Database, Row, Field abstractions)
   ↓
   SDK Core Layer (API client, authentication, serialization)
   ↓
   AppFlowy Cloud REST API / CRDT Sync
   ```

2. **Two SDK Tracks:**
   - **Primary:** Flutter/Dart SDK (reuse existing code patterns)
   - **Secondary:** Python SDK (new implementation)

3. **Reusable Components:**
   - Protobuf schemas (can generate for Python)
   - REST API client patterns from `client-api`
   - Authentication flow
   - Entity models

4. **Challenges:**
   - Current code is tightly coupled to FFI/Rust backend
   - CRDT sync is WebSocket-based, requires connection management
   - No existing REST-only path (all goes through Rust layer)

## 10. Next Steps

### 10.1 Immediate Actions

1. ✅ Create directory structure (`sdk/`, `docs/sdk/`)
2. ⏳ Complete Rust build verification
3. ⏳ Obtain official OpenAPI spec from AppFlowy-Cloud repo
4. ⏳ Document all REST endpoints and request/response schemas
5. ⏳ Identify core use cases for SDK

### 10.2 Step 2 Prerequisites

Before moving to Step 2 (Implementation Planning):
- Verify Rust backend builds successfully
- Understand exact REST API structure
- Define SDK scope (which operations to include)
- Decide on CRDT sync handling strategy

## 11. Questions for User Confirmation

1. **CRDT Sync:** Should the initial SDK focus on REST API only, or also handle real-time CRDT synchronization via WebSocket?

2. **Authentication:** Should the SDK support all auth methods (OAuth, magic link, etc.) or start with email/password only?

3. **Scope:** Should the SDK support all features (AI, storage, search) or focus on core operations (workspace, database, document CRUD)?

4. **Python SDK Priority:** Should we develop Flutter/Dart SDK first then Python, or develop both in parallel?

5. **Self-hosted Support:** How should SDK handle URL configuration for self-hosted instances?

## 12. Status Summary

| Component | Status | Notes |
|-----------|--------|-------|
| Project Structure | ✅ Analyzed | Well-organized hybrid architecture |
| Authentication | ✅ Understood | Multiple auth methods identified |
| Data Models | ✅ Mapped | Protobuf-based, strong typing |
| Cloud API | ⚠️ Partial | Need OpenAPI spec for details |
| CRDT System | ℹ️ Identified | Uses Yrs, WebSocket sync |
| Build System | ⏳ In Progress | Rust build initiated |
| Testing | ✅ Identified | Good test coverage exists |

---

**End of Step 1 Analysis**

Awaiting user confirmation to proceed to Step 2: Implementation Planning.
