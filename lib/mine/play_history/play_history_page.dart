import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:xiaomian/assets_code/xm_color.dart';
import 'package:xiaomian/component/xm_appbar.dart';
import 'package:xiaomian/component/xm_error.dart';
import 'package:xiaomian/component/xm_error_page.dart';
import 'package:xiaomian/component/xm_intl.dart';

class PlayHistoryPage extends StatelessWidget {
  const PlayHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: XMAppBar.name(XMIntl.current.playHistory), 
      backgroundColor: XMColor.xmMain,
      // body: Center(child: LoadingAnimationWidget.staggeredDotsWave(color: Colors.white, size: 40)));
      body: XMErrorPage(error: XMError(XMErrorType.empty)));
  }
}