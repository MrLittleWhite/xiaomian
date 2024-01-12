import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:xiaomian/assets_code/xm_color.dart';
import 'package:xiaomian/component/xm_system_chrome.dart';
import 'package:xiaomian/gen/assets.gen.dart';
import 'package:xiaomian/model/audio_item.dart';
import 'package:xiaomian/player/audio_player_controller.dart';

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({super.key});

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {

  final playerController = Get.find<AudioPlayerController>();

  @override
  Widget build(BuildContext context) {
    XMSystemChrome.setUIEdgeToEdge(XMColor.xmMain);
    return Dismissible(
      direction: DismissDirection.down,
      key: const Key('AudioPlayerPage'),
      resizeDuration: null,
      onDismissed: (direction) => Get.back(),
      child: Scaffold(
        backgroundColor: XMColor.xmMain,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: XMColor.xmMain,
          centerTitle: true,
          title: CupertinoButton(
            child: Image.asset(Assets.iconImage.pullClose, width: 36, height: 10), 
            onPressed: () {
            Get.back();
          },),
        ),
        body: Center(
          child: Column(
            children: [
              Flexible(flex: 6, fit: FlexFit.tight, child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20), 
                    child: CachedNetworkImage(
                      placeholder: (context, url) => Container(), 
                      errorWidget: (context, url, error) => Container(),
                      fit: BoxFit.cover,
                      width: 170, 
                      height: 170, imageUrl: 'https://cccimg.com/view.php/7ff3bd13cda0aaae9ad0de8d29411f56.jpeg', 
                    )
                  ),
                  const Gap(23),
                  Text("center music", style: TextStyle(color: XMColor.xmGrey, fontSize: 20, fontWeight: FontWeight.w400),),
                  const Gap(10),
                  Text("Pack name", style: TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.w900),),
                ]
              )),
              Flexible(flex: 4, child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  StreamBuilder<bool>(
                            stream: playerController.player.playingStream,
                            builder: (context, snapshot) {
                    return _wave();
                    },  
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 72,
                      height: 72,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          StreamBuilder<bool>(
                            key: const Key("xm_player_wave"),
                            stream: playerController.player.loadingStream,
                            builder: (context, snapshot) {
                              return playerController.player.isLoading ? LoadingAnimationWidget.threeArchedCircle(color: Colors.white, size: 56) : Container();
                            },  
                          ),
                          StreamBuilder<bool>(
                            stream: playerController.player.playingStream,
                            builder: (context, snapshot) {
                              return IconButton(
                              onPressed: () {
                                // const model = AudioItem(id: "123", title: "东方红", albumTitle: "新中国", artist: "陕北人民", url: "https://cccimg.com/view.php/5d4086139dcd25bef2522c469512c83f.mp3", artwork: "https://cccimg.com/view.php/7ff3bd13cda0aaae9ad0de8d29411f56.jpeg");
                                // playerController.setPlayItem(model);
                                // playerController.handler?.playOrPause();
                              },  
                              icon: Icon(playerController.player.isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white, size: 36,),
                              );
                            },  
                          ),
                          ]
                      ),
                    ),
                  ),
                ],
              ),)
            ],
          ),
        ),
      ),
    );
  }

  AnimatedOpacity _wave() {
      return AnimatedOpacity(
        opacity: playerController.player.isPlaying ? 1 : 0, 
        duration: Duration(milliseconds: 500), 
        child: WaveWidget(
          config: CustomConfig(
            gradients: [
              [XMColor.xmOrange, Colors.red],
              [XMColor.xmGreen, XMColor.xmBlue],
            ],
            durations: [35000, 10800],
            heightPercentages: [0.55, 0.60],
            gradientBegin: Alignment.bottomLeft,
            gradientEnd: Alignment.topRight,
          ),
          size: Size(double.infinity, 60), 
          waveAmplitude: 0,
          )
        );
  }
}