import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:xiaomian/component/xm_intl.dart';
import 'package:xiaomian/player/audio_play_item.dart';
import 'package:xiaomian/player/xm_audio_player.dart';

class XMAudioHandler extends BaseAudioHandler
    with QueueHandler, // mix in default queue callback implementations
    SeekHandler { // mix in default seek callback implementations

  static const String remoteControlId = "com.xiaomianstudio.audio";
  static const String remoteControlName = "xiaomian audio service";

  // singleton
  // RemoteAudioHandler._internal();
  // factory RemoteAudioHandler() => _instance;
  // static late final RemoteAudioHandler _instance = RemoteAudioHandler._internal();

  late final XMAudioPlayer _player;
  XMAudioPlayer get player {
    return _player;
  }

  static XMAudioHandler? shared;

  static Future<XMAudioHandler> initialize() async {
    if (shared != null) {
      return Future(() => shared!);
    }
    return AudioService.init(
      builder: () => XMAudioHandler(),
      config: const AudioServiceConfig(
        androidNotificationChannelId: remoteControlId,
        androidNotificationChannelName: remoteControlName,
        androidNotificationOngoing: true,
        androidStopForegroundOnPause: true,
      ),
    ).then((value) {
      shared = value;
      return Future(() => value);
    });
  }

  void attach(XMAudioPlayer player) {
    _player = player;
    _notifyPlaybackEvents();
  }

  late final _justAudioPlayer = player.player;

  //now playing 状态控制
  void _notifyPlaybackEvents() {
    _justAudioPlayer.playbackEventStream.listen((PlaybackEvent event) {
      final playing = _justAudioPlayer.playing;
      playbackState.add(playbackState.value.copyWith(
        controls: [
          // MediaControl.skipToPrevious,
          if (playing) MediaControl.pause else MediaControl.play,
          MediaControl.stop,
          // MediaControl.skipToNext,
        ],
        // systemActions: const {
        //   MediaAction.seek,
        // },
        androidCompactActionIndices: const [0, 1, 3],
        processingState: const {
          ProcessingState.idle: AudioProcessingState.idle,
          ProcessingState.loading: AudioProcessingState.loading,
          ProcessingState.buffering: AudioProcessingState.buffering,
          ProcessingState.ready: AudioProcessingState.ready,
          ProcessingState.completed: AudioProcessingState.completed,
        }[_justAudioPlayer.processingState]!,
        repeatMode: const {
          LoopMode.off: AudioServiceRepeatMode.none,
          LoopMode.one: AudioServiceRepeatMode.one,
          LoopMode.all: AudioServiceRepeatMode.all,
        }[_justAudioPlayer.loopMode]!,
        shuffleMode: (_justAudioPlayer.shuffleModeEnabled)
            ? AudioServiceShuffleMode.all
            : AudioServiceShuffleMode.none,
        playing: playing,
        updatePosition: _justAudioPlayer.position,
        bufferedPosition: _justAudioPlayer.bufferedPosition,
        speed: _justAudioPlayer.speed,
        queueIndex: event.currentIndex,
      ));
    });
  }

  @override
  Future<void> play() async {
    player.play();
  }
  @override
  Future<void> pause() async {
    player.pause();
  }
  @override
  Future<void> stop() async {
    player.pause();
  }
  
  Future<void> playOrPause() async {
    if (player.isPlaying) {
      pause();
    } else {
      play();
    }
  }

  // Future<void> seek(Duration position) async {}
  // Future<void> skipToQueueItem(int i) async {}

  static setMedioInfo(AudioPlayItem? playItem) {
    if (playItem != null && playItem.url != null) {
      final mediaItem = shared?._mediaItemFrom(playItem);
      //NowPlayingInfo
      shared?.mediaItem.add(mediaItem);
      shared?.player.setURL(playItem.url!, medioInfo: mediaItem);
    }
  }

  MediaItem _mediaItemFrom(AudioPlayItem playItem) {
    return MediaItem(id: playItem.aId, 
                  title: playItem.title ?? XMIntl.current.sleepGo, 
                 artist: playItem.authorName, 
                  album: playItem.desc, 
                 artUri: playItem.cover == null ? null : Uri.parse(playItem.cover!),
           displayTitle: playItem.title, 
        displaySubtitle: playItem.desc);
  }
}
