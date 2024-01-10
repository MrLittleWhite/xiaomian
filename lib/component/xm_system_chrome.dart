
import 'dart:io';
import 'package:flutter/services.dart';

class XMSystemChrome {

  static const bool _hasSet = false;
  static setUIEdgeToEdge(Color color) {
    if ( _hasSet == false && Platform.isAndroid) {
       _hasSet == true;
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
          systemNavigationBarColor: color); 
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
  }
  
}