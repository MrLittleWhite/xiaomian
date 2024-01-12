// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AudioItem _$AudioItemFromJson(Map<String, dynamic> json) {
  return _AudioItem.fromJson(json);
}

/// @nodoc
mixin _$AudioItem {
  String get id => throw _privateConstructorUsedError;
  LanguageText get titleTXT => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get cover => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  LanguageText get descTXT => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AudioItemCopyWith<AudioItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioItemCopyWith<$Res> {
  factory $AudioItemCopyWith(AudioItem value, $Res Function(AudioItem) then) =
      _$AudioItemCopyWithImpl<$Res, AudioItem>;
  @useResult
  $Res call(
      {String id,
      LanguageText titleTXT,
      String url,
      String cover,
      String author,
      LanguageText descTXT});

  $LanguageTextCopyWith<$Res> get titleTXT;
  $LanguageTextCopyWith<$Res> get descTXT;
}

/// @nodoc
class _$AudioItemCopyWithImpl<$Res, $Val extends AudioItem>
    implements $AudioItemCopyWith<$Res> {
  _$AudioItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? titleTXT = null,
    Object? url = null,
    Object? cover = null,
    Object? author = null,
    Object? descTXT = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      titleTXT: null == titleTXT
          ? _value.titleTXT
          : titleTXT // ignore: cast_nullable_to_non_nullable
              as LanguageText,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      cover: null == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      descTXT: null == descTXT
          ? _value.descTXT
          : descTXT // ignore: cast_nullable_to_non_nullable
              as LanguageText,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LanguageTextCopyWith<$Res> get titleTXT {
    return $LanguageTextCopyWith<$Res>(_value.titleTXT, (value) {
      return _then(_value.copyWith(titleTXT: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LanguageTextCopyWith<$Res> get descTXT {
    return $LanguageTextCopyWith<$Res>(_value.descTXT, (value) {
      return _then(_value.copyWith(descTXT: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AudioItemImplCopyWith<$Res>
    implements $AudioItemCopyWith<$Res> {
  factory _$$AudioItemImplCopyWith(
          _$AudioItemImpl value, $Res Function(_$AudioItemImpl) then) =
      __$$AudioItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      LanguageText titleTXT,
      String url,
      String cover,
      String author,
      LanguageText descTXT});

  @override
  $LanguageTextCopyWith<$Res> get titleTXT;
  @override
  $LanguageTextCopyWith<$Res> get descTXT;
}

/// @nodoc
class __$$AudioItemImplCopyWithImpl<$Res>
    extends _$AudioItemCopyWithImpl<$Res, _$AudioItemImpl>
    implements _$$AudioItemImplCopyWith<$Res> {
  __$$AudioItemImplCopyWithImpl(
      _$AudioItemImpl _value, $Res Function(_$AudioItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? titleTXT = null,
    Object? url = null,
    Object? cover = null,
    Object? author = null,
    Object? descTXT = null,
  }) {
    return _then(_$AudioItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      titleTXT: null == titleTXT
          ? _value.titleTXT
          : titleTXT // ignore: cast_nullable_to_non_nullable
              as LanguageText,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      cover: null == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      descTXT: null == descTXT
          ? _value.descTXT
          : descTXT // ignore: cast_nullable_to_non_nullable
              as LanguageText,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AudioItemImpl implements _AudioItem {
  const _$AudioItemImpl(
      {required this.id,
      required this.titleTXT,
      required this.url,
      required this.cover,
      required this.author,
      required this.descTXT});

  factory _$AudioItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$AudioItemImplFromJson(json);

  @override
  final String id;
  @override
  final LanguageText titleTXT;
  @override
  final String url;
  @override
  final String cover;
  @override
  final String author;
  @override
  final LanguageText descTXT;

  @override
  String toString() {
    return 'AudioItem(id: $id, titleTXT: $titleTXT, url: $url, cover: $cover, author: $author, descTXT: $descTXT)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.titleTXT, titleTXT) ||
                other.titleTXT == titleTXT) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.cover, cover) || other.cover == cover) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.descTXT, descTXT) || other.descTXT == descTXT));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, titleTXT, url, cover, author, descTXT);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioItemImplCopyWith<_$AudioItemImpl> get copyWith =>
      __$$AudioItemImplCopyWithImpl<_$AudioItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AudioItemImplToJson(
      this,
    );
  }
  
  @override
  String get desc => descTXT.txt;
  
  @override
  String get title => titleTXT.txt;
}

abstract class _AudioItem implements AudioItem {
  const factory _AudioItem(
      {required final String id,
      required final LanguageText titleTXT,
      required final String url,
      required final String cover,
      required final String author,
      required final LanguageText descTXT}) = _$AudioItemImpl;

  factory _AudioItem.fromJson(Map<String, dynamic> json) =
      _$AudioItemImpl.fromJson;

  @override
  String get id;
  @override
  LanguageText get titleTXT;
  @override
  String get url;
  @override
  String get cover;
  @override
  String get author;
  @override
  LanguageText get descTXT;
  @override
  @JsonKey(ignore: true)
  _$$AudioItemImplCopyWith<_$AudioItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
