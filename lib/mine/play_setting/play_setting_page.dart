import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:xiaomian/assets_code/xm_color.dart';
import 'package:xiaomian/assets_code/xm_tools.dart';
import 'package:xiaomian/component/xm_appbar.dart';
import 'package:xiaomian/component/xm_intl.dart';
import 'package:xiaomian/component/xm_shared_preferences.dart';
import 'package:xiaomian/player/audio_player_controller.dart';

enum PlayerSettingItemType {
  timer,
  autoPlay,
}

extension AboutUsItemTypeExtension on PlayerSettingItemType {
  String get name {
    switch (this) {
      case PlayerSettingItemType.timer:
        return XMIntl.current.playPeriod;
      case PlayerSettingItemType.autoPlay:
        return XMIntl.current.autoPlay;
    }
  }

  IconData get icon {
    switch (this) {
      case PlayerSettingItemType.timer:
        return Icons.timer;
      case PlayerSettingItemType.autoPlay:
        return Icons.play_circle;
    }
  }

  Color? get iconColor {
    switch (this) {
      case PlayerSettingItemType.timer:
      case PlayerSettingItemType.autoPlay:
        return Colors.white;
    }
  }
}
class PlaySettingPage extends StatefulWidget {
  const PlaySettingPage({super.key});

  @override
  State<PlaySettingPage> createState() => _PlaySettingPageState();
}

class _PlaySettingPageState extends State<PlaySettingPage> {

  final List<PlayerSettingItemType> _items = [
    PlayerSettingItemType.timer,
    PlayerSettingItemType.autoPlay,
  ];

  final playerController = Get.find<AudioPlayerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: XMAppBar.name(XMIntl.current.playSettings), 
      backgroundColor: XMColor.xmMain,
      body: Theme(
        data: ThemeData(listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16))),
        child: ListView.separated(
          itemBuilder: (context, index) {
            var item = _items[index];
            if (item == PlayerSettingItemType.timer) {
                return ListTile(
              key: ValueKey(item), 
              leading: SizedBox(width: 45, height: 45, child: Icon(item.icon, color: item.iconColor,),), 
              title: Text(_items[index].name, style: const TextStyle(color: Colors.white, fontSize: 20)), 
              trailing: Obx(() => Text(playerController.playPeriod.value.xmPlayPeriod, style: TextStyle(color: XMColor.xmOrange, fontSize: 16))), 
              onTap: () {
                navigateAct(context, item);
              } 
              );
            } else {
              return ListTile(
              key: ValueKey(item), 
              leading: SizedBox(width: 45, height: 45, child: Icon(item.icon, color: item.iconColor,),), 
              title: Text(_items[index].name, style: const TextStyle(color: Colors.white, fontSize: 20)), 
              trailing: Obx(() { return CupertinoSwitch(trackColor: XMColor.xmGrey, value: playerController.autoPlay.value, onChanged: (value) {
                var newValue = value;
                XMSharedPreferences.setBool(XMPrefersKey.autoPlay, newValue).then((value) {
                  if (value) {
                    playerController.autoPlay.value = newValue;
                  }
                }).catchError((e) {
                  //todo: upload error
                });
              });}), 
              );
            }
          }, 
          separatorBuilder: (context, index) {
            var item = _items[index];
            Key key = ValueKey(item);
            return Padding(
              key: key,
              padding: const EdgeInsets.only(left: 72),
              child: Gap(1, color: XMColor.xmSeparator,),
            );
          }, 
          itemCount: _items.length,
          ),
      ),
      );
  }

  void navigateAct(BuildContext context, PlayerSettingItemType type) {
    switch (type) {
      case PlayerSettingItemType.timer:
        _showDialog(context);
        break;
      case PlayerSettingItemType.autoPlay:
        //todo
        break;
    }
  }

  void _showDialog(BuildContext context) {

    Duration duration = Duration(minutes: playerController.playPeriod.value);

    if (Platform.isAndroid) {
      showDialog<int>(
        context: context,
        builder: (BuildContext context) {
            var child = SizedBox(
              height: 200,
              child: Column(
              children: <Widget>[
                Expanded(
                  child: CupertinoTimerPicker(
                    mode: CupertinoTimerPickerMode.hm,
                    initialTimerDuration: duration,
                    // This is called when the user changes the timer's
                    // duration.
                    onTimerDurationChanged: (Duration newDuration) {
                      duration = newDuration;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      child: Text(XMIntl.current.cancel),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    CupertinoButton(
                      child: Text(XMIntl.current.confirm),
                      onPressed: () {
                        XMSharedPreferences.setInt(XMPrefersKey.playPeriod, duration.inMinutes).then((value) {
                          if (value) {
                            playerController.playPeriod.value = duration.inMinutes;
                          }
                        }).catchError((e) {
                          //upload error
                        }).whenComplete(() => Navigator.pop(context));
                      },
                    ),
                  ],
                )
              ],
                        ),
            );
          return Dialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), child: child,);
        }
      );

      return;
    }


    
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => Container(
        height: 200,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Close the modal
                  CupertinoButton(
                    child: Text(XMIntl.current.cancel),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  // Save the duration and close the modal
                  CupertinoButton(
                    child: Text(XMIntl.current.confirm),
                    onPressed: () {
                      XMSharedPreferences.setInt(XMPrefersKey.playPeriod, duration.inMinutes).then((value) {
                        if (value) {
                          playerController.playPeriod.value = duration.inMinutes;
                        }
                      }).catchError((e) {
                        //upload error
                      }).whenComplete(() => Navigator.pop(context));
                    },
                  ),
                ],
              ),
              // The timer picker widget
              Expanded(
                child: CupertinoTimerPicker(
                  mode: CupertinoTimerPickerMode.hm,
                  initialTimerDuration: duration,
                  // This is called when the user changes the timer's
                  // duration.
                  onTimerDurationChanged: (Duration newDuration) {
                    duration = newDuration;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
    
  }

}