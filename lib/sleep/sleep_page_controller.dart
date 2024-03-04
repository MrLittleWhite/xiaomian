import 'dart:math';

import 'package:get/get.dart';
import 'package:xiaomian/component/UI/page_state.dart';
import 'package:xiaomian/component/xm_shared_preferences.dart';
import 'package:xiaomian/model/audio_item.dart';
import 'package:xiaomian/sleep/sleep_page_repository.dart';

class SleepPageController extends GetxController {
  bool _readDisplay = false;
  RxBool displayList = false.obs;
  RxList<AudioItem> items = <AudioItem>[].obs;

  RxInt state = PageState.idle.index.obs;

  Object? _error;

  Object? get error {
    return _error;
  }

  final repository = SleepPageRepository();

  @override
  void onReady() {
    super.onReady();
    fetch();
  }

  void fetch() {
    state.value = PageState.idle.index;
    Future.wait([getItems(), getDisplayList()]).then((value) {
      if (items.isEmpty) {
        state.value = PageState.empty.index;
      } else {
        state.value = PageState.success.index;
      }
    }).catchError((e) {
      _error = e;
      state.value = PageState.error.index;
    });
  }

  Future<bool> getDisplayList() async {
    return _readDisplay ? Future.value(displayList.value) :  XMSharedPreferences.getBool(XMPrefersKey.sleepDisplay).then((value) {
      _readDisplay = true;
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

  final _random = Random();

  //test data
  List<AudioItem> _createItems(int count) {
    
    List<AudioItem> items = [];
    for (var i = 0; i < count; i++) {
      AudioItem item = AudioItem.fromJson(AudioItemMap.json);
      item.aId = _random.nextInt(999999).toString();
      item.titleTXT?.en = '${item.aId} ${item.titleTXT?.en}';
      item.titleTXT?.cn = '${item.aId} ${item.titleTXT?.cn}';
      item.titleTXT?.ja = '${item.aId} ${item.titleTXT?.ja}';
      item.titleTXT?.ko = '${item.aId} ${item.titleTXT?.ko}';
      item.titleTXT?.cnHK = '${item.aId} ${item.titleTXT?.cnHK}';
      items.add(item);
    }
    return items;
  }

  Future<void> getItems() async {
    // return repository.fetchData(pageSize: 2, apiKey: "3").then((value) => items.value = value);

    List<AudioItem> list = await Future.delayed(const Duration(seconds: 3), () => _createItems(16));
    items.value = list;
  }

  Future<void> getMore() async {
    List<AudioItem> list = await Future.delayed(const Duration(seconds: 3), () => _createItems(16));
    items.addAll(list);
  }
  
}