import 'package:freezed_annotation/freezed_annotation.dart';

part 'view.freezed.dart';
part 'view.g.dart';

/// View layout type
enum ViewLayout {
  @JsonValue('document')
  document,
  @JsonValue('grid')
  grid,
  @JsonValue('board')
  board,
  @JsonValue('calendar')
  calendar,
  @JsonValue('chat')
  chat,
}

/// View model
@freezed
class View with _$View {
  const factory View({
    required String id,
    required String name,
    required ViewLayout layout,
    @JsonKey(name: 'workspace_id') required String workspaceId,
    @JsonKey(name: 'parent_view_id') String? parentViewId,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _View;

  factory View.fromJson(Map<String, dynamic> json) => _$ViewFromJson(json);
}
