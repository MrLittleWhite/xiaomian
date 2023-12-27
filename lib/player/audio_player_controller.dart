import 'package:get/get.dart';
import 'package:xiaomian/player/audio_play_item.dart';
import 'package:xiaomian/player/basic_audio_player.dart';
import 'package:xiaomian/player/xm_audio_handler.dart';
import 'package:xiaomian/player/xm_audio_player.dart';

class AudioPlayerController extends GetxController {

  late final XMAudioPlayer player = XMAudioPlayer();

  AudioPlayItem? _playItem;
  AudioPlayItem? get playItem {
    return _playItem;
  }

  BasicAudioPlayer get basicPlayer {
    return player.player;
  }
  
  @override
  void onInit() {
    XMAudioHandler.initialize().then((value) {
      value.attach(player);
    }).catchError((e) {
      //todo: upload error
    });
    super.onInit();
  }

  XMAudioHandler? get handler {
    return XMAudioHandler.shared;
  }

  void setPlayItem(AudioPlayItem item) {
    _playItem = item;
    XMAudioHandler.setMedioInfo(item);
    player.setURL(item.url);
  }

}