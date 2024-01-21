
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xiaomian/assets_code/xm_color.dart';

class XMDialog {
  static Future<void> show ({String? title, String? content, String? buttonText, VoidCallback? onPressed}) {
  return showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: XMColor.xmBackground,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: title != null ? Text(title) : null,
          content: content != null? Text(content, style: const TextStyle(fontSize: 16),) : null,
          actions: buttonText != null ? [
            TextButton(
              onPressed: onPressed,
              child: Text(buttonText, style: const TextStyle(fontSize: 16),),
            )
          ] : null,
          actionsAlignment: MainAxisAlignment.center,
        );
      },
    );
  }
  
}