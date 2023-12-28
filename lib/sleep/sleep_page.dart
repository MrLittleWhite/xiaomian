import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:xiaomian/model/audio_item.dart';
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
                        const model = AudioItem(id: "123", title: "东方红", albumTitle: "新中国", artist: "陕北人民", url: "https://cccimg.com/view.php/5d4086139dcd25bef2522c469512c83f.mp3", artwork: "https://cccimg.com/view.php/7ff3bd13cda0aaae9ad0de8d29411f56.jpeg");
                        playerController.setPlayItem(model);
                        playerController.handler?.playOrPause();
                      }, child: Icon( playerController.player.isPlaying ?Icons.pause : Icons.play_arrow)
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