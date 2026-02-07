// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DatabaseImpl _$$DatabaseImplFromJson(Map<String, dynamic> json) =>
    _$DatabaseImpl(
      id: json['id'] as String,
      views: (json['views'] as List<dynamic>?)
              ?.map((e) => DatabaseView.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DatabaseImplToJson(_$DatabaseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'views': instance.views,
    };

_$DatabaseViewImpl _$$DatabaseViewImplFromJson(Map<String, dynamic> json) =>
    _$DatabaseViewImpl(
      id: json['view_id'] as String,
      name: json['name'] as String,
      layout: (json['layout'] as num?)?.toInt(),
      icon: json['icon'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$DatabaseViewImplToJson(_$DatabaseViewImpl instance) =>
    <String, dynamic>{
      'view_id': instance.id,
      'name': instance.name,
      'layout': instance.layout,
      'icon': instance.icon,
    };

_$FieldImpl _$$FieldImplFromJson(Map<String, dynamic> json) => _$FieldImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      fieldType: json['field_type'] as String,
      typeOption: json['type_option'] as Map<String, dynamic>? ?? const {},
      isPrimary: json['is_primary'] as bool? ?? false,
    );

Map<String, dynamic> _$$FieldImplToJson(_$FieldImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'field_type': instance.fieldType,
      'type_option': instance.typeOption,
      'is_primary': instance.isPrimary,
    };

_$RowIdImpl _$$RowIdImplFromJson(Map<String, dynamic> json) => _$RowIdImpl(
      id: json['id'] as String,
    );

Map<String, dynamic> _$$RowIdImplToJson(_$RowIdImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

_$RowImpl _$$RowImplFromJson(Map<String, dynamic> json) => _$RowImpl(
      id: json['id'] as String,
      cells: json['cells'] as Map<String, dynamic>? ?? const {},
      hasDoc: json['has_doc'] as bool? ?? false,
      doc: json['doc'] as String?,
    );

Map<String, dynamic> _$$RowImplToJson(_$RowImpl instance) => <String, dynamic>{
      'id': instance.id,
      'cells': instance.cells,
      'has_doc': instance.hasDoc,
      'doc': instance.doc,
    };

_$RowUpdatedItemImpl _$$RowUpdatedItemImplFromJson(Map<String, dynamic> json) =>
    _$RowUpdatedItemImpl(
      rowId: json['row_id'] as String,
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$RowUpdatedItemImplToJson(
        _$RowUpdatedItemImpl instance) =>
    <String, dynamic>{
      'row_id': instance.rowId,
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_$InsertDatabaseFieldImpl _$$InsertDatabaseFieldImplFromJson(
        Map<String, dynamic> json) =>
    _$InsertDatabaseFieldImpl(
      name: json['name'] as String,
      fieldType: (json['field_type'] as num).toInt(),
      typeOptionData: json['type_option_data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$InsertDatabaseFieldImplToJson(
        _$InsertDatabaseFieldImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'field_type': instance.fieldType,
      'type_option_data': instance.typeOptionData,
    };
