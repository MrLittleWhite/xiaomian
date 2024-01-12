
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xiaomian/assets_code/xm_color.dart';
import 'package:xiaomian/assets_code/xm_icons.dart';
import 'package:xiaomian/component/xm_error.dart';
import 'package:xiaomian/component/xm_intl.dart';

class XMErrorPage extends StatelessWidget {

  final XMError error;
  final VoidCallback? retry;

  const XMErrorPage({super.key, required this.error, this.retry});

  @override
  Widget build(BuildContext context) {
    return Container(color: XMColor.xmMain, child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center, 
          crossAxisAlignment: CrossAxisAlignment.center, 
          mainAxisSize: MainAxisSize.min, 
          children: [
            const Icon(XMIconfont.note),
            Text(error.title, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),),
          ],),
        Text(error.message, style: TextStyle(color: Colors.white, fontSize: 16),),
        Stack(
          children: [
            Positioned(
              left: 8, top: 10, right: 8, bottom: 10,
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: XMColor.xmOrange, width: 1)),
              ),
            ),
            CupertinoButton(
            child: Text(XMIntl.current.tryAgain, style: TextStyle(color: XMColor.xmOrange, fontSize: 16)), 
            onPressed: retry,
            ),
          ]
        ),
      ],
    ),);
  }
}