import 'package:get/get.dart';
import 'package:xiaomian/home/home_page.dart';
import 'package:xiaomian/mine/about_us/about_us_page.dart';
import 'package:xiaomian/mine/mine_page.dart';
import 'package:xiaomian/mine/play_history/play_history_page.dart';
import 'package:xiaomian/mine/play_setting/play_setting_page.dart';
import 'package:xiaomian/mine/play_setting/time_setting_page.dart';
import 'package:xiaomian/sleep/sleep_page.dart';

class AppRoute {
  static final pages = [
    GetPage(name: "/home", page: () => const HomePage()),
    GetPage(name: "/sleep", page: () => const SleepPage()),
    GetPage(name: "/mine", page: () => const MinePage()),
    GetPage(name: "/playHistory", page: () => const PlayHistoryPage()),
    GetPage(name: "/playSetting", page: () =>  const PlaySettingPage()),
    GetPage(name: "/aboutUs", page: () => const AboutUsPage()),
    GetPage(name: "/timeSetting", page: () => const TimeSettingPage()),
    // GetPage(name: "/playSetting", page: () => const SingInPage(), binding: AuthBinding(), children: [
    //   GetPage(name: "/captcha", page: () => const CaptchaPage()),
    // ])
  ];
}