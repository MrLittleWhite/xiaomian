import 'dart:ffi';

import 'package:get/get.dart';
import 'package:xiaomian/component/xm_shared_preferences.dart';
import 'package:xiaomian/model/audio_item.dart';

class SleepPageController extends GetxController {

  RxBool displayList = false.obs;
  RxList<AudioItem> items = <AudioItem>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> getDisplayList() async {
    return  XMSharedPreferences.getBool(XMPrefersKey.sleepDisplay).then((value) {
      if (value != null) {
        displayList.value = value;
      }
      return value ?? false;
    });
  }

  
  Future<void> changeDisplayList() async {
    return XMSharedPreferences.setBool(XMPrefersKey.sleepDisplay, !displayList.value).then((value) {
      displayList.value = !displayList.value;
    });
  }

  List<AudioItem> _createItems(int count) {
    List<AudioItem> items = [];
    for (var i = 0; i < count; i++) {
      items.add(AudioItem.fromJson(AudioItemMap.json));
    }
    return items;
  }

  Future<void> getItems() async {
    List<AudioItem> list = await Future.delayed(Duration(seconds: 3), () => _createItems(16));
    items.value = list;
  }

  Future<void> getMore() async {
    List<AudioItem> list = await Future.delayed(Duration(seconds: 3), () => _createItems(16));
    items.addAll(list);
  }
  
}