// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'database.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Database _$DatabaseFromJson(Map<String, dynamic> json) {
  return _Database.fromJson(json);
}

/// @nodoc
mixin _$Database {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'workspace_id')
  String get workspaceId => throw _privateConstructorUsedError;
  List<Field> get fields => throw _privateConstructorUsedError;

  /// Serializes this Database to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Database
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DatabaseCopyWith<Database> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatabaseCopyWith<$Res> {
  factory $DatabaseCopyWith(Database value, $Res Function(Database) then) =
      _$DatabaseCopyWithImpl<$Res, Database>;
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(name: 'workspace_id') String workspaceId,
      List<Field> fields});
}

/// @nodoc
class _$DatabaseCopyWithImpl<$Res, $Val extends Database>
    implements $DatabaseCopyWith<$Res> {
  _$DatabaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Database
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? workspaceId = null,
    Object? fields = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      workspaceId: null == workspaceId
          ? _value.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as String,
      fields: null == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<Field>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DatabaseImplCopyWith<$Res>
    implements $DatabaseCopyWith<$Res> {
  factory _$$DatabaseImplCopyWith(
          _$DatabaseImpl value, $Res Function(_$DatabaseImpl) then) =
      __$$DatabaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(name: 'workspace_id') String workspaceId,
      List<Field> fields});
}

/// @nodoc
class __$$DatabaseImplCopyWithImpl<$Res>
    extends _$DatabaseCopyWithImpl<$Res, _$DatabaseImpl>
    implements _$$DatabaseImplCopyWith<$Res> {
  __$$DatabaseImplCopyWithImpl(
      _$DatabaseImpl _value, $Res Function(_$DatabaseImpl) _then)
      : super(_value, _then);

  /// Create a copy of Database
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? workspaceId = null,
    Object? fields = null,
  }) {
    return _then(_$DatabaseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      workspaceId: null == workspaceId
          ? _value.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as String,
      fields: null == fields
          ? _value._fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<Field>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DatabaseImpl implements _Database {
  const _$DatabaseImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'workspace_id') required this.workspaceId,
      final List<Field> fields = const []})
      : _fields = fields;

  factory _$DatabaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DatabaseImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey(name: 'workspace_id')
  final String workspaceId;
  final List<Field> _fields;
  @override
  @JsonKey()
  List<Field> get fields {
    if (_fields is EqualUnmodifiableListView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fields);
  }

  @override
  String toString() {
    return 'Database(id: $id, name: $name, workspaceId: $workspaceId, fields: $fields)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatabaseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.workspaceId, workspaceId) ||
                other.workspaceId == workspaceId) &&
            const DeepCollectionEquality().equals(other._fields, _fields));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, workspaceId,
      const DeepCollectionEquality().hash(_fields));

  /// Create a copy of Database
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DatabaseImplCopyWith<_$DatabaseImpl> get copyWith =>
      __$$DatabaseImplCopyWithImpl<_$DatabaseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DatabaseImplToJson(
      this,
    );
  }
}

abstract class _Database implements Database {
  const factory _Database(
      {required final String id,
      required final String name,
      @JsonKey(name: 'workspace_id') required final String workspaceId,
      final List<Field> fields}) = _$DatabaseImpl;

  factory _Database.fromJson(Map<String, dynamic> json) =
      _$DatabaseImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'workspace_id')
  String get workspaceId;
  @override
  List<Field> get fields;

  /// Create a copy of Database
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DatabaseImplCopyWith<_$DatabaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Field _$FieldFromJson(Map<String, dynamic> json) {
  return _Field.fromJson(json);
}

/// @nodoc
mixin _$Field {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  FieldType get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_options')
  Map<String, dynamic>? get typeOptions => throw _privateConstructorUsedError;

  /// Serializes this Field to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Field
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FieldCopyWith<Field> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldCopyWith<$Res> {
  factory $FieldCopyWith(Field value, $Res Function(Field) then) =
      _$FieldCopyWithImpl<$Res, Field>;
  @useResult
  $Res call(
      {String id,
      String name,
      FieldType type,
      @JsonKey(name: 'type_options') Map<String, dynamic>? typeOptions});
}

/// @nodoc
class _$FieldCopyWithImpl<$Res, $Val extends Field>
    implements $FieldCopyWith<$Res> {
  _$FieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Field
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? typeOptions = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FieldType,
      typeOptions: freezed == typeOptions
          ? _value.typeOptions
          : typeOptions // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FieldImplCopyWith<$Res> implements $FieldCopyWith<$Res> {
  factory _$$FieldImplCopyWith(
          _$FieldImpl value, $Res Function(_$FieldImpl) then) =
      __$$FieldImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      FieldType type,
      @JsonKey(name: 'type_options') Map<String, dynamic>? typeOptions});
}

/// @nodoc
class __$$FieldImplCopyWithImpl<$Res>
    extends _$FieldCopyWithImpl<$Res, _$FieldImpl>
    implements _$$FieldImplCopyWith<$Res> {
  __$$FieldImplCopyWithImpl(
      _$FieldImpl _value, $Res Function(_$FieldImpl) _then)
      : super(_value, _then);

  /// Create a copy of Field
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? typeOptions = freezed,
  }) {
    return _then(_$FieldImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FieldType,
      typeOptions: freezed == typeOptions
          ? _value._typeOptions
          : typeOptions // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FieldImpl implements _Field {
  const _$FieldImpl(
      {required this.id,
      required this.name,
      required this.type,
      @JsonKey(name: 'type_options') final Map<String, dynamic>? typeOptions})
      : _typeOptions = typeOptions;

  factory _$FieldImpl.fromJson(Map<String, dynamic> json) =>
      _$$FieldImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final FieldType type;
  final Map<String, dynamic>? _typeOptions;
  @override
  @JsonKey(name: 'type_options')
  Map<String, dynamic>? get typeOptions {
    final value = _typeOptions;
    if (value == null) return null;
    if (_typeOptions is EqualUnmodifiableMapView) return _typeOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Field(id: $id, name: $name, type: $type, typeOptions: $typeOptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FieldImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._typeOptions, _typeOptions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, type,
      const DeepCollectionEquality().hash(_typeOptions));

  /// Create a copy of Field
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FieldImplCopyWith<_$FieldImpl> get copyWith =>
      __$$FieldImplCopyWithImpl<_$FieldImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FieldImplToJson(
      this,
    );
  }
}

abstract class _Field implements Field {
  const factory _Field(
      {required final String id,
      required final String name,
      required final FieldType type,
      @JsonKey(name: 'type_options')
      final Map<String, dynamic>? typeOptions}) = _$FieldImpl;

  factory _Field.fromJson(Map<String, dynamic> json) = _$FieldImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  FieldType get type;
  @override
  @JsonKey(name: 'type_options')
  Map<String, dynamic>? get typeOptions;

  /// Create a copy of Field
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FieldImplCopyWith<_$FieldImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Row _$RowFromJson(Map<String, dynamic> json) {
  return _Row.fromJson(json);
}

/// @nodoc
mixin _$Row {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'database_id')
  String get databaseId => throw _privateConstructorUsedError;
  Map<String, dynamic> get cells => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Row to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Row
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RowCopyWith<Row> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RowCopyWith<$Res> {
  factory $RowCopyWith(Row value, $Res Function(Row) then) =
      _$RowCopyWithImpl<$Res, Row>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'database_id') String databaseId,
      Map<String, dynamic> cells,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$RowCopyWithImpl<$Res, $Val extends Row> implements $RowCopyWith<$Res> {
  _$RowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Row
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? databaseId = null,
    Object? cells = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      databaseId: null == databaseId
          ? _value.databaseId
          : databaseId // ignore: cast_nullable_to_non_nullable
              as String,
      cells: null == cells
          ? _value.cells
          : cells // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RowImplCopyWith<$Res> implements $RowCopyWith<$Res> {
  factory _$$RowImplCopyWith(_$RowImpl value, $Res Function(_$RowImpl) then) =
      __$$RowImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'database_id') String databaseId,
      Map<String, dynamic> cells,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$$RowImplCopyWithImpl<$Res> extends _$RowCopyWithImpl<$Res, _$RowImpl>
    implements _$$RowImplCopyWith<$Res> {
  __$$RowImplCopyWithImpl(_$RowImpl _value, $Res Function(_$RowImpl) _then)
      : super(_value, _then);

  /// Create a copy of Row
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? databaseId = null,
    Object? cells = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$RowImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      databaseId: null == databaseId
          ? _value.databaseId
          : databaseId // ignore: cast_nullable_to_non_nullable
              as String,
      cells: null == cells
          ? _value._cells
          : cells // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RowImpl implements _Row {
  const _$RowImpl(
      {required this.id,
      @JsonKey(name: 'database_id') required this.databaseId,
      required final Map<String, dynamic> cells,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt})
      : _cells = cells;

  factory _$RowImpl.fromJson(Map<String, dynamic> json) =>
      _$$RowImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'database_id')
  final String databaseId;
  final Map<String, dynamic> _cells;
  @override
  Map<String, dynamic> get cells {
    if (_cells is EqualUnmodifiableMapView) return _cells;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_cells);
  }

  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Row(id: $id, databaseId: $databaseId, cells: $cells, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RowImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.databaseId, databaseId) ||
                other.databaseId == databaseId) &&
            const DeepCollectionEquality().equals(other._cells, _cells) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, databaseId,
      const DeepCollectionEquality().hash(_cells), createdAt, updatedAt);

  /// Create a copy of Row
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RowImplCopyWith<_$RowImpl> get copyWith =>
      __$$RowImplCopyWithImpl<_$RowImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RowImplToJson(
      this,
    );
  }
}

abstract class _Row implements Row {
  const factory _Row(
          {required final String id,
          @JsonKey(name: 'database_id') required final String databaseId,
          required final Map<String, dynamic> cells,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$RowImpl;

  factory _Row.fromJson(Map<String, dynamic> json) = _$RowImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'database_id')
  String get databaseId;
  @override
  Map<String, dynamic> get cells;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of Row
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RowImplCopyWith<_$RowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
