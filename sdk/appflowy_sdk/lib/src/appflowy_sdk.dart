import 'core/client.dart';
import 'core/config.dart';
import 'services/auth_service.dart';
import 'services/workspace_service.dart';
import 'services/database_service.dart';
import 'models/workspace.dart';

/// Main AppFlowy SDK class
class AppFlowySDK {
  final AppFlowyConfig config;
  final AppFlowyClient _client;

  late final AuthService auth;
  late final WorkspaceService _workspaceService;
  late final DatabaseService database;

  AppFlowySDK({
    required this.config,
    TokenStorage? tokenStorage,
  }) : _client = AppFlowyClient(
          baseUrl: config.baseUrl,
          timeout: config.timeout,
        ) {
    // Initialize services
    auth = AuthService(
      client: _client,
      tokenStorage: tokenStorage ?? config.tokenStorage,
    );

    _workspaceService = WorkspaceService(client: _client);
    database = DatabaseService(client: _client);

    // Restore session if token storage is available
    if (tokenStorage != null || config.tokenStorage != null) {
      auth.restoreSession().catchError((e) {
        // Ignore restore errors
        if (config.enableLogging) {
          print('Failed to restore session: $e');
        }
      });
    }
  }

  /// Check if user is authenticated
  bool get isAuthenticated => auth.isAuthenticated;

  /// Get all workspaces
  Future<List<Workspace>> getWorkspaces() async {
    return _workspaceService.getWorkspaces();
  }

  /// Get a specific workspace
  Future<Workspace> getWorkspace(String workspaceId) async {
    return _workspaceService.getWorkspace(workspaceId);
  }

  /// Create a new workspace
  Future<Workspace> createWorkspace({required String name}) async {
    return _workspaceService.createWorkspace(name: name);
  }
}
