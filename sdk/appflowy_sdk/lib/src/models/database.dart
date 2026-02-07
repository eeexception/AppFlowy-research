import 'package:freezed_annotation/freezed_annotation.dart';

part 'database.freezed.dart';
part 'database.g.dart';

/// Field type enumeration
enum FieldType {
  @JsonValue('richText')
  richText,
  @JsonValue('number')
  number,
  @JsonValue('date')
  date,
  @JsonValue('singleSelect')
  singleSelect,
  @JsonValue('multiSelect')
  multiSelect,
  @JsonValue('checkbox')
  checkbox,
  @JsonValue('url')
  url,
  @JsonValue('email')
  email,
  @JsonValue('phone')
  phone,
  @JsonValue('createdTime')
  createdTime,
  @JsonValue('updatedTime')
  updatedTime,
  @JsonValue('createdBy')
  createdBy,
  @JsonValue('lastEditedBy')
  lastEditedBy,
}

/// Database model
@freezed
class Database with _$Database {
  const factory Database({
    required String id,
    required String name,
    @JsonKey(name: 'workspace_id') required String workspaceId,
    @Default([]) List<Field> fields,
  }) = _Database;

  factory Database.fromJson(Map<String, dynamic> json) =>
      _$DatabaseFromJson(json);
}

/// Field (column) model
@freezed
class Field with _$Field {
  const factory Field({
    required String id,
    required String name,
    required FieldType type,
    @JsonKey(name: 'type_options') Map<String, dynamic>? typeOptions,
  }) = _Field;

  factory Field.fromJson(Map<String, dynamic> json) => _$FieldFromJson(json);
}

/// Row model
@freezed
class Row with _$Row {
  const factory Row({
    required String id,
    @JsonKey(name: 'database_id') required String databaseId,
    required Map<String, dynamic> cells,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Row;

  factory Row.fromJson(Map<String, dynamic> json) => _$RowFromJson(json);
}
