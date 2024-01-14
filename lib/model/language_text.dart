import 'package:isar/isar.dart';
import 'package:xiaomian/component/xm_intl.dart';

part 'language_text.g.dart';

@embedded
class LanguageText {
  String? en;
  String? cn;
  String? ja;
  String? ko;
  String? cnHK;

  LanguageText({this.en, this.cn, this.ja, this.ko, this.cnHK});

  LanguageText.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    cn = json['cn'];
    ja = json['ja'];
    ko = json['ko'];
    cnHK = json['cnHK'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['en'] = en;
    data['cn'] = cn;
    data['ja'] = ja;
    data['ko'] = ko;
    data['cnHK'] = cnHK;
    return data;
  }
}

extension LanguageTextExtension on LanguageText {
  String get txt {
    String? text;
    switch (XMlocale.language) {
      case XMLanguage.english:
        text = en;
      case XMLanguage.simpleChinese:
        text = cn;
      case XMLanguage.japanese:
        text = ja;
      case XMLanguage.korean:
        text = ko;
      case XMLanguage.troditionalChinese:
        text = cnHK;
    }
    return text ?? "mutiple languages error";
  }
}