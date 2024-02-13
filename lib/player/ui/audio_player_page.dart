import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:xiaomian/assets_code/xm_color.dart';
import 'package:xiaomian/component/xm_system_chrome.dart';
import 'package:xiaomian/gen/assets.gen.dart';
import 'package:xiaomian/player/audio_player_controller.dart';

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({super.key});

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {

  final playerController = Get.find<AudioPlayerController>();

  final coverSize = 240.0;

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
            child: Assets.images.pullClose.image(width: 36, height: 10),
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
                    child: ListenableBuilder(
                      listenable: playerController.playItemChangeNotifier,
                      builder: (BuildContext context, Widget? child) { 
                        final placeholder = Assets.images.placeholder.image(width: coverSize, height: coverSize);
                        return playerController.playItem?.cover == null ? placeholder : CachedNetworkImage(
                        placeholder: (context, url) => Container(), 
                        errorWidget: (context, url, error) => placeholder,
                        fit: BoxFit.cover,
                        width: coverSize, 
                        height: coverSize, imageUrl: playerController.playItem!.cover!, 
                      );
                      },
                    )
                  ),
                  const Gap(30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(playerController.playItem?.title ?? "", maxLines: 5, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),),
                  ),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(playerController.playItem?.authorName ?? "", maxLines: 10, overflow: TextOverflow.ellipsis, style: TextStyle(color: XMColor.xmWhite, fontSize: 16, fontWeight: FontWeight.w400),),
                  ),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(playerController.playItem?.desc ?? "", maxLines: 10, overflow: TextOverflow.ellipsis, style: TextStyle(color: XMColor.xmGrey, fontSize: 18, fontWeight: FontWeight.w400),),
                  ),
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
                                if (playerController.playItem != null) {
                                  playerController.handler?.toTogglePlay();
                                }
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
        duration: const Duration(milliseconds: 500), 
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
          size: const Size(double.infinity, 60), 
          waveAmplitude: 0,
          )
        );
  }
}