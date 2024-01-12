// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AudioItemImpl _$$AudioItemImplFromJson(Map<String, dynamic> json) =>
    _$AudioItemImpl(
      id: json['id'] as String,
      titleTXT: LanguageText.fromJson(json['titleTXT'] as Map<String, dynamic>),
      url: json['url'] as String,
      cover: json['cover'] as String,
      author: json['author'] as String,
      descTXT: LanguageText.fromJson(json['descTXT'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AudioItemImplToJson(_$AudioItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titleTXT': instance.titleTXT,
      'url': instance.url,
      'cover': instance.cover,
      'author': instance.author,
      'descTXT': instance.descTXT,
    };
