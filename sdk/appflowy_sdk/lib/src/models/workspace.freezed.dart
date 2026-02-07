// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workspace.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Workspace _$WorkspaceFromJson(Map<String, dynamic> json) {
  return _Workspace.fromJson(json);
}

/// @nodoc
mixin _$Workspace {
  @JsonKey(name: 'workspace_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'workspace_name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  List<WorkspaceMember> get members => throw _privateConstructorUsedError;

  /// Serializes this Workspace to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Workspace
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkspaceCopyWith<Workspace> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkspaceCopyWith<$Res> {
  factory $WorkspaceCopyWith(Workspace value, $Res Function(Workspace) then) =
      _$WorkspaceCopyWithImpl<$Res, Workspace>;
  @useResult
  $Res call(
      {@JsonKey(name: 'workspace_id') String id,
      @JsonKey(name: 'workspace_name') String name,
      @JsonKey(name: 'created_at') DateTime createdAt,
      List<WorkspaceMember> members});
}

/// @nodoc
class _$WorkspaceCopyWithImpl<$Res, $Val extends Workspace>
    implements $WorkspaceCopyWith<$Res> {
  _$WorkspaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Workspace
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdAt = null,
    Object? members = null,
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<WorkspaceMember>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkspaceImplCopyWith<$Res>
    implements $WorkspaceCopyWith<$Res> {
  factory _$$WorkspaceImplCopyWith(
          _$WorkspaceImpl value, $Res Function(_$WorkspaceImpl) then) =
      __$$WorkspaceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'workspace_id') String id,
      @JsonKey(name: 'workspace_name') String name,
      @JsonKey(name: 'created_at') DateTime createdAt,
      List<WorkspaceMember> members});
}

/// @nodoc
class __$$WorkspaceImplCopyWithImpl<$Res>
    extends _$WorkspaceCopyWithImpl<$Res, _$WorkspaceImpl>
    implements _$$WorkspaceImplCopyWith<$Res> {
  __$$WorkspaceImplCopyWithImpl(
      _$WorkspaceImpl _value, $Res Function(_$WorkspaceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Workspace
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdAt = null,
    Object? members = null,
  }) {
    return _then(_$WorkspaceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<WorkspaceMember>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkspaceImpl implements _Workspace {
  const _$WorkspaceImpl(
      {@JsonKey(name: 'workspace_id') required this.id,
      @JsonKey(name: 'workspace_name') required this.name,
      @JsonKey(name: 'created_at') required this.createdAt,
      final List<WorkspaceMember> members = const []})
      : _members = members;

  factory _$WorkspaceImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkspaceImplFromJson(json);

  @override
  @JsonKey(name: 'workspace_id')
  final String id;
  @override
  @JsonKey(name: 'workspace_name')
  final String name;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  final List<WorkspaceMember> _members;
  @override
  @JsonKey()
  List<WorkspaceMember> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  String toString() {
    return 'Workspace(id: $id, name: $name, createdAt: $createdAt, members: $members)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkspaceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._members, _members));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, createdAt,
      const DeepCollectionEquality().hash(_members));

  /// Create a copy of Workspace
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkspaceImplCopyWith<_$WorkspaceImpl> get copyWith =>
      __$$WorkspaceImplCopyWithImpl<_$WorkspaceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkspaceImplToJson(
      this,
    );
  }
}

abstract class _Workspace implements Workspace {
  const factory _Workspace(
      {@JsonKey(name: 'workspace_id') required final String id,
      @JsonKey(name: 'workspace_name') required final String name,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      final List<WorkspaceMember> members}) = _$WorkspaceImpl;

  factory _Workspace.fromJson(Map<String, dynamic> json) =
      _$WorkspaceImpl.fromJson;

  @override
  @JsonKey(name: 'workspace_id')
  String get id;
  @override
  @JsonKey(name: 'workspace_name')
  String get name;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  List<WorkspaceMember> get members;

  /// Create a copy of Workspace
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkspaceImplCopyWith<_$WorkspaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WorkspaceMember _$WorkspaceMemberFromJson(Map<String, dynamic> json) {
  return _WorkspaceMember.fromJson(json);
}

/// @nodoc
mixin _$WorkspaceMember {
  String get email => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Role get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'joined_at')
  int? get joinedAt => throw _privateConstructorUsedError;

  /// Serializes this WorkspaceMember to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkspaceMember
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkspaceMemberCopyWith<WorkspaceMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkspaceMemberCopyWith<$Res> {
  factory $WorkspaceMemberCopyWith(
          WorkspaceMember value, $Res Function(WorkspaceMember) then) =
      _$WorkspaceMemberCopyWithImpl<$Res, WorkspaceMember>;
  @useResult
  $Res call(
      {String email,
      String name,
      Role role,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'joined_at') int? joinedAt});
}

/// @nodoc
class _$WorkspaceMemberCopyWithImpl<$Res, $Val extends WorkspaceMember>
    implements $WorkspaceMemberCopyWith<$Res> {
  _$WorkspaceMemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkspaceMember
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? name = null,
    Object? role = null,
    Object? avatarUrl = freezed,
    Object? joinedAt = freezed,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      joinedAt: freezed == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkspaceMemberImplCopyWith<$Res>
    implements $WorkspaceMemberCopyWith<$Res> {
  factory _$$WorkspaceMemberImplCopyWith(_$WorkspaceMemberImpl value,
          $Res Function(_$WorkspaceMemberImpl) then) =
      __$$WorkspaceMemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String name,
      Role role,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'joined_at') int? joinedAt});
}

/// @nodoc
class __$$WorkspaceMemberImplCopyWithImpl<$Res>
    extends _$WorkspaceMemberCopyWithImpl<$Res, _$WorkspaceMemberImpl>
    implements _$$WorkspaceMemberImplCopyWith<$Res> {
  __$$WorkspaceMemberImplCopyWithImpl(
      _$WorkspaceMemberImpl _value, $Res Function(_$WorkspaceMemberImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkspaceMember
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? name = null,
    Object? role = null,
    Object? avatarUrl = freezed,
    Object? joinedAt = freezed,
  }) {
    return _then(_$WorkspaceMemberImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      joinedAt: freezed == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkspaceMemberImpl implements _WorkspaceMember {
  const _$WorkspaceMemberImpl(
      {required this.email,
      required this.name,
      required this.role,
      @JsonKey(name: 'avatar_url') this.avatarUrl,
      @JsonKey(name: 'joined_at') this.joinedAt});

  factory _$WorkspaceMemberImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkspaceMemberImplFromJson(json);

  @override
  final String email;
  @override
  final String name;
  @override
  final Role role;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  @JsonKey(name: 'joined_at')
  final int? joinedAt;

  @override
  String toString() {
    return 'WorkspaceMember(email: $email, name: $name, role: $role, avatarUrl: $avatarUrl, joinedAt: $joinedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkspaceMemberImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, name, role, avatarUrl, joinedAt);

  /// Create a copy of WorkspaceMember
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkspaceMemberImplCopyWith<_$WorkspaceMemberImpl> get copyWith =>
      __$$WorkspaceMemberImplCopyWithImpl<_$WorkspaceMemberImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkspaceMemberImplToJson(
      this,
    );
  }
}

abstract class _WorkspaceMember implements WorkspaceMember {
  const factory _WorkspaceMember(
      {required final String email,
      required final String name,
      required final Role role,
      @JsonKey(name: 'avatar_url') final String? avatarUrl,
      @JsonKey(name: 'joined_at') final int? joinedAt}) = _$WorkspaceMemberImpl;

  factory _WorkspaceMember.fromJson(Map<String, dynamic> json) =
      _$WorkspaceMemberImpl.fromJson;

  @override
  String get email;
  @override
  String get name;
  @override
  Role get role;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  @JsonKey(name: 'joined_at')
  int? get joinedAt;

  /// Create a copy of WorkspaceMember
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkspaceMemberImplCopyWith<_$WorkspaceMemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WorkspaceUsage _$WorkspaceUsageFromJson(Map<String, dynamic> json) {
  return _WorkspaceUsage.fromJson(json);
}

/// @nodoc
mixin _$WorkspaceUsage {
  @JsonKey(name: 'total_blob_bytes')
  int get totalBlobBytes => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_blob_bytes_limit')
  int get totalBlobBytesLimit => throw _privateConstructorUsedError;
  @JsonKey(name: 'member_count')
  int get memberCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'member_count_limit')
  int get memberCountLimit => throw _privateConstructorUsedError;

  /// Serializes this WorkspaceUsage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkspaceUsage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkspaceUsageCopyWith<WorkspaceUsage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkspaceUsageCopyWith<$Res> {
  factory $WorkspaceUsageCopyWith(
          WorkspaceUsage value, $Res Function(WorkspaceUsage) then) =
      _$WorkspaceUsageCopyWithImpl<$Res, WorkspaceUsage>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_blob_bytes') int totalBlobBytes,
      @JsonKey(name: 'total_blob_bytes_limit') int totalBlobBytesLimit,
      @JsonKey(name: 'member_count') int memberCount,
      @JsonKey(name: 'member_count_limit') int memberCountLimit});
}

/// @nodoc
class _$WorkspaceUsageCopyWithImpl<$Res, $Val extends WorkspaceUsage>
    implements $WorkspaceUsageCopyWith<$Res> {
  _$WorkspaceUsageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkspaceUsage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBlobBytes = null,
    Object? totalBlobBytesLimit = null,
    Object? memberCount = null,
    Object? memberCountLimit = null,
  }) {
    return _then(_value.copyWith(
      totalBlobBytes: null == totalBlobBytes
          ? _value.totalBlobBytes
          : totalBlobBytes // ignore: cast_nullable_to_non_nullable
              as int,
      totalBlobBytesLimit: null == totalBlobBytesLimit
          ? _value.totalBlobBytesLimit
          : totalBlobBytesLimit // ignore: cast_nullable_to_non_nullable
              as int,
      memberCount: null == memberCount
          ? _value.memberCount
          : memberCount // ignore: cast_nullable_to_non_nullable
              as int,
      memberCountLimit: null == memberCountLimit
          ? _value.memberCountLimit
          : memberCountLimit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkspaceUsageImplCopyWith<$Res>
    implements $WorkspaceUsageCopyWith<$Res> {
  factory _$$WorkspaceUsageImplCopyWith(_$WorkspaceUsageImpl value,
          $Res Function(_$WorkspaceUsageImpl) then) =
      __$$WorkspaceUsageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_blob_bytes') int totalBlobBytes,
      @JsonKey(name: 'total_blob_bytes_limit') int totalBlobBytesLimit,
      @JsonKey(name: 'member_count') int memberCount,
      @JsonKey(name: 'member_count_limit') int memberCountLimit});
}

/// @nodoc
class __$$WorkspaceUsageImplCopyWithImpl<$Res>
    extends _$WorkspaceUsageCopyWithImpl<$Res, _$WorkspaceUsageImpl>
    implements _$$WorkspaceUsageImplCopyWith<$Res> {
  __$$WorkspaceUsageImplCopyWithImpl(
      _$WorkspaceUsageImpl _value, $Res Function(_$WorkspaceUsageImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkspaceUsage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBlobBytes = null,
    Object? totalBlobBytesLimit = null,
    Object? memberCount = null,
    Object? memberCountLimit = null,
  }) {
    return _then(_$WorkspaceUsageImpl(
      totalBlobBytes: null == totalBlobBytes
          ? _value.totalBlobBytes
          : totalBlobBytes // ignore: cast_nullable_to_non_nullable
              as int,
      totalBlobBytesLimit: null == totalBlobBytesLimit
          ? _value.totalBlobBytesLimit
          : totalBlobBytesLimit // ignore: cast_nullable_to_non_nullable
              as int,
      memberCount: null == memberCount
          ? _value.memberCount
          : memberCount // ignore: cast_nullable_to_non_nullable
              as int,
      memberCountLimit: null == memberCountLimit
          ? _value.memberCountLimit
          : memberCountLimit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkspaceUsageImpl implements _WorkspaceUsage {
  const _$WorkspaceUsageImpl(
      {@JsonKey(name: 'total_blob_bytes') required this.totalBlobBytes,
      @JsonKey(name: 'total_blob_bytes_limit')
      required this.totalBlobBytesLimit,
      @JsonKey(name: 'member_count') required this.memberCount,
      @JsonKey(name: 'member_count_limit') required this.memberCountLimit});

  factory _$WorkspaceUsageImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkspaceUsageImplFromJson(json);

  @override
  @JsonKey(name: 'total_blob_bytes')
  final int totalBlobBytes;
  @override
  @JsonKey(name: 'total_blob_bytes_limit')
  final int totalBlobBytesLimit;
  @override
  @JsonKey(name: 'member_count')
  final int memberCount;
  @override
  @JsonKey(name: 'member_count_limit')
  final int memberCountLimit;

  @override
  String toString() {
    return 'WorkspaceUsage(totalBlobBytes: $totalBlobBytes, totalBlobBytesLimit: $totalBlobBytesLimit, memberCount: $memberCount, memberCountLimit: $memberCountLimit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkspaceUsageImpl &&
            (identical(other.totalBlobBytes, totalBlobBytes) ||
                other.totalBlobBytes == totalBlobBytes) &&
            (identical(other.totalBlobBytesLimit, totalBlobBytesLimit) ||
                other.totalBlobBytesLimit == totalBlobBytesLimit) &&
            (identical(other.memberCount, memberCount) ||
                other.memberCount == memberCount) &&
            (identical(other.memberCountLimit, memberCountLimit) ||
                other.memberCountLimit == memberCountLimit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalBlobBytes,
      totalBlobBytesLimit, memberCount, memberCountLimit);

  /// Create a copy of WorkspaceUsage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkspaceUsageImplCopyWith<_$WorkspaceUsageImpl> get copyWith =>
      __$$WorkspaceUsageImplCopyWithImpl<_$WorkspaceUsageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkspaceUsageImplToJson(
      this,
    );
  }
}

abstract class _WorkspaceUsage implements WorkspaceUsage {
  const factory _WorkspaceUsage(
      {@JsonKey(name: 'total_blob_bytes') required final int totalBlobBytes,
      @JsonKey(name: 'total_blob_bytes_limit')
      required final int totalBlobBytesLimit,
      @JsonKey(name: 'member_count') required final int memberCount,
      @JsonKey(name: 'member_count_limit')
      required final int memberCountLimit}) = _$WorkspaceUsageImpl;

  factory _WorkspaceUsage.fromJson(Map<String, dynamic> json) =
      _$WorkspaceUsageImpl.fromJson;

  @override
  @JsonKey(name: 'total_blob_bytes')
  int get totalBlobBytes;
  @override
  @JsonKey(name: 'total_blob_bytes_limit')
  int get totalBlobBytesLimit;
  @override
  @JsonKey(name: 'member_count')
  int get memberCount;
  @override
  @JsonKey(name: 'member_count_limit')
  int get memberCountLimit;

  /// Create a copy of WorkspaceUsage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkspaceUsageImplCopyWith<_$WorkspaceUsageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
