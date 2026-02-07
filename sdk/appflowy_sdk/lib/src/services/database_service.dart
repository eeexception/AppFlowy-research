import '../core/client.dart';
import '../models/database.dart';

/// Database service for AppFlowy Cloud
///
/// Provides CRUD operations on databases, fields, and rows
class DatabaseService {
  final AppFlowyClient _client;

  DatabaseService({required AppFlowyClient client}) : _client = client;

  /// List all databases in a workspace
  ///
  /// GET /api/workspace/{workspace_id}/database
  Future<List<Database>> listDatabases({
    required String workspaceId,
  }) async {
    final response = await _client.get('/api/workspace/$workspaceId/database');

    // Response is either array or wrapped in data
    final data = response is List ? response : (response['data'] ?? response);
    final list = data is List ? data : [];

    return list
        .map((json) => Database.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  /// Get database fields (columns)
  ///
  /// GET /api/workspace/{workspace_id}/database/{database_id}/fields
  Future<List<Field>> getFields({
    required String workspaceId,
    required String databaseId,
  }) async {
    final response = await _client.get(
      '/api/workspace/$workspaceId/database/$databaseId/fields',
    );

    final data = response is List ? response : (response['data'] ?? response);
    final list = data is List ? data : [];

    return list
        .map((json) => Field.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  /// Add a new field to database
  ///
  /// POST /api/workspace/{workspace_id}/database/{database_id}/fields
  /// Returns the field ID of the newly created field
  Future<String> addField({
    required String workspaceId,
    required String databaseId,
    required InsertDatabaseField field,
  }) async {
    final response = await _client.post(
      '/api/workspace/$workspaceId/database/$databaseId/fields',
      data: field.toJson(),
    );

    // Response is either the field_id string or wrapped
    if (response is String) {
      return response;
    }
    return (response['data'] ?? response) as String;
  }

  /// List all row IDs in a database
  ///
  /// GET /api/workspace/{workspace_id}/database/{database_id}/row
  /// Returns only the row IDs, use getRows() for full row data
  Future<List<RowId>> listRowIds({
    required String workspaceId,
    required String databaseId,
  }) async {
    final response = await _client.get(
      '/api/workspace/$workspaceId/database/$databaseId/row',
    );

    final data = response is List ? response : (response['data'] ?? response);
    final list = data is List ? data : [];

    return list
        .map((json) => RowId.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  /// Get full row details with cell data
  ///
  /// GET /api/workspace/{workspace_id}/database/{database_id}/row/detail?ids=...&with_doc=true
  Future<List<Row>> getRows({
    required String workspaceId,
    required String databaseId,
    List<String>? rowIds,
    bool withDoc = false,
  }) async {
    // If no row IDs provided, get all row IDs first
    final ids = rowIds ?? (await listRowIds(
      workspaceId: workspaceId,
      databaseId: databaseId,
    )).map((r) => r.id).toList();

    if (ids.isEmpty) {
      return [];
    }

    final response = await _client.get(
      '/api/workspace/$workspaceId/database/$databaseId/row/detail',
      params: {
        'ids': ids.join(','),
        'with_doc': withDoc.toString(),
      },
    );

    final data = response is List ? response : (response['data'] ?? response);
    final list = data is List ? data : [];

    return list
        .map((json) => Row.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  /// Create a new row in the database
  ///
  /// POST /api/workspace/{workspace_id}/database/{database_id}/row
  ///
  /// Example cellData:
  /// ```dart
  /// {
  ///   "Name": "John Doe",        // using field name
  ///   "_field_123": "some value"  // using field ID
  /// }
  /// ```
  ///
  /// Returns the row ID of the newly created row
  Future<String> createRow({
    required String workspaceId,
    required String databaseId,
    required Map<String, dynamic> cellData,
    String? documentContent,
  }) async {
    final response = await _client.post(
      '/api/workspace/$workspaceId/database/$databaseId/row',
      data: {
        'cells': cellData,
        if (documentContent != null) 'document': documentContent,
      },
    );

    // Response is the row_id
    if (response is String) {
      return response;
    }
    return (response['data'] ?? response) as String;
  }

  /// Update or create a row with idempotency
  ///
  /// PUT /api/workspace/{workspace_id}/database/{database_id}/row
  ///
  /// Uses pre_hash for idempotency - same pre_hash will update the same row
  /// Returns the row ID
  Future<String> upsertRow({
    required String workspaceId,
    required String databaseId,
    required String preHash,
    required Map<String, dynamic> cellData,
    String? documentContent,
  }) async {
    final response = await _client.put(
      '/api/workspace/$workspaceId/database/$databaseId/row',
      data: {
        'pre_hash': preHash,
        'cells': cellData,
        if (documentContent != null) 'document': documentContent,
      },
    );

    if (response is String) {
      return response;
    }
    return (response['data'] ?? response) as String;
  }

  /// Get rows updated after a specific timestamp (incremental sync)
  ///
  /// GET /api/workspace/{workspace_id}/database/{database_id}/row/updated?after={timestamp}
  ///
  /// This is useful for syncing changes incrementally without fetching all rows
  Future<List<RowUpdatedItem>> getUpdatedRows({
    required String workspaceId,
    required String databaseId,
    DateTime? after,
  }) async {
    final params = <String, String>{};
    if (after != null) {
      params['after'] = after.toUtc().toIso8601String();
    }

    final response = await _client.get(
      '/api/workspace/$workspaceId/database/$databaseId/row/updated',
      params: params,
    );

    final data = response is List ? response : (response['data'] ?? response);
    final list = data is List ? data : [];

    return list
        .map((json) => RowUpdatedItem.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  // Note: Delete operations are not exposed in the current AppFlowy Cloud API
  // Rows are typically archived or moved to trash rather than deleted
}
