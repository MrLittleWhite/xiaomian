
import 'dart:io';
import 'package:flutter/services.dart';

class XMSystemChrome {

  static setUIEdgeToEdge(Color color) {
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
          systemNavigationBarColor: color); 
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
  }
  
}