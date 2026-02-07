# Integration Tests

Integration tests verify the SDK works against a real AppFlowy Cloud instance.

## Prerequisites

### 1. Run AppFlowy Cloud Locally

You need a local AppFlowy Cloud instance running. The easiest way is using Docker.

**Option A: Using Docker Compose (from AppFlowy-Cloud repo)**

```bash
# Clone AppFlowy-Cloud repository
git clone https://github.com/AppFlowy-IO/AppFlowy-Cloud.git
cd AppFlowy-Cloud

# Start services
docker-compose up -d

# Check if it's running
curl http://localhost:8000/api/health
```

**Option B: Using Docker Image**

```bash
# Pull and run AppFlowy Cloud
docker run -d -p 8000:8000 appflowyio/appflowy_cloud:latest

# Check if it's running
curl http://localhost:8000/api/health
```

### 2. Create Test User

Create a test user in your local AppFlowy Cloud:

**Email:** test@appflowy.io
**Password:** testpassword123

You can create this user by:
1. Using the AppFlowy app to register
2. Using the API directly
3. Using the admin panel (if available)

### 3. Run Integration Tests

```bash
# Run all integration tests (unskip them first)
flutter test test/integration/

# Run specific test file
flutter test test/integration/auth_integration_test.dart

# Run with verbose output
flutter test test/integration/ -r expanded
```

## Test Structure

```
test/integration/
├── auth_integration_test.dart       # Authentication flows
├── workspace_integration_test.dart  # Workspace operations
├── database_integration_test.dart   # Database CRUD
└── README.md                        # This file
```

## Unskipping Tests

All integration tests are skipped by default because they require a running AppFlowy Cloud instance.

To run them:

1. Make sure AppFlowy Cloud is running locally
2. Create the test user
3. Remove the `skip` parameter from the tests:

```dart
// Before:
test('should authenticate', () async {
  // ...
}, skip: 'Requires local AppFlowy Cloud instance');

// After:
test('should authenticate', () async {
  // ...
});
```

## Troubleshooting

### "Cannot connect to AppFlowy Cloud"

- Verify AppFlowy Cloud is running: `curl http://localhost:8000/api/health`
- Check Docker containers: `docker ps`
- Check logs: `docker logs <container-id>`

### "Authentication failed"

- Make sure test user exists
- Verify credentials are correct
- Check AppFlowy Cloud logs for errors

### "Tests timeout"

- Increase test timeout: `test('...', () async { ... }, timeout: Timeout(Duration(seconds: 30)))`
- Check network connectivity
- Verify AppFlowy Cloud is responding

## Environment Variables

You can configure the tests using environment variables:

```bash
export APPFLOWY_BASE_URL=http://localhost:8000
export TEST_USER_EMAIL=test@appflowy.io
export TEST_USER_PASSWORD=testpassword123

flutter test test/integration/
```

## CI/CD Integration

For CI/CD pipelines, use Docker Compose to spin up AppFlowy Cloud:

```yaml
# .github/workflows/integration-tests.yml
services:
  appflowy-cloud:
    image: appflowyio/appflowy_cloud:latest
    ports:
      - 8000:8000
    env:
      DATABASE_URL: postgres://...
```

See `docs/sdk/SDK_IMPLEMENTATION_PLAN.md` section 15.3 for complete CI/CD configuration.
