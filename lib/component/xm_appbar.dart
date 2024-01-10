import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xiaomian/assets_code/xm_color.dart';
import 'package:xiaomian/assets_code/xm_font_family.dart';

class XMAppBar {
  static AppBar name(String name) {
    return AppBar(
        backgroundColor: XMColor.xmMain,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left),
          color: Colors.white,
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(name, 
        style: const TextStyle(
          color: Colors.white, 
          fontSize: 20, 
          fontWeight: FontWeight.w900),),
    );
  }
}
