import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:xiaomian/assets_code/xm_icons.dart';
import 'package:xiaomian/component/xm_intl.dart';
import 'package:xiaomian/component/xm_media_query.dart';
import 'package:xiaomian/component/xm_system_chrome.dart';
import 'package:xiaomian/gen/assets.gen.dart';
import 'package:xiaomian/mine/mine_page.dart';
import 'package:xiaomian/model/audio_item.dart';
import 'package:xiaomian/player/audio_play_item.dart';
import 'package:xiaomian/player/audio_player_controller.dart';
import 'package:xiaomian/player/ui/audio_player_page.dart';
import 'package:xiaomian/route/app_route.dart';
import 'package:xiaomian/sleep/sleep_page.dart';
import 'package:xiaomian/assets_code/xm_color.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatefulWidget {


  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PersistentTabController(initialIndex: 0);
  final playBarHeight = 75.0;

  final playerController = Get.find<AudioPlayerController>();

  @override
  Widget build(BuildContext context) {
    final items = _navBarsItems();
    XMSystemChrome.setUIEdgeToEdge(XMColor.xmMain);
    return PersistentTabView.custom(context, 
      confineInSafeArea: Platform.isAndroid,
      backgroundColor: Colors.transparent,
      navBarHeight: XMMediaQuery.xmBottom(context)+kBottomNavigationBarHeight+playBarHeight,
      bottomScreenMargin: XMMediaQuery.xmBottom(context)+kBottomNavigationBarHeight,
      controller: _controller, 
      handleAndroidBackButtonPress: true,
      onWillPop: (context) { return Future(() => true); },
      customWidget: (navBarEssentials) => Column(
        children: [
          _buildPlayerBar(),
          SizedBox(
            height: kBottomNavigationBarHeight,
            child: CustomNavBarWidget(
              selectedIndex: _controller.index, 
              items: items, 
              onItemSelected: (value) {
                _controller.index = value;
              }),
          ),
          Platform.isAndroid ? const Gap(0) : SizedBox(
            height: XMMediaQuery.xmBottom(context), 
            width: double.infinity,
            child: Container(color: XMColor.xmSeparator),)
        ],
      ), 
        itemCount: items.length, 
        screens: _buildScreens()
      );
  }
  
  Widget _buildPlayerBar() {
    return GestureDetector(
      onTap: () { 
          AppRoute.toDialog(AudioPlayerPage());
        },
      child: BlurryContainer(
        borderRadius: BorderRadius.zero,
        blur: 10, elevation: 5, height: playBarHeight, width: double.infinity,
        color: const XMColor(0x141927, opacity: 0.76), 
        padding: const EdgeInsets.only(left: 16, right: 0, top: 8, bottom: 8),
        child: Row (
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: ValueListenableBuilder(
                valueListenable: playerController.playItemChangeNotifier,
                builder: (BuildContext context, AudioPlayItem? value, Widget? child) { 
                  final Widget Function(bool) placeholder = (isInit) => Container(width: 59, height: 59, 
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.white.withOpacity(0.2), width: 1), 
                                            borderRadius: BorderRadius.circular(12)), 
                                        child: Icon( isInit ? Icons.waving_hand_rounded : Icons.broken_image_rounded, color: Colors.white,)); 
                  return value?.cover == null ? placeholder(false) : CachedNetworkImage(
                  placeholder: (context, url) => Container(), 
                  errorWidget: (context, url, error) => placeholder(false),
                  imageUrl: value!.cover!,
                  width: 59, height: 59, fit: BoxFit.cover,
                );
                },
              ),
            ),
            const Gap(16),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: playerController.playItemChangeNotifier,
                builder: (BuildContext context, value, Widget? child) { 
                  return Column (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(playerController.playItem?.title ?? XMIntl.current.welcomeTitle, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),),
                    Text(playerController.playItem?.desc ?? XMIntl.current.welcomeDetail, overflow: TextOverflow.ellipsis, style: TextStyle(color: XMColor.xmGrey, fontSize: 14, fontWeight: FontWeight.w600)),
                  ],
                );},
              ),
            ),
            SizedBox(
              width: 56,
              height: 59,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  StreamBuilder<bool>(
                    stream: playerController.player.loadingStream,
                    builder: (context, snapshot) {
                      return playerController.player.isLoading ? LoadingAnimationWidget.threeArchedCircle(color: Colors.white, size: 33) : Container();
                    },  
                  ),
                  StreamBuilder<bool>(
                    stream: playerController.player.playingStream,
                    builder: (context, snapshot) {
                      return IconButton(
                      onPressed: () {
                        if (playerController.playItem != null) {
                          playerController.handler?.toTogglePlay();
                        }
                      },  
                      icon: Icon(playerController.player.isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white,),
                      );
                    },  
                  ),
                  ]
              ),
            ),
          ],)
        ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      const SleepPage(),
      const MinePage(),
    ];
  }

  List<XMPersistentBottomNavBarItem> _navBarsItems() {
      return [
          XMPersistentBottomNavBarItem(
              createIcon: (color) => Assets.images.moonStar.image(width: 24, height: 24, fit: BoxFit.none, color: color),//const Icon(Icons.nights_stay_rounded),
              title: XMIntl.current.sleep,
              activeColorPrimary: XMColor.xmWhite,
              inactiveColorPrimary: XMColor.xmBlue,
          ),
          XMPersistentBottomNavBarItem(
              createIcon: (color) => Icon(Icons.face, size: 24, color: color,),
              title: XMIntl.current.profile,
              activeColorPrimary: XMColor.xmWhite,
              inactiveColorPrimary: XMColor.xmBlue,
          ),  
      ];
  }
  
}



class CustomNavBarWidget extends StatelessWidget {
    final int selectedIndex;
    final List<XMPersistentBottomNavBarItem> items; //可以使用自定义model
    final ValueChanged<int> onItemSelected;

    const CustomNavBarWidget(
        {super.key,
        required this.selectedIndex,
        required this.items,
        required this.onItemSelected,});

    Widget _buildItem(
        XMPersistentBottomNavBarItem item, bool isSelected) {
        return Container(
        color: XMColor.xmSeparator,
        alignment: Alignment.center,
        height: kBottomNavigationBarHeight,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
            Flexible(
              child: item.createIcon(
                isSelected ? item.activeColorPrimary : item.inactiveColorPrimary,
              ),
            ),
            isSelected ? Flexible(
              child: Text(
                item.title,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: isSelected ? item.activeColorPrimary : item.inactiveColorPrimary,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0
                  ),
               ).animate().move(
                duration: const Duration(milliseconds:200), 
                begin: const Offset(0, 16), 
                end: const Offset(0, 0), 
                curve: Curves.easeInOut
              ),
            ) : const Gap(0)
            ],
        ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map((item) {
            int index = items.indexOf(item);
            return Flexible(
            child: GestureDetector(
                onTap: () {
                onItemSelected(index);
                },
                child: _buildItem(
                    item, selectedIndex == index),
            ),
            );
        }).toList(),
        );
    }
}

class XMPersistentBottomNavBarItem {
  final Widget Function(Color) createIcon;
  final String title;
  final Color activeColorPrimary;
  final Color inactiveColorPrimary;

  XMPersistentBottomNavBarItem({
    required this.createIcon, 
    required this.title, 
    required this.activeColorPrimary, 
    required this.inactiveColorPrimary
  });
}
