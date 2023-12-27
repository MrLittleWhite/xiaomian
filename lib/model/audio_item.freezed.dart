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
  String get title => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get artist => throw _privateConstructorUsedError;
  String get albumTitle => throw _privateConstructorUsedError;
  String get artwork => throw _privateConstructorUsedError;

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
      String title,
      String url,
      String artist,
      String albumTitle,
      String artwork});
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
    Object? title = null,
    Object? url = null,
    Object? artist = null,
    Object? albumTitle = null,
    Object? artwork = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
      albumTitle: null == albumTitle
          ? _value.albumTitle
          : albumTitle // ignore: cast_nullable_to_non_nullable
              as String,
      artwork: null == artwork
          ? _value.artwork
          : artwork // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
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
      String title,
      String url,
      String artist,
      String albumTitle,
      String artwork});
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
    Object? title = null,
    Object? url = null,
    Object? artist = null,
    Object? albumTitle = null,
    Object? artwork = null,
  }) {
    return _then(_$AudioItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
      albumTitle: null == albumTitle
          ? _value.albumTitle
          : albumTitle // ignore: cast_nullable_to_non_nullable
              as String,
      artwork: null == artwork
          ? _value.artwork
          : artwork // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AudioItemImpl implements _AudioItem {
  const _$AudioItemImpl(
      {required this.id,
      required this.title,
      required this.url,
      required this.artist,
      required this.albumTitle,
      required this.artwork});

  factory _$AudioItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$AudioItemImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String url;
  @override
  final String artist;
  @override
  final String albumTitle;
  @override
  final String artwork;

  @override
  String toString() {
    return 'AudioItem(id: $id, title: $title, url: $url, artist: $artist, albumTitle: $albumTitle, artwork: $artwork)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.albumTitle, albumTitle) ||
                other.albumTitle == albumTitle) &&
            (identical(other.artwork, artwork) || other.artwork == artwork));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, url, artist, albumTitle, artwork);

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
}

abstract class _AudioItem implements AudioItem {
  const factory _AudioItem(
      {required final String id,
      required final String title,
      required final String url,
      required final String artist,
      required final String albumTitle,
      required final String artwork}) = _$AudioItemImpl;

  factory _AudioItem.fromJson(Map<String, dynamic> json) =
      _$AudioItemImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get url;
  @override
  String get artist;
  @override
  String get albumTitle;
  @override
  String get artwork;
  @override
  @JsonKey(ignore: true)
  _$$AudioItemImplCopyWith<_$AudioItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
