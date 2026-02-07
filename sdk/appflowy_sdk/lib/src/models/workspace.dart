import 'package:freezed_annotation/freezed_annotation.dart';

part 'workspace.freezed.dart';
part 'workspace.g.dart';

/// Workspace member role
enum Role {
  @JsonValue('owner')
  owner,
  @JsonValue('member')
  member,
  @JsonValue('guest')
  guest,
}

/// Workspace model
@freezed
class Workspace with _$Workspace {
  const factory Workspace({
    @JsonKey(name: 'workspace_id') required String id,
    @JsonKey(name: 'workspace_name') required String name,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @Default([]) List<WorkspaceMember> members,
  }) = _Workspace;

  factory Workspace.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceFromJson(json);
}

/// Workspace member model
@freezed
class WorkspaceMember with _$WorkspaceMember {
  const factory WorkspaceMember({
    required String email,
    required String name,
    required Role role,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'joined_at') int? joinedAt,
  }) = _WorkspaceMember;

  factory WorkspaceMember.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceMemberFromJson(json);
}

/// Workspace usage statistics
@freezed
class WorkspaceUsage with _$WorkspaceUsage {
  const factory WorkspaceUsage({
    @JsonKey(name: 'total_blob_bytes') required int totalBlobBytes,
    @JsonKey(name: 'total_blob_bytes_limit') required int totalBlobBytesLimit,
    @JsonKey(name: 'member_count') required int memberCount,
    @JsonKey(name: 'member_count_limit') required int memberCountLimit,
  }) = _WorkspaceUsage;

  factory WorkspaceUsage.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceUsageFromJson(json);
}
