// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `SleepGo`
  String get sleepGo {
    return Intl.message(
      'SleepGo',
      name: 'sleepGo',
      desc: '',
      args: [],
    );
  }

  /// `Sleep`
  String get sleep {
    return Intl.message(
      'Sleep',
      name: 'sleep',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Play History`
  String get playHistory {
    return Intl.message(
      'Play History',
      name: 'playHistory',
      desc: '',
      args: [],
    );
  }

  /// `Play Settings`
  String get playSettings {
    return Intl.message(
      'Play Settings',
      name: 'playSettings',
      desc: '',
      args: [],
    );
  }

  /// `General Settings`
  String get generalSettings {
    return Intl.message(
      'General Settings',
      name: 'generalSettings',
      desc: '',
      args: [],
    );
  }

  /// `Feedback`
  String get feedback {
    return Intl.message(
      'Feedback',
      name: 'feedback',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get aboutUs {
    return Intl.message(
      'About us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Play Period`
  String get playPeriod {
    return Intl.message(
      'Play Period',
      name: 'playPeriod',
      desc: '',
      args: [],
    );
  }

  /// `Auto Play`
  String get autoPlay {
    return Intl.message(
      'Auto Play',
      name: 'autoPlay',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `Terms`
  String get terms {
    return Intl.message(
      'Terms',
      name: 'terms',
      desc: '',
      args: [],
    );
  }

  /// `Privacy`
  String get privacy {
    return Intl.message(
      'Privacy',
      name: 'privacy',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get contact {
    return Intl.message(
      'Contact',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `cancel`
  String get cancel {
    return Intl.message(
      'cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `confirm`
  String get confirm {
    return Intl.message(
      'confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `loading`
  String get loading {
    return Intl.message(
      'loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `language`
  String get language {
    return Intl.message(
      'language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Please select a language`
  String get pleaseSelectLanguage {
    return Intl.message(
      'Please select a language',
      name: 'pleaseSelectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error`
  String get unknownError {
    return Intl.message(
      'Unknown error',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `Please try again later.`
  String get tryLater {
    return Intl.message(
      'Please try again later.',
      name: 'tryLater',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryAgain {
    return Intl.message(
      'Try again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Network error`
  String get netError {
    return Intl.message(
      'Network error',
      name: 'netError',
      desc: '',
      args: [],
    );
  }

  /// `Network error, please check your network connection or try again later.`
  String get netDesc {
    return Intl.message(
      'Network error, please check your network connection or try again later.',
      name: 'netDesc',
      desc: '',
      args: [],
    );
  }

  /// `Network unavailable`
  String get connectError {
    return Intl.message(
      'Network unavailable',
      name: 'connectError',
      desc: '',
      args: [],
    );
  }

  /// `Network unavailable, please check your network connection and try again.`
  String get connectDesc {
    return Intl.message(
      'Network unavailable, please check your network connection and try again.',
      name: 'connectDesc',
      desc: '',
      args: [],
    );
  }

  /// `No relevant data`
  String get noDataError {
    return Intl.message(
      'No relevant data',
      name: 'noDataError',
      desc: '',
      args: [],
    );
  }

  /// `No relevant data found, please try again later.`
  String get noDataDesc {
    return Intl.message(
      'No relevant data found, please try again later.',
      name: 'noDataDesc',
      desc: '',
      args: [],
    );
  }

  /// `Five-star rating`
  String get positiveFeedback {
    return Intl.message(
      'Five-star rating',
      name: 'positiveFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Questions and suggestions`
  String get questionsSuggestions {
    return Intl.message(
      'Questions and suggestions',
      name: 'questionsSuggestions',
      desc: '',
      args: [],
    );
  }

  /// `Temporarily not supported`
  String get notSupport {
    return Intl.message(
      'Temporarily not supported',
      name: 'notSupport',
      desc: '',
      args: [],
    );
  }

  /// `developer`
  String get developer {
    return Intl.message(
      'developer',
      name: 'developer',
      desc: '',
      args: [],
    );
  }

  /// `Contact email has been copied to the clipboard.`
  String get emailContact {
    return Intl.message(
      'Contact email has been copied to the clipboard.',
      name: 'emailContact',
      desc: '',
      args: [],
    );
  }

  /// `Exception occurred`
  String get exceptionOccurred {
    return Intl.message(
      'Exception occurred',
      name: 'exceptionOccurred',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'ko'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'HK'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
