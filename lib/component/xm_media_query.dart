
import 'dart:io';

import 'package:flutter/material.dart';

class XMMediaQuery {
  static double xmBottom(BuildContext context) {
    return Platform.isAndroid ? 0 : MediaQuery.of(context).padding.bottom;
    // return MediaQuery.of(context).padding.bottom;
  }
}