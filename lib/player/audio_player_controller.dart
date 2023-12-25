import 'dart:ffi';

import 'package:audio_session/audio_session.dart';
import 'package:get/get.dart';
import 'package:xiaomian/player/basic_audio_player.dart';
import 'package:xiaomian/player/xm_just_player.dart';

class AudioPlayerController extends GetxController {

  late final player = XMJustPlayer();
  
  AudioSession? _session;
  var _hasGetSession = false;
  var _hasConfigSession = false;

  var _toPlay = false;

  bool get toPlay {
    return _toPlay;
  }

  void playOrPause() {
    if (player.isPlaying == false && _toPlay == false) {
      play();
    } else {
      pause();
    }
  }

  void play() {
    if (_toPlay == true) {
      return;
    }

    _toPlay = true;

    final getSession = _hasGetSession? Future.value(_session!) : AudioSession.instance;
    getSession.then((value) {
      if (!_hasGetSession) {
        _hasGetSession = true;
        _session = value;
        listenSession(value);
      }

      if (_hasConfigSession) {
        return Future.value(null);
      }
      return value.configure(const AudioSessionConfiguration.speech());
    }).then((value) {
      _hasConfigSession = true;
      return _session!.setActive(true);
    }).then((value) {
      if (_toPlay && value) {
        _toPlay = false;
        player.play();
      } else {
        _toPlay = false;
      }
    }).catchError((e) {
      _toPlay = false;
      player.controller.addError(BasicAudioException(999998, e.toString()));
    });

  }

  void pause() {
    _toPlay = false;
    player.pause();
  }

  void resumeFromInterruption() {
    _session?.configure(const AudioSessionConfiguration(
          avAudioSessionCategory: AVAudioSessionCategory.playback,
          avAudioSessionCategoryOptions: AVAudioSessionCategoryOptions.mixWithOthers,
          avAudioSessionMode: AVAudioSessionMode.spokenAudio,
          androidAudioAttributes: AndroidAudioAttributes(
            contentType: AndroidAudioContentType.speech,
            usage: AndroidAudioUsage.media,
          ),
          androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
          androidWillPauseWhenDucked: true,
      )
    ).then((value) {
      _hasConfigSession = true;
      return _session!.setActive(true);
    }).then((value) {
      if (_toPlay && value) {
        _toPlay = false;
        player.play();
      } else {
        _toPlay = false;
      }
    }).catchError((e) {
      _toPlay = false;
      player.controller.addError(BasicAudioException(999998, e.toString()));
    }).then<void>((value) {
      return _session?.configure(const AudioSessionConfiguration.speech());
    }).catchError((e) {
      _hasConfigSession = false;
    });
  }

  void listenSession(AudioSession session) {
    session.interruptionEventStream.listen((event) {
      if (event.begin) {
        switch (event.type) {
          case AudioInterruptionType.duck:
            // Another app started playing audio and we should duck.
            pause();
            break;
          case AudioInterruptionType.pause:
          case AudioInterruptionType.unknown:
            // Another app started playing audio and we should pause.
            pause();
            break;
        }
      } else {
        switch (event.type) {
          case AudioInterruptionType.duck:
            // The interruption ended and we should unduck.
            resumeFromInterruption();
            break;
          case AudioInterruptionType.pause:
            // The interruption ended and we should resume.
            resumeFromInterruption();
            break;
          case AudioInterruptionType.unknown:
            // The interruption ended but we should not resume.
            break;
        }
      }
    });

    session.becomingNoisyEventStream.listen((_) {
      // The user unplugged the headphones, so we should pause or lower the volume.
    });

    session.devicesChangedEventStream.listen((event) {
      // print('Devices added:   ${event.devicesAdded}');
      // print('Devices removed: ${event.devicesRemoved}');
    });
  }

}