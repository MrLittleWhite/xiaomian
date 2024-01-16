import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:xiaomian/assets_code/xm_color.dart';
import 'package:xiaomian/component/xm_appbar.dart';
import 'package:xiaomian/component/xm_error.dart';
import 'package:xiaomian/component/xm_error_page.dart';
import 'package:xiaomian/component/xm_intl.dart';
import 'package:xiaomian/component/xm_loading.dart';
import 'package:xiaomian/mine/play_history/play_history_repository.dart';

class PlayHistoryPage extends StatefulWidget {
  const PlayHistoryPage({super.key});

  @override
  State<PlayHistoryPage> createState() => _PlayHistoryPageState();
}

class _PlayHistoryPageState extends State<PlayHistoryPage> {

  final repository = PlayHistoryRepository();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(appBar: XMAppBar.name(XMIntl.current.playHistory), 
      backgroundColor: XMColor.xmMain,
      body: FutureBuilder(future: repository.getAll(), builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return xmLoading();
        } else if (snapshot.data == null || snapshot.data!.isEmpty) {
          return XMErrorPage(error: const XMError(XMErrorType.empty), retry: () {
            setState(() {
              
            });
          },);
        } else if (snapshot.error != null) {
          return XMErrorPage(
                  error: 
                  XMError(XMErrorType.custom, 
                    customTitle: XMIntl.current.noDataError, 
                    customMessage: "${snapshot.error}"), 
                  retry: () {
            setState(() {
              
            });
          });
        } else {
          return ListView.builder(itemCount: snapshot.data!.length, itemBuilder: (context, index) {
            return Text(snapshot.data![index].toString());
          });
        }
      },));
    
  }
}