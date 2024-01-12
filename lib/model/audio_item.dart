import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xiaomian/model/language_text.dart';
import 'package:xiaomian/player/audio_play_item.dart';

part 'audio_item.freezed.dart';
part 'audio_item.g.dart';

@freezed
class AudioItem with _$AudioItem implements AudioPlayItem {
// class AudioItem with _$AudioItem {
  const factory AudioItem({
    required String id,
    required LanguageText titleTXT,
    required String url,
    required String cover,
    required String author,
    required LanguageText descTXT
  }) = _AudioItem;

  factory AudioItem.fromJson(Map<String, Object?> json)
      => _$AudioItemFromJson(json);

  @override
  String get title {
    return titleTXT.txt;
  }

  @override
  String get desc {
    return descTXT.txt;
  }
}

extension AudioItemExtensin on AudioItem {

  static AudioItem test() {
    return AudioItem.fromJson(nowPlayingInfo);
  }

  static Map<String, dynamic> get nowPlayingInfo {
    return {'id': "123", 
         'title': '东方红', 
        'artist': '北京合唱团', 
          'desc': '新中国歌颂伟大领袖毛主席陕北民歌', 
         'cover': 'https://cccimg.com/view.php/7ff3bd13cda0aaae9ad0de8d29411f56.jpeg'};
  }

}