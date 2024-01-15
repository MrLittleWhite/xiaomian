import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:xiaomian/assets_code/xm_color.dart';
import 'package:xiaomian/assets_code/xm_font_family.dart';
import 'package:xiaomian/component/xm_intl.dart';
import 'package:xiaomian/route/app_route.dart';

enum ProfileItemType {
  playHistory,
  playSetting,
  generalSetting,
  feedBack,
  aboutUs,
}

extension ProfileItemTypeExtension on ProfileItemType {
  String get name {
    switch (this) {
      case ProfileItemType.playHistory:
        return XMIntl.current.playHistory;
      case ProfileItemType.playSetting:
        return XMIntl.current.playSettings;
      case ProfileItemType.feedBack:
        return XMIntl.current.feedback;
      case ProfileItemType.aboutUs:
        return XMIntl.current.aboutUs;
      case ProfileItemType.generalSetting:
        return XMIntl.current.generalSettings;
    }
  }

  IconData get icon {
    switch (this) {
      case ProfileItemType.playHistory:
        return Icons.history;
      case ProfileItemType.playSetting:
        return Icons.play_circle;
      case ProfileItemType.generalSetting:
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
      case ProfileItemType.generalSetting:
        return XMColor.xmBlue;
      case ProfileItemType.feedBack:
      case ProfileItemType.aboutUs:
        return XMColor.xmGreen;
    }
  }

  void navigateAct(BuildContext context) {
    String? name;
    switch (this) {
      case ProfileItemType.playHistory:
        name = AppRoute.playHistory;
        break;
      case ProfileItemType.playSetting:
        name = AppRoute.playSetting;
        break;
      case ProfileItemType.generalSetting:
        name = AppRoute.generalSetting;
        break;
      case ProfileItemType.feedBack:
      //todo
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
    ProfileItemType.generalSetting,
    ProfileItemType.feedBack,
    ProfileItemType.aboutUs,
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: XMColor.xmMain,
      appBar: AppBar(
        backgroundColor: XMColor.xmMain,
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Gap(5),
            Text(XMIntl.current.profile, 
            style: TextStyle(
              color: Colors.white, 
              fontSize: 20, 
              fontWeight: FontWeight.w900),),
          ],
        ), 
        ), 
      body: ListView.separated(
        itemBuilder: (context, index) {
        var item = _items[index];
        Key key = ValueKey(item);
        return ListTile(
          key: key, 
          leading: Container(width: 40, height: 40, decoration: BoxDecoration(color: item.iconColor.withOpacity(0.24), borderRadius: BorderRadius.circular(20)), child: Icon(item.icon, color: item.iconColor,),), 
          title: Text(_items[index].name, style: const TextStyle(color: Colors.white, fontSize: 16)), 
          trailing: const SizedBox(width: 40, height: 40, child: Icon(Icons.keyboard_arrow_right, color: Colors.white,),), 
          onTap: () {
            if(item == ProfileItemType.feedBack) {
              showFeedback(context);
            } else {
              item.navigateAct(context);
            }
          },);
        }, 
        separatorBuilder: (BuildContext context, int index) { 
          var item = _items[index];
          Key key = ValueKey(item);
          if (item == ProfileItemType.playSetting || item == ProfileItemType.generalSetting) {
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

  Future<int?> showFeedback(BuildContext context) async {
    return showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: XMColor.xmBackground,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          children: [
            option(true),
            option(false)
          ],
        );
      }
    );
  }

  SimpleDialogOption option(bool like) {
    return SimpleDialogOption(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 6),
        leading: Icon( like ? Icons.favorite : Icons.edit_document, color: like ? Colors.red : XMColor.xmBlue,), 
        title: Text(like ? XMIntl.current.positiveFeedback : XMIntl.current.questionsSuggestions, style: TextStyle(fontWeight: FontWeight.w700)),
        onTap: () {
          if (like) {
            final inAppReview = InAppReview.instance;
            inAppReview.isAvailable().then((value) {
              if (value) {
                return inAppReview.requestReview();
              }
              Fluttertoast.showToast(msg: XMIntl.current.notSupport);
              return Future(() => null);
            }).catchError((e) {
              Fluttertoast.showToast(msg: "$e");
            });
          } else {
            final url = Uri.encodeFull("mailto:luffy243077002@163.com?subject=${XMIntl.current.sleepGo}: ${XMIntl.current.questionsSuggestions}");
            launchUrlString(url).then((value) => null).catchError((e) {
              Fluttertoast.showToast(msg: "$e", textColor: Colors.red);
            });
          }
          Get.back();
        },),
    );
  }
}