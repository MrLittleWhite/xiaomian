import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xiaomian/home/home_page.dart';
import 'package:xiaomian/mine/about_us/about_us_page.dart';
import 'package:xiaomian/mine/general_setting/general_setting_page.dart';
import 'package:xiaomian/mine/mine_page.dart';
import 'package:xiaomian/mine/play_history/play_history_page.dart';
import 'package:xiaomian/mine/play_setting/play_setting_page.dart';
import 'package:xiaomian/mine/play_setting/time_setting_page.dart';
import 'package:xiaomian/player/ui/audio_player_middle_ware.dart';
import 'package:xiaomian/player/ui/audio_player_page.dart';
import 'package:xiaomian/sleep/sleep_page.dart';

class AppRoute {

  static const String home ="/home";
  static const String sleep ="/sleep";
  static const String mine ="/mine";
  static const String playHistory ="/playHistory";
  static const String playSetting ="/playSetting";
  static const String generalSetting ="/generalSetting";
  static const String aboutUs ="/aboutUs";
  static const String timeSetting ="/timeSetting";
  static const String audioPlayer ="/audioPlayer";

  static final pages = [
    GetPage(name: AppRoute.home, page: () => const HomePage()),
    GetPage(name: AppRoute.sleep, page: () => const SleepPage()),
    GetPage(name: AppRoute.mine, page: () => const MinePage()),
    GetPage(name: AppRoute.playHistory, page: () => const PlayHistoryPage()),
    GetPage(name: AppRoute.playSetting, page: () =>  const PlaySettingPage()),
    GetPage(name: AppRoute.generalSetting, page: () =>  const GeneralSettingPage()),
    GetPage(name: AppRoute.aboutUs, page: () => const AboutUsPage()),
    GetPage(name: AppRoute.timeSetting, page: () => const TimeSettingPage()),
    GetPage(name: AppRoute.audioPlayer, page: () => const AudioPlayerPage(), middlewares: [AudioPlayerMiddleWare()]),
    // GetPage(name: "/playSetting", page: () => const SingInPage(), binding: AuthBinding(), children: [
    //   GetPage(name: "/captcha", page: () => const CaptchaPage()),
    // ])
  ];

  static toDialogNamed(String name) {
    if (name == AppRoute.audioPlayer) {
      toDialog(AudioPlayerPage());
    }
  }

  static toDialog(Widget page) {
      Get.generalDialog(
      barrierColor: Colors.transparent,
      transitionDuration: Duration(milliseconds: 200),
      pageBuilder: (context, anim1, anim2) {
        return page;
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      },
    );
  }
}