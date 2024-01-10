import 'dart:async';
import 'package:just_audio/just_audio.dart';
import 'package:xiaomian/player/basic_audio_player.dart';

class XMAudioPlayer implements BasicAudioPlayer {

  var _url = "";

  late final player = AudioPlayer();

  late final controller = StreamController<BasicAudioException>.broadcast();

  XMAudioPlayer() {
    player.setLoopMode(LoopMode.one);
    player.playbackEventStream.listen((event) {}, onError: (Object e, StackTrace st) {
      if (e is PlayerException) {
          controller.addError(BasicAudioException(e.code, e.message));
      } else {
          controller.addError(BasicAudioException(999999, e.toString()));
      }
    });
  }

  Future<void> dispose() async {
    player.stop().then(
      (value) => player.dispose()
    ).then(
      (value) => controller.close()
    ).catchError((e) {
      
    });
  }
  
  @override
  void setURL(String url, {dynamic medioInfo}) {
    if (url == _url) {
      return;
    }
    _url = url;
    final audioSource = LockCachingAudioSource(Uri.parse(url), tag: medioInfo);
    player.setAudioSource(audioSource).catchError((e) {
      //todo: upload error
      return null;
    });
  }

  @override
  void play() async {
    if(player.playing) {
      return;
    }
    player.play();
  }

  @override
  void pause() async {
    player.pause();
  }
  
  @override
  void stop() async {
    player.stop();
  }
  
  @override
  bool get isLoading {
    return player.processingState == ProcessingState.loading || player.processingState == ProcessingState.buffering;
  }
  
  @override
  bool get isPlaying {
    return player.playing;
  }
  
  @override
  Stream<bool> get playingStream {
    return player.playingStream;
  }
  
  @override
  Stream<bool> get loadingStream {
    return player.processingStateStream.map((event) {
      return event == ProcessingState.loading || event == ProcessingState.buffering;
    });
  }

  @override
  Stream<BasicAudioException> get errorStream {
    return controller.stream;
  }

}