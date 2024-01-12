import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:xiaomian/assets_code/xm_color.dart';
import 'package:xiaomian/component/xm_appbar.dart';
import 'package:xiaomian/component/xm_intl.dart';
import 'package:xiaomian/component/xm_shared_preferences.dart';
import 'package:xiaomian/gen/fonts.gen.dart';

enum GeneralSettingItemType {
  language,
}

extension GeneralSettingItemTypeExtension on GeneralSettingItemType {
  String get name {
    switch (this) {
      case GeneralSettingItemType.language:
        return XMIntl.current.language;
    }
  }

  IconData get icon {
    switch (this) {
      case GeneralSettingItemType.language:
        return Icons.public;
    }
  }

  Color? get iconColor {
    switch (this) {
      case GeneralSettingItemType.language:
        return Colors.white;
    }
  }
}

class GeneralSettingPage extends StatefulWidget {
  const GeneralSettingPage({super.key});

  @override
  State<GeneralSettingPage> createState() => _GeneralSettingPageState();
}

class _GeneralSettingPageState extends State<GeneralSettingPage> {

  final List<GeneralSettingItemType> _items = [
    GeneralSettingItemType.language,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: XMAppBar.name(XMIntl.current.generalSettings),
      backgroundColor: XMColor.xmMain,
      body: Theme(
        data: ThemeData(listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16))),
        child: ListView.separated(
          itemBuilder: (context, index) {
            var item = _items[index];
                return ListTile(
            key: ValueKey(item), 
            leading: SizedBox(width: 45, height: 45, child: Icon(item.icon, color: item.iconColor,),), 
            title: Text(_items[index].name, style: const TextStyle(color: Colors.white, fontSize: 20, fontFamily: FontFamily.nunito, fontFamilyFallback: [FontFamily.xmRound])), 
            trailing: Text(XMlocale.language.desc, style: const TextStyle(color: Colors.white, fontSize: 16, fontFamily: FontFamily.nunito, fontFamilyFallback: [FontFamily.xmRound]),),
            onTap: () {
              changeLanguage().then((value) {
                if (value == null) {
                  return Future(() => false);
                }
                XMLanguage language = XMLanguage.values[value];
                return Future.wait([XMSharedPreferences.setInt(XMPrefersKey.language, value), XMIntl.setLanguage(language)]) ;
              }).then((value) => null).catchError((e) {
                //upload error
              });
            },
            );
            
          }, 
          separatorBuilder: (context, index) {
            var item = _items[index];
            Key key = ValueKey(item);
            return Padding(
              key: key,
              padding: const EdgeInsets.only(left: 72),
              child: Gap(1, color: XMColor.xmSeparator,),
            );
          }, 
          itemCount: _items.length,
          ),
      ),
    );
  }

  SimpleDialogOption option(XMLanguage language) {
    return SimpleDialogOption(
      child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(language.desc),
              ),
      onPressed: () {
        Navigator.pop(context, language.index);
      }
    );
  }

  Future<int?> changeLanguage() async {
  return showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(XMIntl.current.pleaseSelectLanguage),
          children: XMLanguage.values.map((e) => option(e)).toList(),
        );
      }
    );
  }

}