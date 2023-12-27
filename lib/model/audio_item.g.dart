// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AudioItemImpl _$$AudioItemImplFromJson(Map<String, dynamic> json) =>
    _$AudioItemImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      artist: json['artist'] as String,
      albumTitle: json['albumTitle'] as String,
      artwork: json['artwork'] as String,
    );

Map<String, dynamic> _$$AudioItemImplToJson(_$AudioItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'artist': instance.artist,
      'albumTitle': instance.albumTitle,
      'artwork': instance.artwork,
    };
