## AppFlowy SDK Test Suite

This directory contains the comprehensive test suite for the AppFlowy SDK, following Test-Driven Development (TDD) principles.

### Structure

```
test/
├── unit/                      # Unit tests (isolated components)
│   ├── core/
│   │   ├── client_test.dart       # HTTP client tests
│   │   ├── auth_test.dart         # Authentication logic tests
│   │   └── exceptions_test.dart   # Error handling tests
│   ├── models/
│   │   ├── workspace_test.dart    # Workspace model tests
│   │   ├── database_test.dart     # Database model tests
│   │   ├── row_test.dart          # Row model tests
│   │   └── field_test.dart        # Field model tests
│   └── services/
│       ├── auth_service_test.dart      # Auth service tests
│       ├── workspace_service_test.dart # Workspace service tests
│       └── database_service_test.dart  # Database service tests
├── integration/               # Integration tests (full API flows)
│   ├── auth_flow_test.dart
│   ├── database_crud_test.dart
│   └── workspace_operations_test.dart
└── mocks/                     # Mock data and helpers
    ├── mock_data.dart             # Mock JSON responses
    ├── mock_client.dart           # Mock HTTP client
    └── test_helpers.dart          # Test utilities

```

### Running Tests

**Run all tests:**
```bash
flutter test
```

**Run specific test file:**
```bash
flutter test test/unit/core/client_test.dart
```

**Run tests with coverage:**
```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

**Run integration tests:**
```bash
flutter test integration_test/
```

### Test Status (Red Phase - TDD)

All tests are currently **commented out** and will **FAIL** when uncommented. This is expected as we're in the **RED** phase of TDD:

1. ✅ **RED**: Write failing tests (current phase)
2. ⏳ **GREEN**: Implement code to make tests pass
3. ⏳ **REFACTOR**: Clean up implementation

### Test Coverage Goals

- **Minimum**: 90% code coverage
- **Target**: 95%+ code coverage
- **Critical paths**: 100% coverage (auth, data operations)

### Writing Tests

**Unit Test Pattern:**
```dart
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

void main() {
  group('ComponentName', () {
    late ComponentUnderTest component;
    late MockDependency mockDep;

    setUp(() {
      mockDep = MockDependency();
      component = ComponentUnderTest(dep: mockDep);
    });

    test('should do something', () {
      // Arrange
      when(mockDep.method()).thenReturn(value);

      // Act
      final result = component.doSomething();

      // Assert
      expect(result, equals(expectedValue));
      verify(mockDep.method()).called(1);
    });
  });
}
```

**Integration Test Pattern:**
```dart
import 'package:test/test.dart';

void main() {
  group('Feature Flow', () {
    late AppFlowySDK sdk;

    setUpAll(() {
      sdk = AppFlowySDK(config: AppFlowyConfig.test());
    });

    test('complete user journey', () async {
      // Authenticate
      await sdk.auth.signInWithPassword(...);

      // Perform operations
      final workspaces = await sdk.getWorkspaces();
      final database = await workspaces.first.createDatabase(...);

      // Verify
      expect(database.name, equals('Test Database'));
    });
  });
}
```

### Mock Data

Use the `MockData` class from `mocks/mock_data.dart` for consistent test data:

```dart
import '../mocks/mock_data.dart';

test('should parse user profile', () {
  final user = UserProfile.fromJson(MockData.userProfileJson);
  expect(user.email, equals('test@example.com'));
});
```

### Integration Test Requirements

Integration tests require a running AppFlowy Cloud instance:

**Using Docker:**
```bash
docker-compose up -d
```

**Environment variables:**
```bash
export APPFLOWY_BASE_URL=http://localhost:8000
export TEST_USER_EMAIL=test@example.com
export TEST_USER_PASSWORD=testpassword123
```

### Continuous Integration

Tests run automatically on:
- Every push to `main` or `develop`
- Every pull request
- Coverage reports are uploaded to Codecov

See `.github/workflows/ci.yml` for CI configuration.

### Test Categories

**Unit Tests** - Fast, isolated, no external dependencies
- Run time: < 5 seconds for entire suite
- Mock all external dependencies
- Test individual components in isolation

**Integration Tests** - Full API interactions
- Run time: 30-60 seconds
- Require running AppFlowy Cloud instance
- Test complete user workflows

### Best Practices

1. **One test, one assertion**: Each test should verify one specific behavior
2. **Arrange-Act-Assert**: Structure tests clearly
3. **Descriptive names**: Test names should describe what they verify
4. **Independent tests**: Tests should not depend on each other
5. **Mock external dependencies**: Use mocks for HTTP, database, etc.
6. **Test edge cases**: Don't just test happy paths
7. **Use test fixtures**: Reuse common test data

### Troubleshooting

**Tests timing out:**
```dart
test('slow operation', () async {
  // ...
}, timeout: Timeout(Duration(seconds: 30)));
```

**Mock not working:**
```dart
// Make sure to use @GenerateMocks
@GenerateMocks([AppFlowyClient])
void main() {
  // ...
}
```

**Integration test failing:**
- Verify AppFlowy Cloud is running
- Check environment variables are set
- Ensure test user exists

### Next Steps

1. Uncomment tests one by one
2. Implement code to make each test pass (GREEN phase)
3. Refactor code while keeping tests green (REFACTOR phase)
4. Achieve 90%+ code coverage
5. Run integration tests against local AppFlowy Cloud

---

**Note**: This test suite follows TDD principles. Tests are written BEFORE implementation to define the expected behavior of the SDK.
