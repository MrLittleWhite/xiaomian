import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:xiaomian/assets_code/xm_color.dart';
import 'package:xiaomian/assets_code/xm_font_family.dart';
import 'package:xiaomian/component/web/web_page.dart';
import 'package:xiaomian/component/xm_appbar.dart';
import 'package:xiaomian/component/xm_intl.dart';
import 'package:xiaomian/component/xm_toast.dart';
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
        return XMIntl.current.version;
      case AboutUsItemType.terms:
        return XMIntl.current.terms;
      case AboutUsItemType.privacy:
        return XMIntl.current.privacy;
      case AboutUsItemType.contact:
        return XMIntl.current.contact;
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
        Get.to(WebPage(title: XMIntl.current.terms, url: "https://www.bilibili.com/"));
        break;
      case AboutUsItemType.privacy:
        Get.to(WebPage(title: XMIntl.current.privacy, url: "https://www.baidu.com"));
        break;
      case AboutUsItemType.contact:
        final url = Uri.encodeFull("mailto:luffy243077002@163.com?subject=${XMIntl.current.sleepGo}: ${XMIntl.current.questionsSuggestions}");
        launchUrlString(url).then((value) => null).catchError((e) {
          Clipboard.setData(const ClipboardData(text: "luffy243077002@163.com"));
          XMToast.show(XMIntl.current.emailContact);
        });
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
      appBar: XMAppBar.name(XMIntl.current.aboutUs), 
      backgroundColor: XMColor.xmMain,
      body: Center(
        child: Column(
          children: [
            Flexible(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(borderRadius: BorderRadius.circular(16), 
                      child: Image.asset(Assets.iconImage.appIcon, width: 100, height: 100,)),
                    const Gap(16),
                    Text(XMIntl.current.sleepGo, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),),
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
                          title = XMIntl.current.version;
                          detail = '${packageInfo.version}.${packageInfo.buildNumber}';
                          // String version = packageInfo.version;
                          // String buildNumber = packageInfo.buildNumber;
                        } else {
                          icon = LoadingAnimationWidget.threeRotatingDots(color: Colors.white, size: 40);
                          title = "${XMIntl.current.loading}...";
                          detail = "";
                        }

                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                          if (index == 0) {
                            return ListTile(
                            leading: SizedBox(width: 40, height: 40, child: icon,), 
                            title: Text(title, style: TextStyle(color: color ?? Colors.white, fontSize: 16)), 
                            trailing: detail != null ? Text(detail, style: TextStyle(color: color ?? Colors.white, fontSize: 14)) : const SizedBox(width: 40, height: 40, child: Icon(Icons.keyboard_arrow_right, color: Colors.white,),), 
                            );
                          }
                          var item = _items[index];
                          return ListTile(
                            key: ValueKey(item), 
                            leading: SizedBox(width: 40, height: 40, child: Icon(item.icon, color: item.iconColor,),), 
                            title: Text(_items[index].name, style: const TextStyle(color: Colors.white, fontSize: 16)), 
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