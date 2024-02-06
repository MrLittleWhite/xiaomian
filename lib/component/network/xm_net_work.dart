import 'dart:async';
import 'dart:io';
import 'package:app_settings/app_settings.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:network_authority/network_authority.dart';
import 'package:network_authority/network_authority_status.dart';
import 'package:xiaomian/component/xm_dialog.dart';
import 'package:xiaomian/component/xm_intl.dart';

class XMNetwork {
  ConnectivityResult _result = ConnectivityResult.none;
  NetworkAuthorityStatus _authority = NetworkAuthorityStatus.checking;

  final _connect = Connectivity();
  final _networkAuthority = NetworkAuthority();

  late StreamSubscription _statusSubscription;
  late StreamSubscription _authoritySubscription;
  
  bool _showedDialog = false;

  ConnectivityResult get status {
    return _result;
  }

  bool get available {
    return status != ConnectivityResult.none;
  }

  bool get authorized {
    return authority != NetworkAuthorityStatus.denied;
  }

  StreamSubscription get statusSubscription {
    return _statusSubscription;
  }

  NetworkAuthorityStatus get authority {
    if (Platform.isAndroid) {
      return NetworkAuthorityStatus.authorized;
    }
    return _authority;
  }

  StreamSubscription get authoritySubscription {
    if (Platform.isAndroid) {
      return const Stream.empty().listen((event) { });
    }
    return _authoritySubscription;
  }

  void initialize() {
    if (Platform.isAndroid) {
      return;
    }
    _connect.checkConnectivity().then((value) {
      _result = value;
    }).catchError((e) {
      //todo: upload error
    });
    _statusSubscription = _connect.onConnectivityChanged.listen((ConnectivityResult r) {
      _result = r;
    });

    _networkAuthority.startListening().catchError((e) {
      //todo: upload error
    });
    _networkAuthority.getStatus().then((value) {
      _authority = value;
    }).catchError((e) {
      //todo: upload error
    });
    _authoritySubscription = _networkAuthority.onStatusChanged.listen((NetworkAuthorityStatus s) {
      _authority = s;
      if (s == NetworkAuthorityStatus.denied) {
        showNetAuthorityErrorDialog();
      } else {
        if (_showedDialog) {
          Get.back(result: 0);
          _showedDialog = false;
        }
      }
    });
  }

  void showNetAuthorityErrorDialog() {
    if (_showedDialog) {
      return;
    }
    _showedDialog = true;
    XMDialog.show(title: XMIntl.current.netError, content: XMIntl.current.authorityDenied, buttonText: XMIntl.current.enableAuthority, onPressed: () {
      AppSettings.openAppSettings();
    });
  }

  XMNetwork._internal();

  static final XMNetwork _instance = XMNetwork._internal();

  factory XMNetwork() => _instance;
}