import 'package:flutter/material.dart';
import 'package:xiaomian/assets_code/xm_color.dart';
import 'package:xiaomian/component/xm_appbar.dart';

class PlaySettingPage extends StatelessWidget {
  const PlaySettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: XMAppBar.name("Play Setting"), backgroundColor: XMColor.xmMain,);
  }
}