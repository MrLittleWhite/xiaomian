import 'package:flutter/material.dart';
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

  final ValueNotifier<AudioPlayItem?> playItemChangeNotifier = ValueNotifier(null);
  final ValueNotifier<bool?> playingChangeNotifier = ValueNotifier(null);

  RxBool autoPlay = false.obs;
  RxInt playPeriod = 30.obs;

  AudioPlayItem? get playItem {
    return playItemChangeNotifier.value;
  }

  set playItem(AudioPlayItem? item) {
    if (playItemChangeNotifier.value?.aId != item?.aId) {
      if (item is AudioItem) {
        historyRepository.insert(item);
      }
      handler?.toStop();
      XMAudioHandler.setMedioInfo(item);
      playItemChangeNotifier.value = item;
    }
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
    historyRepository.getFirstItem().then((value) {
      playItem = value;
      playingChangeNotifier.value = false;
    }).catchError((e) {
      
    });
    player.loadingStream.listen((event) {
      playingChangeNotifier.value = event ? true : player.isPlaying;
    });
    player.playingStream.listen((event) {
      playingChangeNotifier.value = event ? true : player.isLoading;
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

}