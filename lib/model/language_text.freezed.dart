// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'language_text.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LanguageText _$LanguageTextFromJson(Map<String, dynamic> json) {
  return _LanguageText.fromJson(json);
}

/// @nodoc
mixin _$LanguageText {
  String get en => throw _privateConstructorUsedError;
  String get cn => throw _privateConstructorUsedError;
  String get ja => throw _privateConstructorUsedError;
  String get ko => throw _privateConstructorUsedError;
  String get cnHK => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LanguageTextCopyWith<LanguageText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageTextCopyWith<$Res> {
  factory $LanguageTextCopyWith(
          LanguageText value, $Res Function(LanguageText) then) =
      _$LanguageTextCopyWithImpl<$Res, LanguageText>;
  @useResult
  $Res call({String en, String cn, String ja, String ko, String cnHK});
}

/// @nodoc
class _$LanguageTextCopyWithImpl<$Res, $Val extends LanguageText>
    implements $LanguageTextCopyWith<$Res> {
  _$LanguageTextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? en = null,
    Object? cn = null,
    Object? ja = null,
    Object? ko = null,
    Object? cnHK = null,
  }) {
    return _then(_value.copyWith(
      en: null == en
          ? _value.en
          : en // ignore: cast_nullable_to_non_nullable
              as String,
      cn: null == cn
          ? _value.cn
          : cn // ignore: cast_nullable_to_non_nullable
              as String,
      ja: null == ja
          ? _value.ja
          : ja // ignore: cast_nullable_to_non_nullable
              as String,
      ko: null == ko
          ? _value.ko
          : ko // ignore: cast_nullable_to_non_nullable
              as String,
      cnHK: null == cnHK
          ? _value.cnHK
          : cnHK // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LanguageTextImplCopyWith<$Res>
    implements $LanguageTextCopyWith<$Res> {
  factory _$$LanguageTextImplCopyWith(
          _$LanguageTextImpl value, $Res Function(_$LanguageTextImpl) then) =
      __$$LanguageTextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String en, String cn, String ja, String ko, String cnHK});
}

/// @nodoc
class __$$LanguageTextImplCopyWithImpl<$Res>
    extends _$LanguageTextCopyWithImpl<$Res, _$LanguageTextImpl>
    implements _$$LanguageTextImplCopyWith<$Res> {
  __$$LanguageTextImplCopyWithImpl(
      _$LanguageTextImpl _value, $Res Function(_$LanguageTextImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? en = null,
    Object? cn = null,
    Object? ja = null,
    Object? ko = null,
    Object? cnHK = null,
  }) {
    return _then(_$LanguageTextImpl(
      en: null == en
          ? _value.en
          : en // ignore: cast_nullable_to_non_nullable
              as String,
      cn: null == cn
          ? _value.cn
          : cn // ignore: cast_nullable_to_non_nullable
              as String,
      ja: null == ja
          ? _value.ja
          : ja // ignore: cast_nullable_to_non_nullable
              as String,
      ko: null == ko
          ? _value.ko
          : ko // ignore: cast_nullable_to_non_nullable
              as String,
      cnHK: null == cnHK
          ? _value.cnHK
          : cnHK // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LanguageTextImpl implements _LanguageText {
  const _$LanguageTextImpl(
      {required this.en,
      required this.cn,
      required this.ja,
      required this.ko,
      required this.cnHK});

  factory _$LanguageTextImpl.fromJson(Map<String, dynamic> json) =>
      _$$LanguageTextImplFromJson(json);

  @override
  final String en;
  @override
  final String cn;
  @override
  final String ja;
  @override
  final String ko;
  @override
  final String cnHK;

  @override
  String toString() {
    return 'LanguageText(en: $en, cn: $cn, ja: $ja, ko: $ko, cnHK: $cnHK)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LanguageTextImpl &&
            (identical(other.en, en) || other.en == en) &&
            (identical(other.cn, cn) || other.cn == cn) &&
            (identical(other.ja, ja) || other.ja == ja) &&
            (identical(other.ko, ko) || other.ko == ko) &&
            (identical(other.cnHK, cnHK) || other.cnHK == cnHK));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, en, cn, ja, ko, cnHK);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LanguageTextImplCopyWith<_$LanguageTextImpl> get copyWith =>
      __$$LanguageTextImplCopyWithImpl<_$LanguageTextImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LanguageTextImplToJson(
      this,
    );
  }
}

abstract class _LanguageText implements LanguageText {
  const factory _LanguageText(
      {required final String en,
      required final String cn,
      required final String ja,
      required final String ko,
      required final String cnHK}) = _$LanguageTextImpl;

  factory _LanguageText.fromJson(Map<String, dynamic> json) =
      _$LanguageTextImpl.fromJson;

  @override
  String get en;
  @override
  String get cn;
  @override
  String get ja;
  @override
  String get ko;
  @override
  String get cnHK;
  @override
  @JsonKey(ignore: true)
  _$$LanguageTextImplCopyWith<_$LanguageTextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
