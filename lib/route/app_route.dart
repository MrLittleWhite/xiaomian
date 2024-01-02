import 'package:get/get.dart';
import 'package:xiaomian/home/home_page.dart';
import 'package:xiaomian/mine/about_us/about_us_page.dart';
import 'package:xiaomian/mine/mine_page.dart';
import 'package:xiaomian/mine/play_history/play_history_page.dart';
import 'package:xiaomian/mine/play_setting/play_setting_page.dart';
import 'package:xiaomian/mine/play_setting/time_setting_page.dart';
import 'package:xiaomian/sleep/sleep_page.dart';

class AppRoute {

  static const String home ="/home";
  static const String sleep ="/sleep";
  static const String mine ="/mine";
  static const String playHistory ="/playHistory";
  static const String playSetting ="/playSetting";
  static const String aboutUs ="/aboutUs";
  static const String timeSetting ="/timeSetting";

  static final pages = [
    GetPage(name: AppRoute.home, page: () => const HomePage()),
    GetPage(name: AppRoute.sleep, page: () => const SleepPage()),
    GetPage(name: AppRoute.mine, page: () => const MinePage()),
    GetPage(name: AppRoute.playHistory, page: () => const PlayHistoryPage()),
    GetPage(name: AppRoute.playSetting, page: () =>  const PlaySettingPage()),
    GetPage(name: AppRoute.aboutUs, page: () => const AboutUsPage()),
    GetPage(name: AppRoute.timeSetting, page: () => const TimeSettingPage()),
    // GetPage(name: "/playSetting", page: () => const SingInPage(), binding: AuthBinding(), children: [
    //   GetPage(name: "/captcha", page: () => const CaptchaPage()),
    // ])
  ];
}