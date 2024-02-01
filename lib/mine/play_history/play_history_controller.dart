import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:xiaomian/component/UI/page_state.dart';
import 'package:xiaomian/mine/play_history/play_history_repository.dart';
import 'package:xiaomian/model/audio_item.dart';

class PlayHistoryController extends GetxController {

  RxList<AudioItem> items = <AudioItem>[].obs;

  final _repository = PlayHistoryRepository();
  
  RxInt state = PageState.idle.index.obs;

  Object? _error;

  Object? get error {
    return _error;
  }

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
    });
  }

  Future<void> delete(List<AudioItem> items) async {
    return _repository.delete(items).then((value) => items.removeWhere((element) => items.contains(element)));
  }

  Future<void> deleteAll() async {
    return _repository.deleteAll();
  }

  void fetch() {
    state.value = PageState.loading.index;
    getAll().then((value) {
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
}