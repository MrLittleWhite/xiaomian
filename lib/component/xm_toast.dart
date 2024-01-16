import 'package:fluttertoast/fluttertoast.dart';
import 'package:xiaomian/assets_code/xm_color.dart';

class XMToast {
  static void show(String message) {
    Fluttertoast.showToast(
      msg: message, 
      backgroundColor: XMColor.xmBackground, 
      textColor: XMColor.xmMain, 
      gravity: ToastGravity.CENTER
    );
  }
}