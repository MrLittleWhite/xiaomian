import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:xiaomian/assets_code/xm_color.dart';
import 'package:xiaomian/component/UI/cover_list_tile.dart';
import 'package:xiaomian/component/UI/page_state.dart';
import 'package:xiaomian/component/xm_appbar.dart';
import 'package:xiaomian/component/xm_error.dart';
import 'package:xiaomian/component/xm_error_page.dart';
import 'package:xiaomian/component/xm_intl.dart';
import 'package:xiaomian/component/xm_loading.dart';
import 'package:xiaomian/mine/play_history/play_history_controller.dart';
import 'package:xiaomian/mine/play_history/play_history_repository.dart';
import 'package:xiaomian/player/audio_player_controller.dart';

class PlayHistoryPage extends GetView<PlayHistoryController>  {
  const PlayHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: XMAppBar.name(XMIntl.current.playHistory), 
      backgroundColor: XMColor.xmMain,
      body: Obx(() {
        switch (PageState.values[controller.state.value]) {
          case PageState.idle:
          case PageState.loading:
          return xmLoading();
          case PageState.error:
          return XMErrorPage(
                  error: 
                  XMError(XMErrorType.custom, 
                    customTitle: XMIntl.current.noDataError, 
                    customMessage: "${controller.error}"), 
                  retry: () {
            controller.fetch();
          });
          case PageState.empty:
          return XMErrorPage(error: const XMError(XMErrorType.empty), retry: () {
            controller.fetch();
          },);
          case PageState.success:
          return ListView.builder(itemCount: controller.items.length, itemBuilder: (context, index) {
            final data = controller.items[index];
            return CoverListTile(key: ValueKey(data), data: data, onTap: (item) {
              
            }, editSelected: (selected) {
              
            },);
          });
        }
      })
    );
    
  }
}
