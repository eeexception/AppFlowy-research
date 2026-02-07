import '../core/client.dart';
import '../models/workspace.dart';
import '../models/view.dart';

/// Workspace service
class WorkspaceService {
  final AppFlowyClient _client;

  WorkspaceService({required AppFlowyClient client}) : _client = client;

  /// Get all workspaces
  Future<List<Workspace>> getWorkspaces() async {
    final response = await _client.get('/api/workspace');

    final workspaces = (response['workspaces'] as List)
        .map((json) => Workspace.fromJson(json as Map<String, dynamic>))
        .toList();

    return workspaces;
  }

  /// Get a specific workspace
  Future<Workspace> getWorkspace(String workspaceId) async {
    final response = await _client.get('/api/workspace/$workspaceId');
    return Workspace.fromJson(response);
  }

  /// Create a new workspace
  Future<Workspace> createWorkspace({required String name}) async {
    final response = await _client.post(
      '/api/workspace',
      data: {'name': name},
    );

    return Workspace.fromJson(response);
  }

  /// Update workspace
  Future<void> updateWorkspace({
    required String workspaceId,
    String? name,
  }) async {
    final data = <String, dynamic>{};
    if (name != null) data['name'] = name;

    await _client.patch('/api/workspace', data: {
      'workspace_id': workspaceId,
      ...data,
    });
  }

  /// Delete workspace
  Future<void> deleteWorkspace(String workspaceId) async {
    await _client.delete('/api/workspace/$workspaceId');
  }

  /// Get workspace members
  Future<List<WorkspaceMember>> getMembers(String workspaceId) async {
    final response = await _client.get('/api/workspace/$workspaceId/member');

    final members = (response['members'] as List)
        .map((json) => WorkspaceMember.fromJson(json as Map<String, dynamic>))
        .toList();

    return members;
  }

  /// Invite a member to workspace
  Future<void> inviteMember({
    required String workspaceId,
    required String email,
    required Role role,
  }) async {
    await _client.post(
      '/api/workspace/$workspaceId/invite',
      data: {
        'email': email,
        'role': role.name,
      },
    );
  }

  /// Remove a member from workspace
  Future<void> removeMember({
    required String workspaceId,
    required String email,
  }) async {
    await _client.delete(
      '/api/workspace/$workspaceId/member?email=$email',
    );
  }

  /// Get workspace usage statistics
  Future<WorkspaceUsage> getUsage(String workspaceId) async {
    final response = await _client.get('/api/workspace/$workspaceId/usage');
    return WorkspaceUsage.fromJson(response);
  }

  /// Get views in workspace
  Future<List<View>> getViews(String workspaceId) async {
    final response = await _client.get('/api/workspace/$workspaceId/folder');

    // Parse folder structure to extract views
    // This is simplified - actual API response structure may differ
    final views = <View>[];
    if (response is Map<String, dynamic> && response['views'] != null) {
      views.addAll(
        (response['views'] as List)
            .map((json) => View.fromJson(json as Map<String, dynamic>)),
      );
    }

    return views;
  }

  /// Create a view in workspace
  Future<View> createView({
    required String workspaceId,
    required String name,
    required ViewLayout layout,
    String? parentViewId,
  }) async {
    final response = await _client.post(
      '/api/workspace/$workspaceId/page-view',
      data: {
        'name': name,
        'layout': layout.name,
        if (parentViewId != null) 'parent_view_id': parentViewId,
      },
    );

    return View.fromJson(response);
  }

  /// Leave workspace
  Future<void> leaveWorkspace(String workspaceId) async {
    await _client.post('/api/workspace/$workspaceId/leave', data: {});
  }
}
