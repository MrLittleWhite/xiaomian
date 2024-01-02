import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:xiaomian/assets_code/xm_color.dart';
import 'package:xiaomian/assets_code/xm_font_family.dart';

enum ProfileItemType {
  playHistory,
  playSetting,
  feedBack,
  aboutUs,
}

extension ProfileItemTypeExtension on ProfileItemType {
  String get name {
    switch (this) {
      case ProfileItemType.playHistory:
        return 'Play History';
      case ProfileItemType.playSetting:
        return 'Play Setting';
      case ProfileItemType.feedBack:
        return 'feedback';
      case ProfileItemType.aboutUs:
        return 'About Us';
    }
  }

  IconData get icon {
    switch (this) {
      case ProfileItemType.playHistory:
        return Icons.history;
      case ProfileItemType.playSetting:
        return Icons.settings;
      case ProfileItemType.feedBack:
        return Icons.feedback;
      case ProfileItemType.aboutUs:
        return Icons.info;
    }
  }

  Color get iconColor {
    switch (this) {
      case ProfileItemType.playHistory:
      case ProfileItemType.playSetting:
        return XMColor.xmOrange;
      case ProfileItemType.feedBack:
      case ProfileItemType.aboutUs:
        return XMColor.xmGreen;
    }
  }

  void navigateAct() {
    String? name;
    switch (this) {
      case ProfileItemType.playHistory:
        name = '/playHistory';
        break;
      case ProfileItemType.playSetting:
        name = '/playSetting';
        break;
      case ProfileItemType.feedBack:
        // todo
        break;
      case ProfileItemType.aboutUs:
        name = '/aboutUs';
        break;
    }
    if (name != null) {
      Get.toNamed(name);
    }
  }
}

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {

  final List<ProfileItemType> _items = [
    ProfileItemType.playHistory,
    ProfileItemType.playSetting,
    ProfileItemType.feedBack,
    ProfileItemType.aboutUs,
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: XMColor.xmMain,
      appBar: AppBar(
        backgroundColor: XMColor.xmMain,
        title: const Text('Profile', 
        style: XMTextStyle(
          color: Colors.white, 
          fontSize: 20, 
          fontWeight: FontWeight.w900),), 
        ), 
      body: ListView.separated(
        itemBuilder: (context, index) {
        var item = _items[index];
        Key key = ValueKey(item);
        return ListTile(
          key: key, 
          leading: Container(width: 40, height: 40, decoration: BoxDecoration(color: item.iconColor.withOpacity(0.24), borderRadius: BorderRadius.circular(20)), child: Icon(item.icon, color: item.iconColor,),), 
          title: Text(_items[index].name, style: const XMTextStyle(color: Colors.white, fontSize: 16)), 
          trailing: const SizedBox(width: 40, height: 40, child: Icon(Icons.keyboard_arrow_right, color: Colors.white,),), 
          onTap: () {
            item.navigateAct();
          },);
        }, 
        separatorBuilder: (BuildContext context, int index) { 
          var item = _items[index];
          Key key = ValueKey(item);
          if (item == ProfileItemType.playSetting) {
            return SizedBox(key: key, height: 23.5, child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 72),
                  child: Gap.expand(1, color: XMColor.xmSeparator),
                ),
              ],
            )); 
          }
          return Padding(
            key: key,
            padding: const EdgeInsets.only(left: 72),
            child: Gap(1, color: XMColor.xmSeparator,),
          );
        }, 
        itemCount: _items.length,
        ),
      );
  }
}