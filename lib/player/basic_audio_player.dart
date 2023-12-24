
class BasicAudioException implements Exception {
  final int code;

  final String? message;

  BasicAudioException(this.code, this.message);

  @override
  String toString() => "$code: $message";
}

abstract class BasicAudioPlayer {
  void set(String url);
  bool get isPlaying;
  bool get isLoading;
  Stream<bool> get playingStream;
  Stream<bool> get loadingStream;
  Stream<BasicAudioException> get errorStream;
  void play();
  void pause();
  void stop();
}