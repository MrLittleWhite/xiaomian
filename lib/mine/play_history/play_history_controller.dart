import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:xiaomian/component/UI/page_state.dart';
import 'package:xiaomian/mine/play_history/play_history_repository.dart';
import 'package:xiaomian/model/audio_item.dart';


class PlayHistoryController extends GetxController {

  RxList<AudioItem> items = <AudioItem>[].obs;

  final _repository = PlayHistoryRepository();

  final ValueNotifier<PageState> state = ValueNotifier(PageState.idle);

  Object? _error;

  Object? get error {
    return _error;
  }

  RxBool editEnable = false.obs;
  RxMap<int, int> checks = <int, int>{}.obs;

  @override
  void onInit() {
    Logger().d("PlayHistoryController onInit");
    super.onInit();
  }

  @override
  void onReady() {
    Logger().d("PlayHistoryController onReady");
    super.onReady();
    fetch();
  }

  @override
  void onClose() {
    Logger().d("PlayHistoryController onClose");
    super.onClose();
  }

  Future<void> getAll() async {
    return _repository.getAll().then((value) {
      items.value = value;
      checks.clear();
    });
  }

  Future<void> deleteItems(List<AudioItem> deleteItems) async {
    return _repository.delete(deleteItems).then((value) => items.removeWhere((element) => deleteItems.contains(element)));
  }

  Future<void> deleteIds(List<int> ids) async {
    return _repository.deleteIds(ids).then((value) => items.removeWhere((element) => ids.contains(element.id)));
  }

  Future<void> deleteAll() async {
    return _repository.deleteAll().then((value) => items.clear());
  }

  void fetch() {
    state.value = PageState.loading;
    getAll().then((value) {
      if (items.isEmpty) {
        state.value = PageState.empty;
      } else {
        state.value = PageState.success;
      }
    }).catchError((e) {
      _error = e;
      state.value = PageState.error;
    });
  }
}