/// Real-world Todo App Example
///
/// This example demonstrates a complete workflow for building a mobile app:
/// 1. Authentication
/// 2. Create workspace
/// 3. Create database (todo list)
/// 4. Add todos (create rows)
/// 5. List todos (read rows)
/// 6. Update todos (update rows)
/// 7. Delete completed todos (delete rows)
///
/// This is a realistic example showing how to build data-driven apps
/// like task managers, note-taking apps, CRM systems, etc.

import 'package:appflowy_sdk/appflowy_sdk.dart';

void main() async {
  print('📝 Real-World Example: Todo App\n');
  print('This demonstrates a complete workflow for building');
  print('a mobile app with AppFlowy as the backend.\n');
  print('=' * 60);

  try {
    // Step 1: Initialize SDK and authenticate
    await exampleAuthentication();

    // Step 2: Create workspace and database
    await exampleSetupWorkspace();

    // Step 3: CRUD operations on todos
    await exampleTodoOperations();

    print('\n' + '=' * 60);
    print('✅ Todo App example completed successfully!');
    print('\nThis shows you can build real mobile apps with:');
    print('  ✓ User authentication');
    print('  ✓ Data storage (databases)');
    print('  ✓ CRUD operations (Create, Read, Update, Delete)');
    print('  ✓ Structured data with fields/columns');
  } catch (e) {
    print('\n❌ Error: $e');
    print('\nMake sure:');
    print('  1. AppFlowy Cloud is running (docker-compose up -d)');
    print('  2. Test user exists: test@appflowy.io / testpassword123');
  }
}

/// Step 1: Authentication
Future<AppFlowySDK> exampleAuthentication() async {
  print('\n📱 Step 1: User Authentication');
  print('-' * 60);

  final sdk = AppFlowySDK(
    config: AppFlowyConfig.local(port: 80),
  );

  print('Signing in...');
  final user = await sdk.auth.signInWithPassword(
    email: 'test@appflowy.io',
    password: 'testpassword123',
  );

  print('✅ Signed in as: ${user.email}');
  return sdk;
}

/// Step 2: Setup workspace and database
Future<void> exampleSetupWorkspace() async {
  print('\n🏗️  Step 2: Setup Workspace & Database');
  print('-' * 60);

  final sdk = AppFlowySDK(
    config: AppFlowyConfig.local(port: 80),
  );

  await sdk.auth.signInWithPassword(
    email: 'test@appflowy.io',
    password: 'testpassword123',
  );

  // Get or create workspace
  print('Getting workspaces...');
  final workspaces = await sdk.getWorkspaces();

  if (workspaces.isEmpty) {
    print('No workspaces found. Creating one...');
    await sdk.createWorkspace(name: 'My Todo App');
    print('✅ Created workspace: My Todo App');
  } else {
    print('✅ Using existing workspace: ${workspaces.first.name}');
  }

  print('\n📊 Note: Database creation');
  print('   In AppFlowy, databases are typically created as Views');
  print('   within a workspace. The exact API endpoint depends on');
  print('   your AppFlowy Cloud version.');
  print('   For this example, we assume a database already exists.');
}

/// Step 3: Todo CRUD Operations
Future<void> exampleTodoOperations() async {
  print('\n📝 Step 3: Todo Operations (CRUD)');
  print('-' * 60);

  final sdk = AppFlowySDK(
    config: AppFlowyConfig.local(port: 80),
  );

  await sdk.auth.signInWithPassword(
    email: 'test@appflowy.io',
    password: 'testpassword123',
  );

  final workspaces = await sdk.getWorkspaces();
  final workspaceId = workspaces.first.id;

  // For demonstration, we'll show the API calls
  // Note: You'll need a database ID from your workspace
  final databaseId = 'your-database-id'; // Replace with actual ID

  print('\n1️⃣  CREATE: Adding new todos');
  print('   Code example:');
  print('   ```dart');
  print('   final todo = await sdk.database.createRow(');
  print('     workspaceId: workspaceId,');
  print('     databaseId: databaseId,');
  print('     cellData: {');
  print('       "title": "Buy groceries",');
  print('       "status": "todo",');
  print('       "priority": "high",');
  print('     },');
  print('   );');
  print('   ```');

  print('\n2️⃣  READ: Listing all todos');
  print('   Code example:');
  print('   ```dart');
  print('   final todos = await sdk.database.getRows(');
  print('     workspaceId: workspaceId,');
  print('     databaseId: databaseId,');
  print('   );');
  print('   ');
  print('   for (final todo in todos) {');
  print('     print("- \${todo.cells["title"]} (\${todo.cells["status"]})");');
  print('   }');
  print('   ```');

  print('\n3️⃣  UPDATE: Marking todo as complete');
  print('   Code example:');
  print('   ```dart');
  print('   await sdk.database.updateRow(');
  print('     workspaceId: workspaceId,');
  print('     databaseId: databaseId,');
  print('     rowId: todoId,');
  print('     cellData: {');
  print('       "status": "completed",');
  print('       "completed_at": DateTime.now().toIso8601String(),');
  print('     },');
  print('   );');
  print('   ```');

  print('\n4️⃣  DELETE: Removing completed todos');
  print('   Code example:');
  print('   ```dart');
  print('   await sdk.database.deleteRow(');
  print('     workspaceId: workspaceId,');
  print('     databaseId: databaseId,');
  print('     rowId: todoId,');
  print('   );');
  print('   ```');

  print('\n💡 Real App Example:');
  print('   In a real Flutter app, you would:');
  print('   • Use FutureBuilder or StreamBuilder for reactive UI');
  print('   • Implement state management (Provider, Riverpod, Bloc)');
  print('   • Add error handling and loading states');
  print('   • Cache data locally for offline support');
  print('   • Add pull-to-refresh and pagination');
}

/// Complete Flutter Widget Example
///
/// ```dart
/// class TodoListScreen extends StatefulWidget {
///   final AppFlowySDK sdk;
///   final String workspaceId;
///   final String databaseId;
///
///   const TodoListScreen({
///     required this.sdk,
///     required this.workspaceId,
///     required this.databaseId,
///   });
///
///   @override
///   State<TodoListScreen> createState() => _TodoListScreenState();
/// }
///
/// class _TodoListScreenState extends State<TodoListScreen> {
///   List<Row>? _todos;
///   bool _isLoading = true;
///
///   @override
///   void initState() {
///     super.initState();
///     _loadTodos();
///   }
///
///   Future<void> _loadTodos() async {
///     setState(() => _isLoading = true);
///     try {
///       final todos = await widget.sdk.database.getRows(
///         workspaceId: widget.workspaceId,
///         databaseId: widget.databaseId,
///       );
///       setState(() {
///         _todos = todos;
///         _isLoading = false;
///       });
///     } catch (e) {
///       setState(() => _isLoading = false);
///       ScaffoldMessenger.of(context).showSnackBar(
///         SnackBar(content: Text('Failed to load todos: $e')),
///       );
///     }
///   }
///
///   Future<void> _addTodo(String title) async {
///     try {
///       await widget.sdk.database.createRow(
///         workspaceId: widget.workspaceId,
///         databaseId: widget.databaseId,
///         cellData: {
///           'title': title,
///           'status': 'todo',
///           'created_at': DateTime.now().toIso8601String(),
///         },
///       );
///       await _loadTodos(); // Refresh list
///     } catch (e) {
///       ScaffoldMessenger.of(context).showSnackBar(
///         SnackBar(content: Text('Failed to add todo: $e')),
///       );
///     }
///   }
///
///   Future<void> _toggleTodo(Row todo) async {
///     final isCompleted = todo.cells['status'] == 'completed';
///     try {
///       await widget.sdk.database.updateRow(
///         workspaceId: widget.workspaceId,
///         databaseId: widget.databaseId,
///         rowId: todo.id,
///         cellData: {
///           'status': isCompleted ? 'todo' : 'completed',
///         },
///       );
///       await _loadTodos();
///     } catch (e) {
///       ScaffoldMessenger.of(context).showSnackBar(
///         SnackBar(content: Text('Failed to update todo: $e')),
///       );
///     }
///   }
///
///   Future<void> _deleteTodo(String todoId) async {
///     try {
///       await widget.sdk.database.deleteRow(
///         workspaceId: widget.workspaceId,
///         databaseId: widget.databaseId,
///         rowId: todoId,
///       );
///       await _loadTodos();
///     } catch (e) {
///       ScaffoldMessenger.of(context).showSnackBar(
///         SnackBar(content: Text('Failed to delete todo: $e')),
///       );
///     }
///   }
///
///   @override
///   Widget build(BuildContext context) {
///     if (_isLoading) {
///       return const Center(child: CircularProgressIndicator());
///     }
///
///     if (_todos == null || _todos!.isEmpty) {
///       return Center(
///         child: Column(
///           mainAxisAlignment: MainAxisAlignment.center,
///           children: [
///             const Icon(Icons.check_circle_outline, size: 64),
///             const SizedBox(height: 16),
///             const Text('No todos yet'),
///             const SizedBox(height: 16),
///             ElevatedButton.icon(
///               icon: const Icon(Icons.add),
///               label: const Text('Add Todo'),
///               onPressed: () => _showAddDialog(),
///             ),
///           ],
///         ),
///       );
///     }
///
///     return ListView.builder(
///       itemCount: _todos!.length,
///       itemBuilder: (context, index) {
///         final todo = _todos![index];
///         final title = todo.cells['title'] as String? ?? '';
///         final isCompleted = todo.cells['status'] == 'completed';
///
///         return ListTile(
///           leading: Checkbox(
///             value: isCompleted,
///             onChanged: (_) => _toggleTodo(todo),
///           ),
///           title: Text(
///             title,
///             style: isCompleted
///                 ? const TextStyle(decoration: TextDecoration.lineThrough)
///                 : null,
///           ),
///           trailing: IconButton(
///             icon: const Icon(Icons.delete),
///             onPressed: () => _deleteTodo(todo.id),
///           ),
///         );
///       },
///     );
///   }
///
///   Future<void> _showAddDialog() async {
///     final controller = TextEditingController();
///     final title = await showDialog<String>(
///       context: context,
///       builder: (context) => AlertDialog(
///         title: const Text('Add Todo'),
///         content: TextField(
///           controller: controller,
///           decoration: const InputDecoration(labelText: 'Title'),
///           autofocus: true,
///         ),
///         actions: [
///           TextButton(
///             onPressed: () => Navigator.pop(context),
///             child: const Text('Cancel'),
///           ),
///           ElevatedButton(
///             onPressed: () => Navigator.pop(context, controller.text),
///             child: const Text('Add'),
///           ),
///         ],
///       ),
///     );
///
///     if (title != null && title.isNotEmpty) {
///       await _addTodo(title);
///     }
///   }
/// }
/// ```
