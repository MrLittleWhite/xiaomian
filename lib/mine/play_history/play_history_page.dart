import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:logger/logger.dart';
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
  //save_outlined/logout_rounded //fact_check_outlined
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: XMAppBar.name(XMIntl.current.playHistory, actions: [
      Obx((){
        return Visibility(
          visible: controller.items.isNotEmpty,
          child: IconButton(
            onPressed: () {
              controller.editEnable.value = !controller.editEnable.value;
              controller.update();
            }, icon: controller.editEnable.value ? const Icon(Icons.logout_rounded, color: Colors.white,) : const Icon(Icons.checklist_rounded, color: Colors.white,)
          ),
        );
      }) 
    ]), 
      backgroundColor: XMColor.xmMain,
      body: ListenableBuilder(listenable: controller.state, builder: (context, child) {
        switch (controller.state.value) {
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
          return GetBuilder<PlayHistoryController>(
            builder: (controller) {
              return ClipRect(
                child: SlidableAutoCloseBehavior(
                  child: ListView.builder(itemCount: controller.items.length, itemBuilder: (context, index) {
                    final data = controller.items[index];
                    return Slidable(
                      key: ValueKey(data),
                      enabled: !controller.editEnable.value,
                      endActionPane: ActionPane(
                        motion: const DrawerMotion(), 
                        extentRatio: 0.25,
                        dragDismissible: false,
                        dismissible: DismissiblePane(confirmDismiss: () {
                          return Future(() => true);
                        },
                        onDismissed: () {
                
                        }),
                        children: [
                          _buildAction(),
                
                          // SlidableAction(onPressed: (context) {
                          //     // Slidable.of(context)?.close();
                          //     final controller = Slidable.of(context);
                          //     controller?.dismiss(
                          //       ResizeRequest(const Duration(milliseconds: 200), () => {}),
                          //       duration: const Duration(milliseconds: 200),
                          //     );
                
                          //     // controller.delete([data]);
                          //   }, 
                          //   autoClose: false,
                          //   foregroundColor: Colors.white, 
                          //   backgroundColor: XMColor.xmRed,
                          //   icon: Icons.delete_rounded,
                          //   label: XMIntl.current.delete,
                          // )
                        ]),
                  
                      child: CoverListTile(data: data, onTap: (item) {
                        
                      }, editEnable: controller.editEnable.value, editSelected: (selected) {
                        
                      }),
                    );
                  }),
                ),
              );
            }
          );
        }
      },)
      
    );
    
  }

  Widget _buildAction() {
    return Expanded(
      child: Builder(builder: (context) {
        if (controller.editEnable.value) {
          final slidableController = Slidable.of(context);
          slidableController?.close().catchError((e) {
            Logger().d(e);
          });
        }
        return InkWell(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: XMColor.xmRed,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  Gap(4),
                  Text(XMIntl.current.delete, style: TextStyle(color: Colors.white),)
                ],
              ),
            ),
          ),
          onTap: () {
            final slidableController = Slidable.of(context);
            if (slidableController == null) {
              return;
            }
            slidableController.dismiss(
              ResizeRequest(const Duration(milliseconds: 200), () => {}),
              duration: const Duration(milliseconds: 200),
            );
          },
        );
        },
      ),
    );
  }
}
