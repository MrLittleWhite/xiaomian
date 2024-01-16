import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class XMNetwork {
  ConnectivityResult _result = ConnectivityResult.none;

  final _connect = Connectivity();

  late StreamSubscription _subscription;

  ConnectivityResult get status {
    return _result;
  }

  StreamSubscription get subscription {
    return _subscription;
  }

  void initialize() {
    _connect.checkConnectivity().then((value) {
      _result = value;
    }).catchError((e) {
      
    });
    _subscription = _connect.onConnectivityChanged.listen((ConnectivityResult r) {
      _result = r;
    });
  }

  XMNetwork._internal();

  static final XMNetwork _instance = XMNetwork._internal();

  factory XMNetwork() => _instance;
}