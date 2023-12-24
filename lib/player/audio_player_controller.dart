import 'package:audio_session/audio_session.dart';
import 'package:get/get.dart';
import 'package:xiaomian/player/basic_audio_player.dart';
import 'package:xiaomian/player/xm_just_player.dart';

class AudioPlayerController extends GetxController {

  late final player = XMJustPlayer();

  var toPlay = false;

  void playOrPause() {
    if (player.isPlaying == false && toPlay == false) {
      play();
    } else {
      pause();
    }
  }

  void play() {
    if (toPlay == true) {
      return;
    }

    toPlay = true;
    final getSession = AudioSession.instance;
    getSession.then((value) {
      return value.configure(const AudioSessionConfiguration.speech());
    }).then((value) {
      if (toPlay) {
        toPlay = false;
        player.play();
      }
    }).catchError((e) {
      toPlay = false;
      player.controller.addError(BasicAudioException(999998, e.toString()));
    });

  }

  void pause() {
    toPlay = false;
    player.pause();
  }

}