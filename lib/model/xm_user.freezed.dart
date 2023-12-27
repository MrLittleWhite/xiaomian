// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'xm_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

XMUser _$XMUserFromJson(Map<String, dynamic> json) {
  return _XMUser.fromJson(json);
}

/// @nodoc
mixin _$XMUser {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $XMUserCopyWith<XMUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $XMUserCopyWith<$Res> {
  factory $XMUserCopyWith(XMUser value, $Res Function(XMUser) then) =
      _$XMUserCopyWithImpl<$Res, XMUser>;
  @useResult
  $Res call({String id, String name, String avatar});
}

/// @nodoc
class _$XMUserCopyWithImpl<$Res, $Val extends XMUser>
    implements $XMUserCopyWith<$Res> {
  _$XMUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatar = null,
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
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$XMUserImplCopyWith<$Res> implements $XMUserCopyWith<$Res> {
  factory _$$XMUserImplCopyWith(
          _$XMUserImpl value, $Res Function(_$XMUserImpl) then) =
      __$$XMUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String avatar});
}

/// @nodoc
class __$$XMUserImplCopyWithImpl<$Res>
    extends _$XMUserCopyWithImpl<$Res, _$XMUserImpl>
    implements _$$XMUserImplCopyWith<$Res> {
  __$$XMUserImplCopyWithImpl(
      _$XMUserImpl _value, $Res Function(_$XMUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatar = null,
  }) {
    return _then(_$XMUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$XMUserImpl with DiagnosticableTreeMixin implements _XMUser {
  const _$XMUserImpl(
      {required this.id, required this.name, required this.avatar});

  factory _$XMUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$XMUserImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String avatar;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'XMUser(id: $id, name: $name, avatar: $avatar)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'XMUser'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('avatar', avatar));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$XMUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, avatar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$XMUserImplCopyWith<_$XMUserImpl> get copyWith =>
      __$$XMUserImplCopyWithImpl<_$XMUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$XMUserImplToJson(
      this,
    );
  }
}

abstract class _XMUser implements XMUser {
  const factory _XMUser(
      {required final String id,
      required final String name,
      required final String avatar}) = _$XMUserImpl;

  factory _XMUser.fromJson(Map<String, dynamic> json) = _$XMUserImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get avatar;
  @override
  @JsonKey(ignore: true)
  _$$XMUserImplCopyWith<_$XMUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
