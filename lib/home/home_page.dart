import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:xiaomian/assets_code/xm_icons.dart';
import 'package:xiaomian/mine/mine_page.dart';
import 'package:xiaomian/sleep/sleep_page.dart';
import 'package:xiaomian/assets_code/xm_color.dart';

class HomePage extends StatefulWidget {


  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    final items = _navBarsItems();
    return PersistentTabView.custom(context, 
      controller: _controller, 
      handleAndroidBackButtonPress: true,
      onWillPop: (context) { return Future(() => true); },
      customWidget: CustomNavBarWidget(
        selectedIndex: _controller.index, 
        items: items, 
        onItemSelected: (value) {
          setState(() {
            _controller.index = value;
          });
        }), 
        itemCount: items.length, 
        screens: _buildScreens()
      );
  }

  List<Widget> _buildScreens() {
    return [
      const SleepPage(),
      const MinePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
          PersistentBottomNavBarItem(
              icon: const Icon(XMIconfont.moonStar),
              title: ("Sleep"),
              iconSize: 24,
              activeColorPrimary: XMColor.xmWhite,
              inactiveColorPrimary: XMColor.xmBlue,
          ),
          PersistentBottomNavBarItem(
              icon: const Icon(XMIconfont.userProfile),
              title: ("Profile"),
              iconSize: 24,
              activeColorPrimary: XMColor.xmWhite,
              inactiveColorPrimary: XMColor.xmBlue,
          ),  
      ];
  }
  
}



class CustomNavBarWidget extends StatelessWidget {
    final int selectedIndex;
    final List<PersistentBottomNavBarItem> items; //可以使用自定义model
    final ValueChanged<int> onItemSelected;

    const CustomNavBarWidget(
        {super.key,
        required this.selectedIndex,
        required this.items,
        required this.onItemSelected,});

    Widget _buildItem(
        PersistentBottomNavBarItem item, bool isSelected) {
        return Container(
        color: const Color(0xFF21283F),
        alignment: Alignment.center,
        height: kBottomNavigationBarHeight,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
            Flexible(
                child: IconTheme(
                  data: IconThemeData(
                    size: item.iconSize,
                    color: isSelected
                        ? (item.activeColorSecondary ?? item.activeColorPrimary)
                        : item.inactiveColorPrimary ?? item.inactiveColorSecondary),
                  child: item.icon,
                ),
            ),
            isSelected ? Padding(  
                padding: const EdgeInsets.only(top: 5.0),
                child: Material(
                type: MaterialType.transparency,
                child: FittedBox(
                    child: Text(
                    item.title ?? "",
                    style: TextStyle(
                        color: isSelected
                            ? (item.activeColorSecondary ?? item.activeColorPrimary)
                            : (item.inactiveColorPrimary ?? item.inactiveColorPrimary),
                        fontWeight: FontWeight.normal,
                        fontSize: 12.0),
                ),).animate().move(
                  duration: const Duration(milliseconds:200), 
                  begin: const Offset(0, 16), 
                  end: const Offset(0, 0), 
                  curve: Curves.easeInOut
                  ),
                ),
            ) : const Gap(0)
            ],
        ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Container(
        color: Colors.white,
        child: SizedBox(
            width: double.infinity,
            height: kBottomNavigationBarHeight,
            child: Row(
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
            ),
        ),
        );
    }
}


