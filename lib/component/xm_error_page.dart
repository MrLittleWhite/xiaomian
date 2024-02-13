
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:xiaomian/assets_code/xm_color.dart';
import 'dart:math' as math; 
import 'package:xiaomian/component/xm_error.dart';
import 'package:xiaomian/component/xm_intl.dart';

class XMErrorPage extends StatelessWidget {

  final XMError error;
  final VoidCallback? retry;

  const XMErrorPage({super.key, required this.error, this.retry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, 
              crossAxisAlignment: CrossAxisAlignment.center, 
              children: [
                Transform.rotate(angle: math.pi*1.5,
                child: Transform.flip(flipY: true, child: Icon(Icons.note_outlined, color: XMColor.xmBlue, size: 48,))),
                Flexible(child: Text(error.title, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w900),)),
              ],),
          ),
          const Gap(18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Gap(16),
              Flexible(child: Text(error.message, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 20),)),
              const Gap(16),
            ],
          ),
          const Gap(25),
          SizedBox(
            width: double.infinity,
            child: Center(
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: XMColor.xmOrange, width: 1)),
                child: CupertinoButton(
                  onPressed: retry,
                  child: Text(XMIntl.current.tryAgain, style: TextStyle(color: XMColor.xmOrange, fontSize: 15)),
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}