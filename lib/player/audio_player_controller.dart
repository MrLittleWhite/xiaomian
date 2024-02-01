import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:xiaomian/component/xm_shared_preferences.dart';
import 'package:xiaomian/mine/play_history/play_history_repository.dart';
import 'package:xiaomian/model/audio_item.dart';
import 'package:xiaomian/player/audio_play_item.dart';
import 'package:xiaomian/player/xm_audio_handler.dart';
import 'package:xiaomian/player/xm_audio_player.dart';

class AudioPlayerController extends GetxController {

  final historyRepository = PlayHistoryRepository();

  late final XMAudioPlayer player = XMAudioPlayer();

  RxBool autoPlay = false.obs;
  RxInt playPeriod = 30.obs;

  AudioPlayItem? _playItem;
  AudioPlayItem? get playItem {
    return _playItem;
  }

  @override
  void onInit() {
    Logger().d("AudioPlayerController onInit");
    XMAudioHandler.initialize().then((value) {
      value.attach(player);
    }).catchError((e) {
      //todo: upload error
    });
    XMSharedPreferences.getBool(XMPrefersKey.autoPlay).then((value) {
      autoPlay.value = value ?? false;
    }).catchError((e) {
      //todo: upload error
      //获取失败，移除键值
      return XMSharedPreferences.remove(XMPrefersKey.autoPlay).then((value) => null);
    }).catchError((e) {
      //todo: upload error
    });
    XMSharedPreferences.getInt(XMPrefersKey.playPeriod).then((value) {
      playPeriod.value = value ?? 30;
    }).catchError((e) {
      //todo: upload error
      //获取失败，移除键值
      return XMSharedPreferences.remove(XMPrefersKey.playPeriod).then((value) => null);
    }).catchError((e) {
      //todo: upload error
    });
    super.onInit();
  }

  @override
  void onClose() {
    Logger().d("AudioPlayerController onClose");
    super.onClose();
  }

  XMAudioHandler? get handler {
    return XMAudioHandler.shared;
  }

  void setPlayItem(AudioPlayItem item) {
    if (_playItem == null || _playItem!.aId != item.aId) {
      if (item is AudioItem) {
        historyRepository.insert(item as AudioItem);
      }
    }
    _playItem = item;
    XMAudioHandler.setMedioInfo(item);
  }

}