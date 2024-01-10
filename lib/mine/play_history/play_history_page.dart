import 'package:flutter/material.dart';
import 'package:xiaomian/assets_code/xm_color.dart';
import 'package:xiaomian/component/xm_appbar.dart';
import 'package:xiaomian/component/xm_intl.dart';

class PlayHistoryPage extends StatelessWidget {
  const PlayHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: XMAppBar.name(XMIntl.current.playHistory), backgroundColor: XMColor.xmMain,);
  }
}