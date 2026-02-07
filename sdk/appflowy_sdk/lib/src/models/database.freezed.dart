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
  List<DatabaseView> get views => throw _privateConstructorUsedError;

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
  $Res call({String id, List<DatabaseView> views});
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
    Object? views = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      views: null == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as List<DatabaseView>,
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
  $Res call({String id, List<DatabaseView> views});
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
    Object? views = null,
  }) {
    return _then(_$DatabaseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      views: null == views
          ? _value._views
          : views // ignore: cast_nullable_to_non_nullable
              as List<DatabaseView>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DatabaseImpl implements _Database {
  const _$DatabaseImpl(
      {required this.id, final List<DatabaseView> views = const []})
      : _views = views;

  factory _$DatabaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DatabaseImplFromJson(json);

  @override
  final String id;
  final List<DatabaseView> _views;
  @override
  @JsonKey()
  List<DatabaseView> get views {
    if (_views is EqualUnmodifiableListView) return _views;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_views);
  }

  @override
  String toString() {
    return 'Database(id: $id, views: $views)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatabaseImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._views, _views));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, const DeepCollectionEquality().hash(_views));

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
      final List<DatabaseView> views}) = _$DatabaseImpl;

  factory _Database.fromJson(Map<String, dynamic> json) =
      _$DatabaseImpl.fromJson;

  @override
  String get id;
  @override
  List<DatabaseView> get views;

  /// Create a copy of Database
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DatabaseImplCopyWith<_$DatabaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DatabaseView _$DatabaseViewFromJson(Map<String, dynamic> json) {
  return _DatabaseView.fromJson(json);
}

/// @nodoc
mixin _$DatabaseView {
  @JsonKey(name: 'view_id')
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'layout')
  int? get layout => throw _privateConstructorUsedError;
  Map<String, dynamic>? get icon => throw _privateConstructorUsedError;

  /// Serializes this DatabaseView to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DatabaseView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DatabaseViewCopyWith<DatabaseView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatabaseViewCopyWith<$Res> {
  factory $DatabaseViewCopyWith(
          DatabaseView value, $Res Function(DatabaseView) then) =
      _$DatabaseViewCopyWithImpl<$Res, DatabaseView>;
  @useResult
  $Res call(
      {@JsonKey(name: 'view_id') String id,
      String name,
      @JsonKey(name: 'layout') int? layout,
      Map<String, dynamic>? icon});
}

/// @nodoc
class _$DatabaseViewCopyWithImpl<$Res, $Val extends DatabaseView>
    implements $DatabaseViewCopyWith<$Res> {
  _$DatabaseViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DatabaseView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? layout = freezed,
    Object? icon = freezed,
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
      layout: freezed == layout
          ? _value.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as int?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DatabaseViewImplCopyWith<$Res>
    implements $DatabaseViewCopyWith<$Res> {
  factory _$$DatabaseViewImplCopyWith(
          _$DatabaseViewImpl value, $Res Function(_$DatabaseViewImpl) then) =
      __$$DatabaseViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'view_id') String id,
      String name,
      @JsonKey(name: 'layout') int? layout,
      Map<String, dynamic>? icon});
}

/// @nodoc
class __$$DatabaseViewImplCopyWithImpl<$Res>
    extends _$DatabaseViewCopyWithImpl<$Res, _$DatabaseViewImpl>
    implements _$$DatabaseViewImplCopyWith<$Res> {
  __$$DatabaseViewImplCopyWithImpl(
      _$DatabaseViewImpl _value, $Res Function(_$DatabaseViewImpl) _then)
      : super(_value, _then);

  /// Create a copy of DatabaseView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? layout = freezed,
    Object? icon = freezed,
  }) {
    return _then(_$DatabaseViewImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      layout: freezed == layout
          ? _value.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as int?,
      icon: freezed == icon
          ? _value._icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DatabaseViewImpl implements _DatabaseView {
  const _$DatabaseViewImpl(
      {@JsonKey(name: 'view_id') required this.id,
      required this.name,
      @JsonKey(name: 'layout') this.layout,
      final Map<String, dynamic>? icon})
      : _icon = icon;

  factory _$DatabaseViewImpl.fromJson(Map<String, dynamic> json) =>
      _$$DatabaseViewImplFromJson(json);

  @override
  @JsonKey(name: 'view_id')
  final String id;
  @override
  final String name;
  @override
  @JsonKey(name: 'layout')
  final int? layout;
  final Map<String, dynamic>? _icon;
  @override
  Map<String, dynamic>? get icon {
    final value = _icon;
    if (value == null) return null;
    if (_icon is EqualUnmodifiableMapView) return _icon;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'DatabaseView(id: $id, name: $name, layout: $layout, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatabaseViewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.layout, layout) || other.layout == layout) &&
            const DeepCollectionEquality().equals(other._icon, _icon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, layout,
      const DeepCollectionEquality().hash(_icon));

  /// Create a copy of DatabaseView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DatabaseViewImplCopyWith<_$DatabaseViewImpl> get copyWith =>
      __$$DatabaseViewImplCopyWithImpl<_$DatabaseViewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DatabaseViewImplToJson(
      this,
    );
  }
}

abstract class _DatabaseView implements DatabaseView {
  const factory _DatabaseView(
      {@JsonKey(name: 'view_id') required final String id,
      required final String name,
      @JsonKey(name: 'layout') final int? layout,
      final Map<String, dynamic>? icon}) = _$DatabaseViewImpl;

  factory _DatabaseView.fromJson(Map<String, dynamic> json) =
      _$DatabaseViewImpl.fromJson;

  @override
  @JsonKey(name: 'view_id')
  String get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'layout')
  int? get layout;
  @override
  Map<String, dynamic>? get icon;

  /// Create a copy of DatabaseView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DatabaseViewImplCopyWith<_$DatabaseViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Field _$FieldFromJson(Map<String, dynamic> json) {
  return _Field.fromJson(json);
}

/// @nodoc
mixin _$Field {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'field_type')
  String get fieldType => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_option')
  Map<String, dynamic> get typeOption => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_primary')
  bool get isPrimary => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'field_type') String fieldType,
      @JsonKey(name: 'type_option') Map<String, dynamic> typeOption,
      @JsonKey(name: 'is_primary') bool isPrimary});
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
    Object? fieldType = null,
    Object? typeOption = null,
    Object? isPrimary = null,
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
      fieldType: null == fieldType
          ? _value.fieldType
          : fieldType // ignore: cast_nullable_to_non_nullable
              as String,
      typeOption: null == typeOption
          ? _value.typeOption
          : typeOption // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      isPrimary: null == isPrimary
          ? _value.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool,
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
      @JsonKey(name: 'field_type') String fieldType,
      @JsonKey(name: 'type_option') Map<String, dynamic> typeOption,
      @JsonKey(name: 'is_primary') bool isPrimary});
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
    Object? fieldType = null,
    Object? typeOption = null,
    Object? isPrimary = null,
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
      fieldType: null == fieldType
          ? _value.fieldType
          : fieldType // ignore: cast_nullable_to_non_nullable
              as String,
      typeOption: null == typeOption
          ? _value._typeOption
          : typeOption // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      isPrimary: null == isPrimary
          ? _value.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FieldImpl implements _Field {
  const _$FieldImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'field_type') required this.fieldType,
      @JsonKey(name: 'type_option')
      final Map<String, dynamic> typeOption = const {},
      @JsonKey(name: 'is_primary') this.isPrimary = false})
      : _typeOption = typeOption;

  factory _$FieldImpl.fromJson(Map<String, dynamic> json) =>
      _$$FieldImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey(name: 'field_type')
  final String fieldType;
  final Map<String, dynamic> _typeOption;
  @override
  @JsonKey(name: 'type_option')
  Map<String, dynamic> get typeOption {
    if (_typeOption is EqualUnmodifiableMapView) return _typeOption;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_typeOption);
  }

  @override
  @JsonKey(name: 'is_primary')
  final bool isPrimary;

  @override
  String toString() {
    return 'Field(id: $id, name: $name, fieldType: $fieldType, typeOption: $typeOption, isPrimary: $isPrimary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FieldImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.fieldType, fieldType) ||
                other.fieldType == fieldType) &&
            const DeepCollectionEquality()
                .equals(other._typeOption, _typeOption) &&
            (identical(other.isPrimary, isPrimary) ||
                other.isPrimary == isPrimary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, fieldType,
      const DeepCollectionEquality().hash(_typeOption), isPrimary);

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
      @JsonKey(name: 'field_type') required final String fieldType,
      @JsonKey(name: 'type_option') final Map<String, dynamic> typeOption,
      @JsonKey(name: 'is_primary') final bool isPrimary}) = _$FieldImpl;

  factory _Field.fromJson(Map<String, dynamic> json) = _$FieldImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'field_type')
  String get fieldType;
  @override
  @JsonKey(name: 'type_option')
  Map<String, dynamic> get typeOption;
  @override
  @JsonKey(name: 'is_primary')
  bool get isPrimary;

  /// Create a copy of Field
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FieldImplCopyWith<_$FieldImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RowId _$RowIdFromJson(Map<String, dynamic> json) {
  return _RowId.fromJson(json);
}

/// @nodoc
mixin _$RowId {
  String get id => throw _privateConstructorUsedError;

  /// Serializes this RowId to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RowId
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RowIdCopyWith<RowId> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RowIdCopyWith<$Res> {
  factory $RowIdCopyWith(RowId value, $Res Function(RowId) then) =
      _$RowIdCopyWithImpl<$Res, RowId>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$RowIdCopyWithImpl<$Res, $Val extends RowId>
    implements $RowIdCopyWith<$Res> {
  _$RowIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RowId
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RowIdImplCopyWith<$Res> implements $RowIdCopyWith<$Res> {
  factory _$$RowIdImplCopyWith(
          _$RowIdImpl value, $Res Function(_$RowIdImpl) then) =
      __$$RowIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$RowIdImplCopyWithImpl<$Res>
    extends _$RowIdCopyWithImpl<$Res, _$RowIdImpl>
    implements _$$RowIdImplCopyWith<$Res> {
  __$$RowIdImplCopyWithImpl(
      _$RowIdImpl _value, $Res Function(_$RowIdImpl) _then)
      : super(_value, _then);

  /// Create a copy of RowId
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$RowIdImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RowIdImpl implements _RowId {
  const _$RowIdImpl({required this.id});

  factory _$RowIdImpl.fromJson(Map<String, dynamic> json) =>
      _$$RowIdImplFromJson(json);

  @override
  final String id;

  @override
  String toString() {
    return 'RowId(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RowIdImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of RowId
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RowIdImplCopyWith<_$RowIdImpl> get copyWith =>
      __$$RowIdImplCopyWithImpl<_$RowIdImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RowIdImplToJson(
      this,
    );
  }
}

abstract class _RowId implements RowId {
  const factory _RowId({required final String id}) = _$RowIdImpl;

  factory _RowId.fromJson(Map<String, dynamic> json) = _$RowIdImpl.fromJson;

  @override
  String get id;

  /// Create a copy of RowId
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RowIdImplCopyWith<_$RowIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Row _$RowFromJson(Map<String, dynamic> json) {
  return _Row.fromJson(json);
}

/// @nodoc
mixin _$Row {
  String get id => throw _privateConstructorUsedError;
  Map<String, dynamic> get cells => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_doc')
  bool get hasDoc => throw _privateConstructorUsedError;
  String? get doc => throw _privateConstructorUsedError;

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
      Map<String, dynamic> cells,
      @JsonKey(name: 'has_doc') bool hasDoc,
      String? doc});
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
    Object? cells = null,
    Object? hasDoc = null,
    Object? doc = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cells: null == cells
          ? _value.cells
          : cells // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      hasDoc: null == hasDoc
          ? _value.hasDoc
          : hasDoc // ignore: cast_nullable_to_non_nullable
              as bool,
      doc: freezed == doc
          ? _value.doc
          : doc // ignore: cast_nullable_to_non_nullable
              as String?,
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
      Map<String, dynamic> cells,
      @JsonKey(name: 'has_doc') bool hasDoc,
      String? doc});
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
    Object? cells = null,
    Object? hasDoc = null,
    Object? doc = freezed,
  }) {
    return _then(_$RowImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cells: null == cells
          ? _value._cells
          : cells // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      hasDoc: null == hasDoc
          ? _value.hasDoc
          : hasDoc // ignore: cast_nullable_to_non_nullable
              as bool,
      doc: freezed == doc
          ? _value.doc
          : doc // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RowImpl implements _Row {
  const _$RowImpl(
      {required this.id,
      final Map<String, dynamic> cells = const {},
      @JsonKey(name: 'has_doc') this.hasDoc = false,
      this.doc})
      : _cells = cells;

  factory _$RowImpl.fromJson(Map<String, dynamic> json) =>
      _$$RowImplFromJson(json);

  @override
  final String id;
  final Map<String, dynamic> _cells;
  @override
  @JsonKey()
  Map<String, dynamic> get cells {
    if (_cells is EqualUnmodifiableMapView) return _cells;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_cells);
  }

  @override
  @JsonKey(name: 'has_doc')
  final bool hasDoc;
  @override
  final String? doc;

  @override
  String toString() {
    return 'Row(id: $id, cells: $cells, hasDoc: $hasDoc, doc: $doc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RowImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._cells, _cells) &&
            (identical(other.hasDoc, hasDoc) || other.hasDoc == hasDoc) &&
            (identical(other.doc, doc) || other.doc == doc));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id,
      const DeepCollectionEquality().hash(_cells), hasDoc, doc);

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
      final Map<String, dynamic> cells,
      @JsonKey(name: 'has_doc') final bool hasDoc,
      final String? doc}) = _$RowImpl;

  factory _Row.fromJson(Map<String, dynamic> json) = _$RowImpl.fromJson;

  @override
  String get id;
  @override
  Map<String, dynamic> get cells;
  @override
  @JsonKey(name: 'has_doc')
  bool get hasDoc;
  @override
  String? get doc;

  /// Create a copy of Row
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RowImplCopyWith<_$RowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RowUpdatedItem _$RowUpdatedItemFromJson(Map<String, dynamic> json) {
  return _RowUpdatedItem.fromJson(json);
}

/// @nodoc
mixin _$RowUpdatedItem {
  @JsonKey(name: 'row_id')
  String get rowId => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this RowUpdatedItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RowUpdatedItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RowUpdatedItemCopyWith<RowUpdatedItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RowUpdatedItemCopyWith<$Res> {
  factory $RowUpdatedItemCopyWith(
          RowUpdatedItem value, $Res Function(RowUpdatedItem) then) =
      _$RowUpdatedItemCopyWithImpl<$Res, RowUpdatedItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'row_id') String rowId,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$RowUpdatedItemCopyWithImpl<$Res, $Val extends RowUpdatedItem>
    implements $RowUpdatedItemCopyWith<$Res> {
  _$RowUpdatedItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RowUpdatedItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rowId = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      rowId: null == rowId
          ? _value.rowId
          : rowId // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RowUpdatedItemImplCopyWith<$Res>
    implements $RowUpdatedItemCopyWith<$Res> {
  factory _$$RowUpdatedItemImplCopyWith(_$RowUpdatedItemImpl value,
          $Res Function(_$RowUpdatedItemImpl) then) =
      __$$RowUpdatedItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'row_id') String rowId,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$$RowUpdatedItemImplCopyWithImpl<$Res>
    extends _$RowUpdatedItemCopyWithImpl<$Res, _$RowUpdatedItemImpl>
    implements _$$RowUpdatedItemImplCopyWith<$Res> {
  __$$RowUpdatedItemImplCopyWithImpl(
      _$RowUpdatedItemImpl _value, $Res Function(_$RowUpdatedItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of RowUpdatedItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rowId = null,
    Object? updatedAt = null,
  }) {
    return _then(_$RowUpdatedItemImpl(
      rowId: null == rowId
          ? _value.rowId
          : rowId // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RowUpdatedItemImpl implements _RowUpdatedItem {
  const _$RowUpdatedItemImpl(
      {@JsonKey(name: 'row_id') required this.rowId,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$RowUpdatedItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$RowUpdatedItemImplFromJson(json);

  @override
  @JsonKey(name: 'row_id')
  final String rowId;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'RowUpdatedItem(rowId: $rowId, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RowUpdatedItemImpl &&
            (identical(other.rowId, rowId) || other.rowId == rowId) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rowId, updatedAt);

  /// Create a copy of RowUpdatedItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RowUpdatedItemImplCopyWith<_$RowUpdatedItemImpl> get copyWith =>
      __$$RowUpdatedItemImplCopyWithImpl<_$RowUpdatedItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RowUpdatedItemImplToJson(
      this,
    );
  }
}

abstract class _RowUpdatedItem implements RowUpdatedItem {
  const factory _RowUpdatedItem(
          {@JsonKey(name: 'row_id') required final String rowId,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$RowUpdatedItemImpl;

  factory _RowUpdatedItem.fromJson(Map<String, dynamic> json) =
      _$RowUpdatedItemImpl.fromJson;

  @override
  @JsonKey(name: 'row_id')
  String get rowId;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of RowUpdatedItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RowUpdatedItemImplCopyWith<_$RowUpdatedItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InsertDatabaseField _$InsertDatabaseFieldFromJson(Map<String, dynamic> json) {
  return _InsertDatabaseField.fromJson(json);
}

/// @nodoc
mixin _$InsertDatabaseField {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'field_type')
  int get fieldType => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_option_data')
  Map<String, dynamic>? get typeOptionData =>
      throw _privateConstructorUsedError;

  /// Serializes this InsertDatabaseField to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InsertDatabaseField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InsertDatabaseFieldCopyWith<InsertDatabaseField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InsertDatabaseFieldCopyWith<$Res> {
  factory $InsertDatabaseFieldCopyWith(
          InsertDatabaseField value, $Res Function(InsertDatabaseField) then) =
      _$InsertDatabaseFieldCopyWithImpl<$Res, InsertDatabaseField>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'field_type') int fieldType,
      @JsonKey(name: 'type_option_data') Map<String, dynamic>? typeOptionData});
}

/// @nodoc
class _$InsertDatabaseFieldCopyWithImpl<$Res, $Val extends InsertDatabaseField>
    implements $InsertDatabaseFieldCopyWith<$Res> {
  _$InsertDatabaseFieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InsertDatabaseField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? fieldType = null,
    Object? typeOptionData = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fieldType: null == fieldType
          ? _value.fieldType
          : fieldType // ignore: cast_nullable_to_non_nullable
              as int,
      typeOptionData: freezed == typeOptionData
          ? _value.typeOptionData
          : typeOptionData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InsertDatabaseFieldImplCopyWith<$Res>
    implements $InsertDatabaseFieldCopyWith<$Res> {
  factory _$$InsertDatabaseFieldImplCopyWith(_$InsertDatabaseFieldImpl value,
          $Res Function(_$InsertDatabaseFieldImpl) then) =
      __$$InsertDatabaseFieldImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'field_type') int fieldType,
      @JsonKey(name: 'type_option_data') Map<String, dynamic>? typeOptionData});
}

/// @nodoc
class __$$InsertDatabaseFieldImplCopyWithImpl<$Res>
    extends _$InsertDatabaseFieldCopyWithImpl<$Res, _$InsertDatabaseFieldImpl>
    implements _$$InsertDatabaseFieldImplCopyWith<$Res> {
  __$$InsertDatabaseFieldImplCopyWithImpl(_$InsertDatabaseFieldImpl _value,
      $Res Function(_$InsertDatabaseFieldImpl) _then)
      : super(_value, _then);

  /// Create a copy of InsertDatabaseField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? fieldType = null,
    Object? typeOptionData = freezed,
  }) {
    return _then(_$InsertDatabaseFieldImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fieldType: null == fieldType
          ? _value.fieldType
          : fieldType // ignore: cast_nullable_to_non_nullable
              as int,
      typeOptionData: freezed == typeOptionData
          ? _value._typeOptionData
          : typeOptionData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InsertDatabaseFieldImpl implements _InsertDatabaseField {
  const _$InsertDatabaseFieldImpl(
      {required this.name,
      @JsonKey(name: 'field_type') required this.fieldType,
      @JsonKey(name: 'type_option_data')
      final Map<String, dynamic>? typeOptionData})
      : _typeOptionData = typeOptionData;

  factory _$InsertDatabaseFieldImpl.fromJson(Map<String, dynamic> json) =>
      _$$InsertDatabaseFieldImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'field_type')
  final int fieldType;
  final Map<String, dynamic>? _typeOptionData;
  @override
  @JsonKey(name: 'type_option_data')
  Map<String, dynamic>? get typeOptionData {
    final value = _typeOptionData;
    if (value == null) return null;
    if (_typeOptionData is EqualUnmodifiableMapView) return _typeOptionData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'InsertDatabaseField(name: $name, fieldType: $fieldType, typeOptionData: $typeOptionData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InsertDatabaseFieldImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.fieldType, fieldType) ||
                other.fieldType == fieldType) &&
            const DeepCollectionEquality()
                .equals(other._typeOptionData, _typeOptionData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, fieldType,
      const DeepCollectionEquality().hash(_typeOptionData));

  /// Create a copy of InsertDatabaseField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InsertDatabaseFieldImplCopyWith<_$InsertDatabaseFieldImpl> get copyWith =>
      __$$InsertDatabaseFieldImplCopyWithImpl<_$InsertDatabaseFieldImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InsertDatabaseFieldImplToJson(
      this,
    );
  }
}

abstract class _InsertDatabaseField implements InsertDatabaseField {
  const factory _InsertDatabaseField(
      {required final String name,
      @JsonKey(name: 'field_type') required final int fieldType,
      @JsonKey(name: 'type_option_data')
      final Map<String, dynamic>? typeOptionData}) = _$InsertDatabaseFieldImpl;

  factory _InsertDatabaseField.fromJson(Map<String, dynamic> json) =
      _$InsertDatabaseFieldImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'field_type')
  int get fieldType;
  @override
  @JsonKey(name: 'type_option_data')
  Map<String, dynamic>? get typeOptionData;

  /// Create a copy of InsertDatabaseField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InsertDatabaseFieldImplCopyWith<_$InsertDatabaseFieldImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
