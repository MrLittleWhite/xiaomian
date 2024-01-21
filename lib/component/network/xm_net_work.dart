import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:network_authority/network_authority.dart';
import 'package:network_authority/network_authority_status.dart';

class XMNetwork {
  ConnectivityResult _result = ConnectivityResult.none;
  NetworkAuthorityStatus _authority = NetworkAuthorityStatus.checking;

  final _connect = Connectivity();
  final _networkAuthority = NetworkAuthority();

  late StreamSubscription _statusSubscription;
  late StreamSubscription _authoritySubscription;

  ConnectivityResult get status {
    return _result;
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
    _networkAuthority.getStatus().then((value) => _authority = value).catchError((e) {
      //todo: upload error
    });
    _authoritySubscription = _networkAuthority.onStatusChanged.listen((NetworkAuthorityStatus s) {
      _authority = s;
    });

  }

  XMNetwork._internal();

  static final XMNetwork _instance = XMNetwork._internal();

  factory XMNetwork() => _instance;
}