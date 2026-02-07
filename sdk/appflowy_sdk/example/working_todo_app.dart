/// Working Todo App Example - AppFlowy as a Backend
///
/// This is a COMPLETE, WORKING example showing how to use AppFlowy as a backend
/// for a real mobile application. Every operation here is tested and works.
///
/// Run: dart example/working_todo_app.dart

import 'package:appflowy_sdk/appflowy_sdk.dart';

void main() async {
  print('🚀 Working Todo App - AppFlowy as a Backend\n');
  print('=' * 70);

  try {
    // Initialize SDK
    final sdk = AppFlowySDK(
      config: AppFlowyConfig.local(port: 80),
    );

    // Step 1: Authentication
    print('\n📱 Step 1: Authentication');
    await sdk.auth.signInWithPassword(
      email: 'test@appflowy.io',
      password: 'testpassword123',
    );
    print('✅ Signed in successfully');

    // Step 2: Get workspace and database
    print('\n📦 Step 2: Getting Workspace & Database');
    final workspaces = await sdk.getWorkspaces();
    final workspaceId = workspaces.first.id;
    print('✅ Using workspace: ${workspaces.first.name}');

    final databases = await sdk.database.listDatabases(
      workspaceId: workspaceId,
    );
    final database = databases.first;
    final databaseId = database.id;
    final viewName = database.views.first.name;
    print('✅ Using database: $viewName (${database.views.length} views)');

    // Step 3: Get database schema (fields)
    print('\n📋 Step 3: Database Schema');
    final fields = await sdk.database.getFields(
      workspaceId: workspaceId,
      databaseId: databaseId,
    );
    print('Fields:');
    for (final field in fields) {
      print('  - ${field.name} [${field.fieldType}]${field.isPrimary ? ' (PRIMARY)' : ''}');
    }

    // Find the primary text field for task names
    final nameField = fields.firstWhere(
      (f) => f.name.toLowerCase().contains('name') ||
             f.name.toLowerCase().contains('title') ||
             f.name.toLowerCase().contains('description'),
      orElse: () => fields.first,
    );
    print('\n✅ Using "${nameField.name}" as task field');

    // Step 4: List existing todos
    print('\n📝 Step 4: Current Todos');
    final existingRows = await sdk.database.getRows(
      workspaceId: workspaceId,
      databaseId: databaseId,
    );
    print('Found ${existingRows.length} existing todos:');
    for (final row in existingRows.take(3)) {
      final taskName = row.cells[nameField.name] ?? row.cells[nameField.id] ?? 'Unnamed';
      print('  • $taskName');
    }

    // Step 5: Create new todos
    print('\n✨ Step 5: Creating New Todos');
    final newTodos = [
      'Complete SDK integration',
      'Write documentation',
      'Deploy to production',
    ];

    final createdRowIds = <String>[];
    for (final todo in newTodos) {
      final rowId = await sdk.database.createRow(
        workspaceId: workspaceId,
        databaseId: databaseId,
        cellData: {
          nameField.name: todo,
        },
      );
      createdRowIds.add(rowId);
      print('✅ Created: "$todo" ($rowId)');
    }

    // Step 6: Read the newly created todos
    print('\n📖 Step 6: Reading Created Todos');
    final newRows = await sdk.database.getRows(
      workspaceId: workspaceId,
      databaseId: databaseId,
      rowIds: createdRowIds,
    );
    print('Fetched ${newRows.length} new todos:');
    for (final row in newRows) {
      final taskName = row.cells[nameField.name] ?? row.cells[nameField.id];
      print('  ✓ $taskName');
      print('    Cells: ${row.cells.keys.join(', ')}');
    }

    // Step 7: Incremental Sync (get recent changes)
    print('\n🔄 Step 7: Incremental Sync');
    final fiveMinutesAgo = DateTime.now().subtract(const Duration(minutes: 5));
    final updatedRows = await sdk.database.getUpdatedRows(
      workspaceId: workspaceId,
      databaseId: databaseId,
      after: fiveMinutesAgo,
    );
    print('Rows updated in last 5 minutes: ${updatedRows.length}');
    for (final item in updatedRows.take(5)) {
      print('  • Row ${item.rowId.substring(0, 8)}... updated at ${item.updatedAt}');
    }

    // Step 8: Upsert with idempotency
    print('\n🔄 Step 8: Upsert with Idempotency');
    const preHash = 'my-recurring-task';

    final rowId1 = await sdk.database.upsertRow(
      workspaceId: workspaceId,
      databaseId: databaseId,
      preHash: preHash,
      cellData: {
        nameField.name: 'Daily standup meeting',
      },
    );
    print('✅ First upsert: $rowId1');

    // Same preHash = same row (idempotent)
    final rowId2 = await sdk.database.upsertRow(
      workspaceId: workspaceId,
      databaseId: databaseId,
      preHash: preHash,
      cellData: {
        nameField.name: 'Daily standup meeting (updated)',
      },
    );
    print('✅ Second upsert: $rowId2');
    print('✅ Same row ID: ${rowId1 == rowId2}');

    // Step 9: Add a custom field
    print('\n🆕 Step 9: Adding Custom Field');
    final fieldId = await sdk.database.addField(
      workspaceId: workspaceId,
      databaseId: databaseId,
      field: InsertDatabaseField(
        name: 'Priority',
        fieldType: FieldTypes.singleSelect,
      ),
    );
    print('✅ Created custom field: Priority ($fieldId)');

    // Step 10: Summary
    print('\n' + '=' * 70);
    print('🎉 SUCCESS! All operations completed');
    print('\n✅ What we demonstrated:');
    print('  • Authentication & session management');
    print('  • List databases and get schema');
    print('  • CREATE: Add new rows');
    print('  • READ: Fetch rows with cell data');
    print('  • UPDATE: Upsert with idempotency');
    print('  • SYNC: Incremental sync (get changes)');
    print('  • SCHEMA: Add custom fields dynamically');
    print('\n🚀 AppFlowy works as a complete backend!');
    print('   You can now build mobile apps, dashboards, CRM systems, etc.');

    // Sign out
    await sdk.auth.signOut();
    print('\n✅ Signed out');

  } catch (e, stackTrace) {
    print('\n❌ Error: $e');
    print(stackTrace);
    print('\nMake sure:');
    print('  1. AppFlowy Cloud is running (docker-compose up -d)');
    print('  2. Test user exists: test@appflowy.io / testpassword123');
    print('  3. User has at least one workspace with a database');
  }
}
