import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:xiaomian/player/audio_player_controller.dart';

class SleepPage extends StatefulWidget {
  const SleepPage({super.key});

  @override
  State<SleepPage> createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {

  final playerController = Get.find<AudioPlayerController>();

  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('睡眠'), backgroundColor: Colors.blueAccent,), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<bool>(
              stream: playerController.player.playingStream,
              builder: (context, snapshot) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FilledButton(onPressed: () {
                        playerController.player.set("http://music.163.com/song/media/outer/url?id=29723028.mp3");
                        playerController.playOrPause();
                      }, child: Icon( (playerController.toPlay == true || playerController.player.isPlaying) ? Icons.pause : Icons.play_arrow)
                      ),
                      Text((!snapshot.hasError && snapshot.data == true) ? "暂停" : "播放"),
                    ],
                  );
              },  
            ),

            StreamBuilder(stream: playerController.player.errorStream, builder: (context, snapshot) {
              return Text( snapshot.hasError ? snapshot.error.toString() : "");
            }),
          ],
        ),
      ),
    );
  }
}