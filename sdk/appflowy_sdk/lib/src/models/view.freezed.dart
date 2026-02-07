// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

View _$ViewFromJson(Map<String, dynamic> json) {
  return _View.fromJson(json);
}

/// @nodoc
mixin _$View {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  ViewLayout get layout => throw _privateConstructorUsedError;
  @JsonKey(name: 'workspace_id')
  String get workspaceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_view_id')
  String? get parentViewId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this View to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of View
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ViewCopyWith<View> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewCopyWith<$Res> {
  factory $ViewCopyWith(View value, $Res Function(View) then) =
      _$ViewCopyWithImpl<$Res, View>;
  @useResult
  $Res call(
      {String id,
      String name,
      ViewLayout layout,
      @JsonKey(name: 'workspace_id') String workspaceId,
      @JsonKey(name: 'parent_view_id') String? parentViewId,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$ViewCopyWithImpl<$Res, $Val extends View>
    implements $ViewCopyWith<$Res> {
  _$ViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of View
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? layout = null,
    Object? workspaceId = null,
    Object? parentViewId = freezed,
    Object? createdAt = freezed,
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
      layout: null == layout
          ? _value.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as ViewLayout,
      workspaceId: null == workspaceId
          ? _value.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as String,
      parentViewId: freezed == parentViewId
          ? _value.parentViewId
          : parentViewId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ViewImplCopyWith<$Res> implements $ViewCopyWith<$Res> {
  factory _$$ViewImplCopyWith(
          _$ViewImpl value, $Res Function(_$ViewImpl) then) =
      __$$ViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      ViewLayout layout,
      @JsonKey(name: 'workspace_id') String workspaceId,
      @JsonKey(name: 'parent_view_id') String? parentViewId,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$ViewImplCopyWithImpl<$Res>
    extends _$ViewCopyWithImpl<$Res, _$ViewImpl>
    implements _$$ViewImplCopyWith<$Res> {
  __$$ViewImplCopyWithImpl(_$ViewImpl _value, $Res Function(_$ViewImpl) _then)
      : super(_value, _then);

  /// Create a copy of View
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? layout = null,
    Object? workspaceId = null,
    Object? parentViewId = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$ViewImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      layout: null == layout
          ? _value.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as ViewLayout,
      workspaceId: null == workspaceId
          ? _value.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as String,
      parentViewId: freezed == parentViewId
          ? _value.parentViewId
          : parentViewId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ViewImpl implements _View {
  const _$ViewImpl(
      {required this.id,
      required this.name,
      required this.layout,
      @JsonKey(name: 'workspace_id') required this.workspaceId,
      @JsonKey(name: 'parent_view_id') this.parentViewId,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$ViewImpl.fromJson(Map<String, dynamic> json) =>
      _$$ViewImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final ViewLayout layout;
  @override
  @JsonKey(name: 'workspace_id')
  final String workspaceId;
  @override
  @JsonKey(name: 'parent_view_id')
  final String? parentViewId;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'View(id: $id, name: $name, layout: $layout, workspaceId: $workspaceId, parentViewId: $parentViewId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.layout, layout) || other.layout == layout) &&
            (identical(other.workspaceId, workspaceId) ||
                other.workspaceId == workspaceId) &&
            (identical(other.parentViewId, parentViewId) ||
                other.parentViewId == parentViewId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, layout, workspaceId, parentViewId, createdAt);

  /// Create a copy of View
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewImplCopyWith<_$ViewImpl> get copyWith =>
      __$$ViewImplCopyWithImpl<_$ViewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ViewImplToJson(
      this,
    );
  }
}

abstract class _View implements View {
  const factory _View(
      {required final String id,
      required final String name,
      required final ViewLayout layout,
      @JsonKey(name: 'workspace_id') required final String workspaceId,
      @JsonKey(name: 'parent_view_id') final String? parentViewId,
      @JsonKey(name: 'created_at') final DateTime? createdAt}) = _$ViewImpl;

  factory _View.fromJson(Map<String, dynamic> json) = _$ViewImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  ViewLayout get layout;
  @override
  @JsonKey(name: 'workspace_id')
  String get workspaceId;
  @override
  @JsonKey(name: 'parent_view_id')
  String? get parentViewId;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of View
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ViewImplCopyWith<_$ViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
