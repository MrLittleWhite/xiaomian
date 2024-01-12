import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xiaomian/component/xm_intl.dart';

part 'language_text.freezed.dart';
part 'language_text.g.dart';

@freezed
class LanguageText with _$LanguageText {
  const factory LanguageText({
    required String en,
    required String cn,
    required String ja,
    required String ko,
    required String cnHK
  }) = _LanguageText;

  factory LanguageText.fromJson(Map<String, Object?> json)
      => _$LanguageTextFromJson(json);
}

extension LanguageTextExtension on LanguageText {
  String get txt {
    switch (XMlocale.language) {
      case XMLanguage.english:
        return en;
      case XMLanguage.simpleChinese:
        return cn;
      case XMLanguage.japanese:
        return ja;
      case XMLanguage.korean:
        return ko;
      case XMLanguage.troditionalChinese:
        return cnHK;
    }
  }
}