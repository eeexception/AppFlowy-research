# Changelog

All notable changes to the AppFlowy SDK will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0-alpha] - 2026-02-07

### Added
- **Authentication**: Email/password, guest mode, session management
- **Workspace Management**: List, create, and get workspaces
- **Database Operations**:
  - List databases in workspace
  - Get database fields (schema)
  - Add custom fields
  - List row IDs
  - Get row details with cell data
  - Create rows
  - Upsert rows with idempotency
- **Incremental Sync**: Get rows updated after specific timestamp
- **Type-Safe Models**: Freezed immutable models for all entities
- **Error Handling**: Comprehensive exception hierarchy
- **Configuration**: Support for cloud, self-hosted, and local instances
- **Testing**: 37 tests (29 passing integration + unit tests)
- **Documentation**: README, EXAMPLES.md, and working code examples

### Supported AppFlowy Cloud Versions
- ✅ AppFlowy Cloud `0.5.x` and later

### Breaking Changes
- None (initial release)

### Known Limitations
- Row deletion not yet supported (rows archived to trash instead)
- Real-time updates require polling (no WebSocket support yet)
- Document content editing limited to basic operations

---

## Versioning Policy

The AppFlowy SDK follows [Semantic Versioning](https://semver.org/):

- **MAJOR** version for incompatible API changes
- **MINOR** version for new functionality in a backwards-compatible manner
- **PATCH** version for backwards-compatible bug fixes

### Alpha/Beta Releases

- **alpha**: Early preview, APIs may change
- **beta**: Feature-complete, API stabilizing
- **rc**: Release candidate, production-ready pending final testing

### Deprecation Policy

When we need to make breaking changes:
1. The old API is marked as `@deprecated` with migration instructions
2. Deprecated APIs are supported for at least 2 minor versions
3. Warnings include the version when the API will be removed
4. Migration guides are provided in the changelog

Example:
```dart
@Deprecated('Use newMethod() instead. This will be removed in v2.0.0')
void oldMethod() { }
```

### Stability Guarantees

| Package Version | Stability Level | API Changes |
|----------------|-----------------|-------------|
| `1.0.0-alpha` | Alpha | Breaking changes possible |
| `1.0.0-beta` | Beta | Minor breaking changes possible |
| `1.0.0` | Stable | Semantic versioning applies |

---

## Compatibility Matrix

See [VERSION_COMPAT.md](VERSION_COMPAT.md) for detailed compatibility information.
