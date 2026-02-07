import '../core/client.dart';
import '../models/database.dart';

/// Database service
class DatabaseService {
  final AppFlowyClient _client;

  DatabaseService({required AppFlowyClient client}) : _client = client;

  /// Get database by ID
  Future<Database> getDatabase({
    required String workspaceId,
    required String databaseId,
  }) async {
    final response = await _client.get(
      '/api/workspace/$workspaceId/database/$databaseId',
    );

    return Database.fromJson(response);
  }

  /// Get all fields in a database
  Future<List<Field>> getFields({
    required String workspaceId,
    required String databaseId,
  }) async {
    final response = await _client.get(
      '/api/workspace/$workspaceId/database/$databaseId/fields',
    );

    final fields = (response['fields'] as List)
        .map((json) => Field.fromJson(json as Map<String, dynamic>))
        .toList();

    return fields;
  }

  /// Create a new field
  Future<Field> createField({
    required String workspaceId,
    required String databaseId,
    required String name,
    required FieldType type,
    Map<String, dynamic>? typeOptions,
  }) async {
    final data = <String, dynamic>{
      'name': name,
      'type': type.name,
    };

    if (typeOptions != null) {
      data['type_options'] = typeOptions;
    }

    final response = await _client.post(
      '/api/workspace/$workspaceId/database/$databaseId/fields',
      data: data,
    );

    return Field.fromJson(response);
  }

  /// Update a field
  Future<void> updateField({
    required String workspaceId,
    required String databaseId,
    required String fieldId,
    String? name,
    Map<String, dynamic>? typeOptions,
  }) async {
    final data = <String, dynamic>{};
    if (name != null) data['name'] = name;
    if (typeOptions != null) data['type_options'] = typeOptions;

    await _client.put(
      '/api/workspace/$workspaceId/database/$databaseId/fields/$fieldId',
      data: data,
    );
  }

  /// Delete a field
  Future<void> deleteField({
    required String workspaceId,
    required String databaseId,
    required String fieldId,
  }) async {
    await _client.delete(
      '/api/workspace/$workspaceId/database/$databaseId/fields/$fieldId',
    );
  }

  /// Get all rows in a database
  Future<List<Row>> getRows({
    required String workspaceId,
    required String databaseId,
    int? limit,
    int? offset,
  }) async {
    final params = <String, dynamic>{};
    if (limit != null) params['limit'] = limit;
    if (offset != null) params['offset'] = offset;

    final response = await _client.get(
      '/api/workspace/$workspaceId/database/$databaseId/row',
      params: params,
    );

    final rows = (response['rows'] as List)
        .map((json) => Row.fromJson(json as Map<String, dynamic>))
        .toList();

    return rows;
  }

  /// Get a specific row
  Future<Row> getRow({
    required String workspaceId,
    required String databaseId,
    required String rowId,
  }) async {
    final response = await _client.get(
      '/api/workspace/$workspaceId/database/$databaseId/row/detail',
      params: {'row_id': rowId},
    );

    return Row.fromJson(response);
  }

  /// Create a new row
  Future<Row> createRow({
    required String workspaceId,
    required String databaseId,
    required Map<String, dynamic> cellData,
  }) async {
    final response = await _client.post(
      '/api/workspace/$workspaceId/database/$databaseId/row',
      data: {
        'cells': cellData,
      },
    );

    return Row.fromJson(response);
  }

  /// Update a row
  Future<Row> updateRow({
    required String workspaceId,
    required String databaseId,
    required String rowId,
    required Map<String, dynamic> cellData,
  }) async {
    final response = await _client.put(
      '/api/workspace/$workspaceId/database/$databaseId/row',
      data: {
        'row_id': rowId,
        'cells': cellData,
      },
    );

    return Row.fromJson(response);
  }

  /// Delete a row
  Future<void> deleteRow({
    required String workspaceId,
    required String databaseId,
    required String rowId,
  }) async {
    await _client.delete(
      '/api/workspace/$workspaceId/database/$databaseId/row/$rowId',
    );
  }

  /// Batch create multiple rows
  Future<List<Row>> batchCreateRows({
    required String workspaceId,
    required String databaseId,
    required List<Map<String, dynamic>> rowsData,
  }) async {
    final response = await _client.post(
      '/api/workspace/$workspaceId/database/$databaseId/rows/batch',
      data: {
        'rows': rowsData,
      },
    );

    final rows = (response['rows'] as List)
        .map((json) => Row.fromJson(json as Map<String, dynamic>))
        .toList();

    return rows;
  }
}
