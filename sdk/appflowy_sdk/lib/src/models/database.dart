import 'package:freezed_annotation/freezed_annotation.dart';

part 'database.freezed.dart';
part 'database.g.dart';

/// Database model matching AppFlowy Cloud API
@freezed
class Database with _$Database {
  const factory Database({
    required String id,
    @Default([]) List<DatabaseView> views,
  }) = _Database;

  factory Database.fromJson(Map<String, dynamic> json) =>
      _$DatabaseFromJson(json);
}

/// Database view (simplified)
@freezed
class DatabaseView with _$DatabaseView {
  const factory DatabaseView({
    @JsonKey(name: 'view_id') required String id,
    required String name,
    @JsonKey(name: 'layout') int? layout,
    Map<String, dynamic>? icon,
  }) = _DatabaseView;

  factory DatabaseView.fromJson(Map<String, dynamic> json) =>
      _$DatabaseViewFromJson(json);
}

/// Field (column) model matching AFDatabaseField
@freezed
class Field with _$Field {
  const factory Field({
    required String id,
    required String name,
    @JsonKey(name: 'field_type') required String fieldType,
    @JsonKey(name: 'type_option') @Default({}) Map<String, dynamic> typeOption,
    @JsonKey(name: 'is_primary') @Default(false) bool isPrimary,
  }) = _Field;

  factory Field.fromJson(Map<String, dynamic> json) => _$FieldFromJson(json);
}

/// Row ID model (from list_database_row_ids)
@freezed
class RowId with _$RowId {
  const factory RowId({
    required String id,
  }) = _RowId;

  factory RowId.fromJson(Map<String, dynamic> json) => _$RowIdFromJson(json);
}

/// Row detail model with cell data (from list_database_row_details)
@freezed
class Row with _$Row {
  const factory Row({
    required String id,
    @Default({}) Map<String, dynamic> cells,
    @JsonKey(name: 'has_doc') @Default(false) bool hasDoc,
    String? doc,
  }) = _Row;

  factory Row.fromJson(Map<String, dynamic> json) => _$RowFromJson(json);
}

/// Row update item for incremental sync
@freezed
class RowUpdatedItem with _$RowUpdatedItem {
  const factory RowUpdatedItem({
    @JsonKey(name: 'row_id') required String rowId,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _RowUpdatedItem;

  factory RowUpdatedItem.fromJson(Map<String, dynamic> json) =>
      _$RowUpdatedItemFromJson(json);
}

/// Field type for inserting new fields
@freezed
class InsertDatabaseField with _$InsertDatabaseField {
  const factory InsertDatabaseField({
    required String name,
    @JsonKey(name: 'field_type') required int fieldType,
    @JsonKey(name: 'type_option_data') Map<String, dynamic>? typeOptionData,
  }) = _InsertDatabaseField;

  factory InsertDatabaseField.fromJson(Map<String, dynamic> json) =>
      _$InsertDatabaseFieldFromJson(json);

  Map<String, dynamic> toJson() => _$$InsertDatabaseFieldImplToJson(this as _$InsertDatabaseFieldImpl);
}

/// Common field types (matching AppFlowy's field type IDs)
class FieldTypes {
  static const int richText = 0;
  static const int number = 1;
  static const int date = 2;
  static const int singleSelect = 3;
  static const int multiSelect = 4;
  static const int checkbox = 5;
  static const int url = 6;
  static const int checklist = 7;
  static const int lastEditedTime = 8;
  static const int createdTime = 9;
  static const int lastEditedBy = 10;
  static const int createdBy = 11;
}
