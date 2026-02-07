/// Mock data for testing
///
/// This file contains mock JSON responses that match the AppFlowy Cloud API format.
/// Use these for unit tests to ensure consistent test data.

class MockData {
  // User data
  static const userProfileJson = {
    'id': 'user-123',
    'email': 'test@example.com',
    'name': 'Test User',
    'avatar_url': 'https://example.com/avatar.jpg',
    'created_at': '2024-01-01T00:00:00Z',
  };

  static const authResponseJson = {
    'user': userProfileJson,
    'access_token': 'mock-access-token-abc123',
    'refresh_token': 'mock-refresh-token-xyz789',
    'expires_in': 3600,
  };

  // Workspace data
  static const workspaceJson = {
    'id': 'workspace-123',
    'name': 'Test Workspace',
    'created_at': '2024-01-01T00:00:00Z',
    'members': [
      {
        'email': 'owner@example.com',
        'name': 'Workspace Owner',
        'role': 'owner',
        'joined_at': 1704067200,
      },
      {
        'email': 'member@example.com',
        'name': 'Team Member',
        'role': 'member',
        'joined_at': 1704153600,
      },
    ],
  };

  static const workspaceListJson = {
    'workspaces': [
      {
        'id': 'workspace-123',
        'name': 'Personal Workspace',
        'created_at': '2024-01-01T00:00:00Z',
      },
      {
        'id': 'workspace-456',
        'name': 'Team Workspace',
        'created_at': '2024-01-02T00:00:00Z',
      },
    ],
  };

  // Database data
  static const databaseJson = {
    'id': 'database-123',
    'name': 'Customers',
    'workspace_id': 'workspace-123',
    'fields': [
      {
        'id': 'field-1',
        'name': 'Name',
        'type': 'richText',
      },
      {
        'id': 'field-2',
        'name': 'Email',
        'type': 'email',
      },
      {
        'id': 'field-3',
        'name': 'Status',
        'type': 'singleSelect',
        'type_options': {
          'options': [
            {'id': 'opt1', 'name': 'Active', 'color': 'green'},
            {'id': 'opt2', 'name': 'Inactive', 'color': 'red'},
          ],
        },
      },
    ],
  };

  // Field data
  static const richTextField = {
    'id': 'field-1',
    'name': 'Name',
    'type': 'richText',
  };

  static const emailField = {
    'id': 'field-2',
    'name': 'Email',
    'type': 'email',
  };

  static const selectField = {
    'id': 'field-3',
    'name': 'Status',
    'type': 'singleSelect',
    'type_options': {
      'options': [
        {'id': 'opt1', 'name': 'Active', 'color': 'green'},
        {'id': 'opt2', 'name': 'Inactive', 'color': 'red'},
      ],
    },
  };

  // Row data
  static const rowJson = {
    'id': 'row-123',
    'database_id': 'database-123',
    'cells': {
      'field-1': 'John Doe',
      'field-2': 'john@example.com',
      'field-3': 'Active',
    },
    'created_at': '2024-01-01T00:00:00Z',
    'updated_at': '2024-01-02T00:00:00Z',
  };

  static const rowListJson = {
    'rows': [
      {
        'id': 'row-1',
        'cells': {
          'field-1': 'Alice',
          'field-2': 'alice@example.com',
        },
      },
      {
        'id': 'row-2',
        'cells': {
          'field-1': 'Bob',
          'field-2': 'bob@example.com',
        },
      },
    ],
  };

  // Document data
  static const documentJson = {
    'id': 'doc-123',
    'name': 'Project Plan',
    'workspace_id': 'workspace-123',
    'content': '{"type":"page","children":[{"type":"heading","text":"Project Plan"}]}',
  };

  // View data
  static const viewJson = {
    'id': 'view-123',
    'name': 'My View',
    'layout': 'grid',
    'workspace_id': 'workspace-123',
    'parent_view_id': null,
  };

  // Error responses
  static const authErrorJson = {
    'code': 'AUTH_ERROR',
    'message': 'Invalid credentials',
  };

  static const validationErrorJson = {
    'code': 'VALIDATION_ERROR',
    'message': 'Validation failed',
    'errors': {
      'email': ['Invalid email format'],
      'password': ['Password must be at least 8 characters'],
    },
  };

  static const notFoundErrorJson = {
    'code': 'NOT_FOUND',
    'message': 'Resource not found',
  };

  static const serverErrorJson = {
    'code': 'INTERNAL_ERROR',
    'message': 'An internal server error occurred',
  };
}
