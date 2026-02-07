# Version Compatibility Matrix

This document outlines compatibility between AppFlowy SDK versions and AppFlowy Cloud versions.

## Quick Reference

| SDK Version | AppFlowy Cloud | Flutter | Dart | Status |
|-------------|----------------|---------|------|--------|
| `1.0.0-alpha` | `≥ 0.5.x` | `≥ 3.0.0` | `≥ 3.0.0` | ✅ Current |

## Detailed Compatibility

### SDK Version 1.0.0-alpha

**Release Date:** 2026-02-07

**AppFlowy Cloud Compatibility:**
- ✅ **Fully Supported**: `0.5.x` and later
- ⚠️ **Partial Support**: `0.4.x` (some endpoints may not be available)
- ❌ **Not Supported**: `< 0.4.0`

**Feature Support:**

| Feature | Status | Notes |
|---------|--------|-------|
| Authentication | ✅ Fully supported | Email/password, guest mode |
| Workspace Management | ✅ Fully supported | List, create, get workspaces |
| Database Operations | ✅ Fully supported | CRUD on databases, fields, rows |
| Incremental Sync | ✅ Fully supported | Get rows updated after timestamp |
| Real-time Updates | ❌ Not yet supported | Requires WebSocket implementation |
| Document Collaboration | ⚠️ Limited | Basic read/write, no CRDT yet |
| File Attachments | ❌ Not yet supported | Planned for future release |

**Platform Support:**

| Platform | Status | Notes |
|----------|--------|-------|
| Flutter (iOS) | ✅ Supported | Requires Flutter ≥ 3.0.0 |
| Flutter (Android) | ✅ Supported | Requires Flutter ≥ 3.0.0 |
| Flutter (Web) | ✅ Supported | CORS must be configured |
| Flutter (Desktop) | ✅ Supported | macOS, Windows, Linux |
| Dart (Command Line) | ✅ Supported | Requires Dart ≥ 3.0.0 |

---

## Breaking Changes by Version

### From 1.0.0-alpha to 1.0.0-beta (Planned)

**Expected breaking changes:**
- Database model field names may be standardized
- Error handling exceptions may be refactored
- Configuration API may change

**Migration guide will be provided.**

---

## Testing Your Compatibility

### Check SDK Version

```dart
import 'package:appflowy_sdk/appflowy_sdk.dart';

void main() {
  // Version is available in pubspec.yaml
  print('Using AppFlowy SDK 1.0.0-alpha');
}
```

### Check AppFlowy Cloud Version

```dart
final sdk = AppFlowySDK(config: AppFlowyConfig.cloud());

try {
  await sdk.auth.signInWithPassword(email: 'test@example.com', password: 'test');
  print('✅ Compatible with AppFlowy Cloud');
} catch (e) {
  print('❌ Compatibility issue: $e');
}
```

### Verify API Endpoints

```bash
# Check AppFlowy Cloud health
curl http://localhost/api/health

# Check if database endpoints are available
curl http://localhost/api/workspace/{workspace_id}/database \
  -H "Authorization: Bearer {token}"
```

---

## Reporting Compatibility Issues

If you encounter compatibility issues:

1. **Check Version**: Ensure you're using compatible versions
2. **Review Changelog**: Check for known issues in [CHANGELOG.md](CHANGELOG.md)
3. **Report Issue**: Open an issue at https://github.com/AppFlowy-IO/AppFlowy-SDK/issues

Include:
- SDK version (`pubspec.yaml`)
- AppFlowy Cloud version
- Platform (iOS, Android, Web, etc.)
- Error message and stack trace
- Minimal reproduction code

---

## Support Policy

| Version Type | Support Duration | Updates |
|-------------|------------------|---------|
| **alpha** | Until beta release | Bug fixes, breaking changes allowed |
| **beta** | Until stable release | Bug fixes, minor changes |
| **stable** | 12 months after next major | Security updates, bug fixes |
| **LTS** | 24 months | Security updates only |

---

## Upgrade Guide

### Staying Up to Date

```bash
# Check for SDK updates
flutter pub outdated

# Upgrade to latest compatible version
flutter pub upgrade appflowy_sdk

# Upgrade to specific version
flutter pub upgrade appflowy_sdk:^1.0.0
```

### Safe Upgrade Strategy

1. **Read Changelog**: Review breaking changes
2. **Update Dependencies**: `flutter pub upgrade`
3. **Run Tests**: Ensure your tests pass
4. **Test Integration**: Verify against your AppFlowy Cloud instance
5. **Deploy Gradually**: Use feature flags for gradual rollout

---

## Version Support Timeline

```
1.0.0-alpha (Current) ─────────────┐
                                   │ Active Development
1.0.0-beta (Q2 2026)    ───────────┤
                                   │ Feature Complete
1.0.0 Stable (Q3 2026)  ───────────┤
                                   │ Production Ready
                                   └─────────────────>
```

---

## Frequently Asked Questions

### Q: Can I use alpha in production?

**A:** Alpha releases are not recommended for production. They may contain bugs and breaking changes. Use for development and testing only.

### Q: How do I know if my AppFlowy Cloud version is compatible?

**A:** The SDK will attempt to connect and may fail with error messages if incompatible. Check the compatibility matrix above.

### Q: What happens if I use an incompatible version?

**A:** You may encounter:
- API endpoint not found errors (404)
- Unexpected response formats
- Missing features

### Q: How often are updates released?

**A:** During alpha/beta, updates may be released weekly. After stable release, we follow a regular monthly or quarterly schedule for minor versions.

---

Last Updated: 2026-02-07
