import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:xiaomian/assets_code/xm_color.dart';
import 'package:xiaomian/assets_code/xm_font_family.dart';
import 'package:xiaomian/component/xm_intl.dart';
import 'package:xiaomian/component/xm_loading.dart';
import 'package:xiaomian/component/xm_shared_preferences.dart';
import 'package:xiaomian/model/audio_item.dart';
import 'package:xiaomian/player/audio_player_controller.dart';
import 'package:xiaomian/route/app_route.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:xiaomian/sleep/sleep_page_controller.dart';

class SleepPage extends StatefulWidget {
  const SleepPage({super.key});

  @override
  State<SleepPage> createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {

  final AudioPlayerController playerController = Get.find();
  final SleepPageController sleepController = Get.find();

  late EasyRefreshController _controller;

  

  @override
  void initState() {
    _controller = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: XMColor.xmMain,
      appBar: AppBar(
        backgroundColor: XMColor.xmMain,
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Gap(5),
            Text(XMIntl.current.sleep, 
            style: TextStyle(
              color: Colors.white, 
              fontSize: 20, 
              fontWeight: FontWeight.w900),),
          ],
        ), 
        actions: [IconButton(onPressed: () {
          sleepController.changeDisplayList();
        }, icon: _buildIcon())],
        ), 
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: EasyRefresh(
          controller: _controller,
          header: ClassicHeader(
            position: IndicatorPosition.locator,
            safeArea: false,
            showMessage: false,
            textStyle: TextStyle(color: Colors.white), 
            messageStyle: TextStyle(color: Colors.white),
            iconTheme: IconThemeData(color: Colors.white)
          ),
          footer: ClassicFooter(
            position: IndicatorPosition.locator,
            safeArea: false,
            showMessage: false,
            textStyle: TextStyle(color: Colors.white), 
            messageStyle: TextStyle(color: Colors.white),
            iconTheme: IconThemeData(color: Colors.white)),
          onRefresh: () async {
            sleepController.getItems().catchError((e) {
              
            }).whenComplete(() {
              _controller.finishRefresh();
              _controller.resetFooter();
            });
          },
        
          onLoad: () async {
            sleepController.getMore().catchError((e) {
              
            }).whenComplete(() {
              _controller.finishLoad(IndicatorResult.noMore);
            });
          },
          child: _buildContent(),
        ),
      ),
    );
  }

  FutureBuilder<void> _buildContent() {
    return FutureBuilder(
      future: Future.wait([sleepController.getItems(), sleepController.getDisplayList()]),
      builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return xmLoading();
          } 
          return _buildScrollContent();
        },);
  }

  CustomScrollView _buildScrollContent() {
    return CustomScrollView(
          slivers: [
            const HeaderLocator.sliver(),
            Obx(() {
              if (sleepController.displayList.value) {
                return _buildList();
              } else {
                return _buildGrid();
              }
            }),
            const FooterLocator.sliver(),
            SliverToBoxAdapter(child: SizedBox(height: 75),)
          ],
        );
  }

  FutureBuilder<bool?> _buildIcon() {
    return FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Icon(Icons.hourglass_empty_rounded, color: Colors.white,);
          } 
          return Obx(() {
            if (sleepController.displayList.value) {
              return Icon(Icons.grid_view_rounded, color: Colors.white,);
            } else {
              return Icon(Icons.table_rows_rounded, color: Colors.white,);
            }
          });
        }, future: sleepController.getDisplayList(),
      );
  }

  SliverList _buildList() {
    return SliverList.builder(
              itemCount: sleepController.items.length,
              itemBuilder: (context, index) {
              final data = sleepController.items[index];
              return GestureDetector(
                  child: InkWell(
                    child: SizedBox(
                      height: 120,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Gap(8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: CachedNetworkImage(
                                    placeholder: (context, url) => Container(), 
                                    errorWidget: (context, url, error) => Container(color: Colors.white,),
                                    imageUrl: data.cover ?? "", 
                                    height: 90,
                                    width: 90,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          Gap(16),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(child: Text(data.title ?? "", maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w900),)),
                                    Text(data.author?.name ?? "", overflow: TextOverflow.ellipsis, style: TextStyle(color: XMColor.xmGrey, fontSize: 12, fontWeight: FontWeight.w600),)
                                  ],
                                ),
                                Gap(5),
                                Text(data.desc ?? "", maxLines: 2, softWrap: true, overflow: TextOverflow.ellipsis, style: TextStyle(color: XMColor.xmGrey, fontSize: 12, fontWeight: FontWeight.w600),),
                              ],
                            ),
                          ),
                          Gap(16)
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    
                  },
                );
            },);
  }

  SliverGrid _buildGrid() {
    return SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 0.77), 
              itemCount: sleepController.items.length,
              itemBuilder: (context, index) {
              final data = sleepController.items[index];
              return GestureDetector(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: double.infinity),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CachedNetworkImage(
                                placeholder: (context, url) => Container(), 
                                errorWidget: (context, url, error) => Container(color: Colors.white,),
                                imageUrl: data.cover ?? "", 
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            child: Text(data.author?.name ?? "", 
                            style: TextStyle(
                              color: Colors.white, 
                              fontSize: 12, 
                              fontWeight: FontWeight.w600, 
                              shadows: [Shadow(color: Colors.black, blurRadius: 5)]),)),
                          ]
                        ),
                      ),
                      Text(data.title ?? "", overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w900),),
                      Text(data.desc ?? "", overflow: TextOverflow.ellipsis, style: TextStyle(color: XMColor.xmGrey, fontSize: 12, fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
                onTap: () {
                  
                }
              );
            },
          );
  }
}