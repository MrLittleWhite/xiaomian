import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:xiaomian/assets_code/xm_color.dart';
import 'package:xiaomian/component/network/xm_net_work.dart';
import 'package:xiaomian/component/xm_intl.dart';
import 'package:xiaomian/firebase_options.dart';
import 'package:xiaomian/gen/fonts.gen.dart';
import 'package:xiaomian/generated/l10n.dart';
import 'package:xiaomian/mine/play_history/play_history_controller.dart';
import 'package:xiaomian/player/audio_player_controller.dart';
import 'package:xiaomian/route/app_route.dart';
import 'package:xiaomian/sleep/sleep_page_controller.dart';

// 重写HttpOverrides
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    var httpClient = super.createHttpClient(context);
    httpClient.findProxy = (uri) {
      return 'PROXY 192.168.0.115:8888';
    };
    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return httpClient;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides(); 
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override 
  void initState() {
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) {
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    }).catchError((e) {
      Logger().d(e);
    });
    XMIntl.locale();
    XMNetwork().initialize();
    Get.put<AudioPlayerController>(AudioPlayerController(), permanent: true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      localeResolutionCallback: (locale, supportedLocales) {
        // 注意：需要返回supportedLocales中的一个实体，不能直接返回local参数实体
        if (locale == null) {
          return supportedLocales.first;
        }
        Locale? loc = supportedLocales.where((element) {
          return element.languageCode == locale.languageCode && element.countryCode == locale.countryCode;
        }).firstOrNull;
        if (loc != null) {
          return loc;
        }
          
        if (locale.languageCode == 'zh') {
          return supportedLocales.where((element) => element.countryCode == 'HK').first;
        } 
        return supportedLocales.first;
      },
      onGenerateTitle: (context) => S.of(context).sleepGo,
      theme: ThemeData(
        fontFamily: FontFamily.nunito,
        fontFamilyFallback: const [FontFamily.xmRound],
        colorScheme: ColorScheme.fromSeed(seedColor: XMColor.xmMain),
        useMaterial3: true,
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }
        ),
      ),
      initialRoute: AppRoute.home, getPages: AppRoute.pages, defaultTransition: Transition.cupertino,
      initialBinding: AllControllerBinding(),
    );
  }
}

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SleepPageController>(() => SleepPageController(), fenix: true);
    Get.lazyPut<PlayHistoryController>(() => PlayHistoryController(), fenix: true);
  } 
}

