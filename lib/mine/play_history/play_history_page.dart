import 'package:flutter/material.dart';
import 'package:xiaomian/assets_code/xm_color.dart';
import 'package:xiaomian/component/xm_appbar.dart';

class PlayHistoryPage extends StatelessWidget {
  const PlayHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: XMAppBar.name("Play History"), backgroundColor: XMColor.xmMain,);
  }
}