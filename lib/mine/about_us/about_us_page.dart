import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:xiaomian/assets_code/xm_color.dart';
import 'package:xiaomian/assets_code/xm_font_family.dart';
import 'package:xiaomian/component/xm_appbar.dart';
import 'package:xiaomian/gen/assets.gen.dart';

enum AboutUsItemType {
  version,
  terms,
  privacy,
  contact,
}

extension AboutUsItemTypeExtension on AboutUsItemType {
  String get name {
    switch (this) {
      case AboutUsItemType.version:
        return 'version';
      case AboutUsItemType.terms:
        return 'terms';
      case AboutUsItemType.privacy:
        return 'privacy';
      case AboutUsItemType.contact:
        return 'contact';
    }
  }

  IconData get icon {
    switch (this) {
      case AboutUsItemType.version:
        return Icons.bookmark;
      case AboutUsItemType.terms:
        return Icons.list;
      case AboutUsItemType.privacy:
        return Icons.privacy_tip;
      case AboutUsItemType.contact:
        return Icons.contact_mail;
    }
  }

  Color? get iconColor {
    switch (this) {
      case AboutUsItemType.version:
      case AboutUsItemType.terms:
      case AboutUsItemType.privacy:
      case AboutUsItemType.contact:
        return Colors.white;
    }
  }

  void navigateAct() {
    String? name;
    switch (this) {
      case AboutUsItemType.version:
        //todo
        break;
      case AboutUsItemType.terms:
        //todo
        break;
      case AboutUsItemType.privacy:
        //todo
        break;
      case AboutUsItemType.contact:
        // todo
        break;
    }
    if (name != null) {
      Get.toNamed(name);
    }
  }
}

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {

  final List<AboutUsItemType> _items = [
    AboutUsItemType.version,
    AboutUsItemType.terms,
    AboutUsItemType.privacy,
    AboutUsItemType.contact,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: XMAppBar.name("About Us"), 
      backgroundColor: XMColor.xmMain,
      body: Center(
        child: Column(
          children: [
            Flexible(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(borderRadius: BorderRadius.circular(16), 
                      child: SvgPicture.asset(Assets.iconImage.appIcon, width: 100, height: 100,)),
                    const Gap(16),
                    const Text("SleepGo", style: XMTextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),),
                  ]
                ),
            ),
            Flexible(
              child: FutureBuilder<PackageInfo>(
                      future: PackageInfo.fromPlatform(),
                      builder: (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
                        final Widget icon;
                        final String title;
                        Color? color;
                        String? detail;
                        if (snapshot.hasError) {
                          color = Colors.red;
                          icon = Icon(Icons.warning, color: color);
                          title = snapshot.error.toString();
                        } else if (snapshot.data != null) {
                          PackageInfo packageInfo = snapshot.data!;
                          icon = const Icon(Icons.bookmark, color: Colors.white,);
                          title = "version";
                          detail = '${packageInfo.version}.${packageInfo.buildNumber}';
                          // String version = packageInfo.version;
                          // String buildNumber = packageInfo.buildNumber;
                        } else {
                          icon = LoadingAnimationWidget.threeRotatingDots(color: Colors.white, size: 40);
                          title = "loading version...";
                          detail = "";
                        }

                        return ListView.separated(itemBuilder: (context, index) {
                          if (index == 0) {
                            return ListTile(
                            leading: SizedBox(width: 40, height: 40, child: icon,), 
                            title: Text(title, style: XMTextStyle(color: color ?? Colors.white, fontSize: 16)), 
                            trailing: detail != null ? Text(detail, style: XMTextStyle(color: color ?? Colors.white, fontSize: 14)) : const SizedBox(width: 40, height: 40, child: Icon(Icons.keyboard_arrow_right, color: Colors.white,),), 
                            );
                          }
                          var item = _items[index];
                          return ListTile(
                            key: ValueKey(item), 
                            leading: SizedBox(width: 40, height: 40, child: Icon(item.icon, color: item.iconColor,),), 
                            title: Text(_items[index].name, style: const XMTextStyle(color: Colors.white, fontSize: 16)), 
                            trailing: const SizedBox(width: 40, height: 40, child: Icon(Icons.keyboard_arrow_right, color: Colors.white,),), 
                            onTap: () {
                              item.navigateAct();
                            },);
                        }, separatorBuilder: (context, index) {
                          var item = _items[index];
                          Key key = ValueKey(item);
                          return Padding(
                            key: key,
                            padding: const EdgeInsets.only(left: 72),
                            child: Gap(1, color: XMColor.xmSeparator,),
                          );
                        }, itemCount: _items.length,);
                      },
                    )
            )
          ],
        ),
      ),);
  }
}