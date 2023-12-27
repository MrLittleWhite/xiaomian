import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xiaomian/player/audio_play_item.dart';

part 'audio_item.freezed.dart';
part 'audio_item.g.dart';

@freezed
class AudioItem with _$AudioItem implements AudioPlayItem {
  const factory AudioItem({
    required String id,
    required String title,
    required String url,
    required String artist,
    required String albumTitle,
    required String artwork,
  }) = _AudioItem;

  factory AudioItem.fromJson(Map<String, Object?> json)
      => _$AudioItemFromJson(json);

  static AudioItem test() {
    return AudioItem.fromJson(nowPlayingInfo);
  }

  static Map<String, dynamic> get nowPlayingInfo {
    return {'id': "123", 
         'title': '东方红', 
        'artist': '北京合唱团', 
    'albumTitle': '新中国', 
       'artwork': 'https://cccimg.com/view.php/7ff3bd13cda0aaae9ad0de8d29411f56.jpeg'};
  }
}