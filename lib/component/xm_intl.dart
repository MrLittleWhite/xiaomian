import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:xiaomian/component/xm_shared_preferences.dart';
import 'package:xiaomian/generated/l10n.dart';


enum XMLanguage {
  english,
  simpleChinese,
  japanese,
  korean,
  troditionalChinese,
}

extension XMLanguageExtension on XMLanguage {
  String get desc {
    switch (this) {
      case XMLanguage.english:
        return 'English';
      case XMLanguage.simpleChinese:
        return '简体中文';
      case XMLanguage.japanese:
        return '日本語';
      case XMLanguage.korean:
        return '한국어';
      case XMLanguage.troditionalChinese:
        return '繁体中文';
    }
  } 

  String get languageCode {
    switch (this) {
      case XMLanguage.english:
        return "en";
      case XMLanguage.simpleChinese:
        return 'zh';
      case XMLanguage.japanese:
        return 'ja';
      case XMLanguage.korean: 
        return 'ko';
      case XMLanguage.troditionalChinese:
        return 'zh';
    }
  } 

  String get countryCode {
    switch (this) {
      case XMLanguage.english:
        return "US";
      case XMLanguage.simpleChinese:
        return 'CN';
      case XMLanguage.japanese:
        return 'JP';
      case XMLanguage.korean:
        return 'KR';
      case XMLanguage.troditionalChinese:
        return 'HK';
    }
  }

  Locale get locale {
    if (languageCode == 'zh') {
      if (countryCode == 'CN') {
        return const Locale('zh', 'CN');
      } else {
        return const Locale('zh', 'HK');
      }
    } else {
      return Locale(languageCode);
    }
  }
}



class XMlocale {
  static XMLanguage language(BuildContext context) {
    var locale = Localizations.localeOf(context);

    if (locale.languageCode == 'zh') {
      if (locale.countryCode == 'CN') {
        return XMLanguage.simpleChinese;
      }
      return XMLanguage.troditionalChinese;
    } else if (locale.languageCode == 'ja') {
      return XMLanguage.japanese;
    } else if (locale.languageCode == 'ko') {
      return XMLanguage.korean;
    }
    return XMLanguage.english;
  }
}

class XMIntl {

  static S get current {
    return S.current;
  }

  static void locale() {
    XMSharedPreferences.getInt(XMPrefersKey.language).then((value) {
      if (value != null) {
        final language = XMLanguage.values[value];
        return setLanguage(language);
      }
      return Future(() => null);
    }).then((value) => null).catchError((e) {
      //upload error
    });
  }

  static Future<void> setLanguage(XMLanguage language) async {
    S.load(language.locale);
    return Get.updateLocale(language.locale);
  }
}
