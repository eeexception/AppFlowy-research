import 'package:test/test.dart';
import 'package:appflowy_sdk/appflowy_sdk.dart';

/// Integration tests for database operations against real AppFlowy Cloud
///
/// Prerequisites:
/// - AppFlowy Cloud running on localhost:80
/// - Test user: test@appflowy.io / testpassword123
/// - User has at least one workspace with a default database
void main() {
  late AppFlowySDK sdk;
  late String workspaceId;
  String? databaseId;

  setUpAll(() async {
    sdk = AppFlowySDK(
      config: AppFlowyConfig.local(port: 80),
    );

    // Sign in
    await sdk.auth.signInWithPassword(
      email: 'test@appflowy.io',
      password: 'testpassword123',
    );

    // Get workspace
    final workspaces = await sdk.getWorkspaces();
    expect(workspaces, isNotEmpty, reason: 'User should have at least one workspace');
    workspaceId = workspaces.first.id;
  });

  tearDownAll(() async {
    await sdk.auth.signOut();
  });

  group('Database Operations', () {
    test('should list databases in workspace', () async {
      final databases = await sdk.database.listDatabases(
        workspaceId: workspaceId,
      );

      print('Found ${databases.length} databases');
      for (final db in databases) {
        print('  - Database ID: ${db.id}');
        print('    Views: ${db.views.length}');
        for (final view in db.views) {
          print('      * ${view.name} (${view.id})');
        }
      }

      // AppFlowy Cloud creates a default workspace with databases
      expect(databases, isNotEmpty, reason: 'Workspace should have databases');

      // Save first database ID for other tests
      if (databases.isNotEmpty) {
        databaseId = databases.first.id;
      }
    });

    test('should get database fields', () async {
      if (databaseId == null) {
        // Get databases first
        final databases = await sdk.database.listDatabases(
          workspaceId: workspaceId,
        );
        if (databases.isEmpty) {
          print('⚠️  No databases found, skipping test');
          return;
        }
        databaseId = databases.first.id;
      }

      final fields = await sdk.database.getFields(
        workspaceId: workspaceId,
        databaseId: databaseId!,
      );

      print('Database fields:');
      for (final field in fields) {
        print('  - ${field.name} (${field.fieldType})${field.isPrimary ? ' [PRIMARY]' : ''}');
      }

      expect(fields, isNotEmpty, reason: 'Database should have at least one field');
    });

    test('should list row IDs', () async {
      if (databaseId == null) {
        final databases = await sdk.database.listDatabases(
          workspaceId: workspaceId,
        );
        if (databases.isEmpty) {
          print('⚠️  No databases found, skipping test');
          return;
        }
        databaseId = databases.first.id;
      }

      final rowIds = await sdk.database.listRowIds(
        workspaceId: workspaceId,
        databaseId: databaseId!,
      );

      print('Found ${rowIds.length} rows');
      for (final row in rowIds.take(5)) {
        print('  - Row ID: ${row.id}');
      }

      // Database might be empty
      expect(rowIds, isA<List<RowId>>());
    });

    test('should get row details', () async {
      if (databaseId == null) {
        final databases = await sdk.database.listDatabases(
          workspaceId: workspaceId,
        );
        if (databases.isEmpty) {
          print('⚠️  No databases found, skipping test');
          return;
        }
        databaseId = databases.first.id;
      }

      final rows = await sdk.database.getRows(
        workspaceId: workspaceId,
        databaseId: databaseId!,
      );

      print('Fetched ${rows.length} rows with details');
      for (final row in rows.take(3)) {
        print('  - Row ${row.id}:');
        print('    Cells: ${row.cells.keys.join(', ')}');
        if (row.hasDoc) {
          print('    Has document');
        }
      }

      expect(rows, isA<List<Row>>());
    });

    test('should create a new row', () async {
      if (databaseId == null) {
        final databases = await sdk.database.listDatabases(
          workspaceId: workspaceId,
        );
        if (databases.isEmpty) {
          print('⚠️  No databases found, skipping test');
          return;
        }
        databaseId = databases.first.id;
      }

      // Get fields to know what we can set
      final fields = await sdk.database.getFields(
        workspaceId: workspaceId,
        databaseId: databaseId!,
      );

      if (fields.isEmpty) {
        print('⚠️  No fields found, cannot create row');
        return;
      }

      // Create row data - use first field or "Name" if available
      final cellData = <String, dynamic>{};
      final nameField = fields.firstWhere(
        (f) => f.name.toLowerCase() == 'name' || f.name.toLowerCase() == 'title',
        orElse: () => fields.first,
      );

      cellData[nameField.name] = 'Test Row from SDK - ${DateTime.now()}';

      final rowId = await sdk.database.createRow(
        workspaceId: workspaceId,
        databaseId: databaseId!,
        cellData: cellData,
      );

      print('✅ Created row: $rowId');
      expect(rowId, isNotEmpty);

      // Verify the row exists
      final rows = await sdk.database.getRows(
        workspaceId: workspaceId,
        databaseId: databaseId!,
        rowIds: [rowId],
      );

      expect(rows, hasLength(1));
      print('✅ Verified row exists: ${rows.first.id}');
    });

    test('should get updated rows (incremental sync)', () async {
      if (databaseId == null) {
        final databases = await sdk.database.listDatabases(
          workspaceId: workspaceId,
        );
        if (databases.isEmpty) {
          print('⚠️  No databases found, skipping test');
          return;
        }
        databaseId = databases.first.id;
      }

      // Get rows updated in the last hour
      final oneHourAgo = DateTime.now().subtract(const Duration(hours: 1));
      final updatedRows = await sdk.database.getUpdatedRows(
        workspaceId: workspaceId,
        databaseId: databaseId!,
        after: oneHourAgo,
      );

      print('Rows updated in the last hour: ${updatedRows.length}');
      for (final item in updatedRows.take(5)) {
        print('  - ${item.rowId} updated at ${item.updatedAt}');
      }

      expect(updatedRows, isA<List<RowUpdatedItem>>());
    });

    test('should upsert row with idempotency', () async {
      if (databaseId == null) {
        final databases = await sdk.database.listDatabases(
          workspaceId: workspaceId,
        );
        if (databases.isEmpty) {
          print('⚠️  No databases found, skipping test');
          return;
        }
        databaseId = databases.first.id;
      }

      final fields = await sdk.database.getFields(
        workspaceId: workspaceId,
        databaseId: databaseId!,
      );

      if (fields.isEmpty) {
        print('⚠️  No fields found, cannot upsert row');
        return;
      }

      final cellData = <String, dynamic>{};
      final nameField = fields.firstWhere(
        (f) => f.name.toLowerCase() == 'name' || f.name.toLowerCase() == 'title',
        orElse: () => fields.first,
      );

      cellData[nameField.name] = 'Upserted Row from SDK';

      // Use same preHash to ensure idempotency
      const preHash = 'sdk-test-upsert-1';

      // First upsert
      final rowId1 = await sdk.database.upsertRow(
        workspaceId: workspaceId,
        databaseId: databaseId!,
        preHash: preHash,
        cellData: cellData,
      );

      print('✅ First upsert created/updated row: $rowId1');

      // Second upsert with same preHash should return same row ID
      final rowId2 = await sdk.database.upsertRow(
        workspaceId: workspaceId,
        databaseId: databaseId!,
        preHash: preHash,
        cellData: cellData,
      );

      print('✅ Second upsert returned row: $rowId2');
      expect(rowId1, equals(rowId2), reason: 'Upsert with same preHash should return same row');
    });

    test('should add a custom field', () async {
      if (databaseId == null) {
        final databases = await sdk.database.listDatabases(
          workspaceId: workspaceId,
        );
        if (databases.isEmpty) {
          print('⚠️  No databases found, skipping test');
          return;
        }
        databaseId = databases.first.id;
      }

      final fieldName = 'SDK Test Field ${DateTime.now().millisecondsSinceEpoch}';
      final fieldId = await sdk.database.addField(
        workspaceId: workspaceId,
        databaseId: databaseId!,
        field: InsertDatabaseField(
          name: fieldName,
          fieldType: FieldTypes.richText,
        ),
      );

      print('✅ Created field: $fieldId');
      expect(fieldId, isNotEmpty);

      // Verify field exists
      final fields = await sdk.database.getFields(
        workspaceId: workspaceId,
        databaseId: databaseId!,
      );

      final createdField = fields.firstWhere(
        (f) => f.name == fieldName,
        orElse: () => throw Exception('Field not found'),
      );

      expect(createdField.name, equals(fieldName));
      print('✅ Verified field exists: ${createdField.name}');
    });
  });
}
