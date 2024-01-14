import 'dart:convert';
import 'package:isar/isar.dart';
import 'package:xiaomian/model/language_text.dart';
import 'package:xiaomian/model/xm_user.dart';
import 'package:xiaomian/player/audio_play_item.dart';

part 'audio_item.g.dart';

@collection
class AudioItem implements AudioPlayItem {

    @Index(unique: true, replace: true)
    @override
      String aId;

    @override
      String? cover;

    @override
      String? url;

    LanguageText? titleTXT;
    XMUser? author;
    LanguageText? descTXT;

    Id id = Isar.autoIncrement;

    @Index()
    DateTime? createTime;

    AudioItem({
        required this.aId,
        this.cover,
        this.url,
        this.titleTXT,
        this.author,
        this.descTXT,
        this.createTime,
    });

    factory AudioItem.fromRawJson(String str) => AudioItem.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AudioItem.fromJson(Map<String, dynamic> json) => AudioItem(
        aId: json["id"],
        cover: json["cover"],
        url: json["url"],
        titleTXT: json["title"] == null ? null : LanguageText.fromJson(json["title"]),
        author: json["author"] == null ? null : XMUser.fromJson(json["author"]),
        descTXT: json["desc"] == null ? null : LanguageText.fromJson(json["desc"]),
        createTime: json["createTime"] == null ? DateTime.now() : DateTime.parse(json["createTime"]),
    );

    Map<String, dynamic> toJson() => {
        "id": aId,
        "cover": cover,
        "url": url,
        "title": titleTXT?.toJson(),
        "author": author?.toJson(),
        "desc": descTXT?.toJson(),
    };
    
    @ignore
    @override
    String? get authorName {
      return author?.name;
    }

    @ignore
    @override
    String? get desc {
      return descTXT?.txt;
    }

    @ignore  
    @override
    String? get title {
      return titleTXT?.txt;
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