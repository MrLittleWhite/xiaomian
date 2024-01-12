import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:xiaomian/assets_code/xm_color.dart';
import 'package:xiaomian/component/xm_intl.dart';
import 'package:xiaomian/gen/fonts.gen.dart';
import 'package:xiaomian/generated/l10n.dart';
import 'package:xiaomian/player/audio_player_controller.dart';
import 'package:xiaomian/route/app_route.dart';

void main() {
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
    XMIntl.locale();
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
        if (locale?.languageCode == 'zh') {
          if (locale?.countryCode == 'CN') {
            return locale;
          } else {
            return const Locale('zh', 'HK');
          }
        } else {
          return locale;
        }
      },
      // locale: loc,
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
    Get.lazyPut<AudioPlayerController>(() => AudioPlayerController());
  } 
}

