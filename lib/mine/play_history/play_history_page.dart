import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:xiaomian/assets_code/xm_color.dart';
import 'package:xiaomian/component/UI/cover_list_tile.dart';
import 'package:xiaomian/component/UI/page_state.dart';
import 'package:xiaomian/component/xm_appbar.dart';
import 'package:xiaomian/component/xm_error.dart';
import 'package:xiaomian/component/xm_error_page.dart';
import 'package:xiaomian/component/xm_intl.dart';
import 'package:xiaomian/component/xm_loading.dart';
import 'package:xiaomian/component/xm_media_query.dart';
import 'package:xiaomian/mine/play_history/play_history_controller.dart';
import 'package:xiaomian/model/audio_item.dart';
import 'package:xiaomian/player/audio_player_controller.dart';

class PlayHistoryPage extends StatefulWidget  {
  const PlayHistoryPage({super.key});

  @override
  State<PlayHistoryPage> createState() => _PlayHistoryPageState();
}

class _PlayHistoryPageState extends State<PlayHistoryPage> {

  final controller = Get.find<PlayHistoryController>();
  final playController = Get.find<AudioPlayerController>();

  final GlobalKey<SliverAnimatedListState> _listKey = GlobalKey<SliverAnimatedListState>();

  int _scrollableKey = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: XMAppBar.name(XMIntl.current.playHistory, actions: [
      Obx((){
        return Visibility(
          visible: controller.items.isNotEmpty,
          child: IconButton(
            onPressed: () {
              controller.editEnable.value = !controller.editEnable.value;
              controller.checks.clear();
              _scrollableKey += 1;
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
              return ClipRRect(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [SlidableAutoCloseBehavior(
                    child: RawScrollbar(
                      padding: const EdgeInsets.only(right: 4),
                      thumbColor: Colors.white.withOpacity(0.3),
                      thickness: 2,
                      interactive: true,
                      child: CustomScrollView(
                        slivers: [SliverAnimatedList( 
                          key: _listKey,
                          initialItemCount: controller.items.length, 
                          itemBuilder: (context, index, Animation<double> animation) {
                          final data = controller.items[index];
                          return _buildItem(index, data, animation);
                        }),
                        SliverToBoxAdapter(child: SizedBox(height: controller.editEnable.value ? 60+XMMediaQuery.xmBottom(context) : XMMediaQuery.xmBottom(context),),)
                        ]
                      ),
                    ),
                  
                  ),
                  _buildBottomBar(context)
                  ]
                ),
              );
            }
          );
        }
      },)
      
    );
    
  }

  Widget _buildItem(int index, AudioItem data, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Slidable(
        key: ValueKey("${data.aId}$_scrollableKey"),
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
            _buildAction(data, index),
          ]),
        
        child: ValueListenableBuilder(
          builder: (context, value, child) {
            return CoverListTile(data: data, onTap: (item) {
              
            }, 
            playing: playController.playItem?.aId == data.aId ? value : null,
            checkEnable: controller.editEnable.value, 
            check: controller.checks[data.id] != null, 
            checkTap: (selected) {
              if (selected) {
                controller.checks[data.id] = index;
              } else {
                controller.checks.remove(data.id);
              }
            });
          }, valueListenable: playController.playingChangeNotifier,
        ),
      ),
    );
  }

  void _remove(int index, AudioItem data) {
    if (_listKey.currentState == null) {
      return;
    }
    _listKey.currentState?.removeItem(index, (context, animation) {
      return _buildItem(index, data, animation);
    });

  }

  Widget _buildBottomBar(BuildContext context) {
    final bottom = XMMediaQuery.xmBottom(context);
    return Obx(() => Visibility(
      visible: controller.editEnable.value,
      child: BlurryContainer(
        padding: EdgeInsets.fromLTRB(0, 0, 0, bottom),
        borderRadius: BorderRadius.zero,
        blur: 10, elevation: 5, height: 60+bottom, width: double.infinity,
        color: const XMColor(0x141927, opacity: 0.76),
        child: DecoratedBox(
          decoration: BoxDecoration(border: Border(top: BorderSide(width: 0.2, color: Colors.white.withOpacity(0.5)))),
          child: 
          Row(children: [
          Expanded(child: LayoutBuilder(
            builder: (context, constraints) {
              return SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)))),
                  onPressed: () {
                    final indexs = controller.checks.values.toList();
                    final items = { for (var index in indexs) index: controller.items[index] };
                    final ids = controller.checks.keys.toList();
                    controller.deleteIds(ids).then((value){
                      controller.editEnable.value = false;
                      controller.checks.clear();
                      for (var index in indexs.reversed) {
                        _remove(index, items[index]!);
                      }
                      if (controller.items.isEmpty) {
                        controller.state.value = PageState.empty;
                      }
                      _scrollableKey += 1;
                      controller.update();
                    }).catchError((e) {
                      //upload error
                    });
                  }, 
                  child: Obx(() => Text(XMIntl.current.delete, style: TextStyle(color: Colors.white.withOpacity(controller.checks.isEmpty ? 0.2 : 1)),)),
              ));
            }
          )), 
          Container(color: Colors.white.withOpacity(0.2), width: 1,), 
          Expanded(child: LayoutBuilder(
            builder: (context, constraints) {
              return SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)))), 
                  onPressed: () {
                    if (controller.items.length == controller.checks.length) {
                      controller.checks.clear();
                    } else {
                      for(int i = 0; i < controller.items.length; i++) {
                        controller.checks[controller.items[i].id] = i;
                      }       
                    }
                    _scrollableKey += 1;
                    controller.update();
                  }, 
                  child: Obx(() => Text(controller.items.length == controller.checks.length ? XMIntl.current.deselectAll : XMIntl.current.selectAll, style: const TextStyle(color: Colors.white),)),
              ));
            }
          ))]),
        ),
      ),
    ));
  }

  Widget _buildAction(AudioItem data, int index) {
    return Expanded(
      child: Builder(builder: (context) {
        if (controller.editEnable.value) {
          final slidableController = Slidable.of(context);
          slidableController?.close().catchError((e) {
            Logger().d(e);
          });
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: GestureDetector(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: XMColor.xmRed,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  const Gap(4),
                  Text(XMIntl.current.delete, style: const TextStyle(color: Colors.white),)
                ],
              ),
            ),
            onTap: () {
              final slidableController = Slidable.of(context);
              if (slidableController == null) {
                return;
              }
              controller.deleteIds([data.id]).then((value) {
                return slidableController.dismiss(
                  ResizeRequest(const Duration(milliseconds: 200), () => {}),
                  duration: const Duration(milliseconds: 200),
                );
              }).then((value) {
                _remove(index, data);
                if (controller.items.isEmpty) {
                  controller.state.value = PageState.empty;
                }
                return null;
              }).catchError((e) {
                //upload error
              });
            },
          ),
        );
        },
      ),
    );
  }
}

