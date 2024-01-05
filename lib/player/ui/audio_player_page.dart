import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:xiaomian/assets_code/xm_color.dart';
import 'package:xiaomian/assets_code/xm_font_family.dart';
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
            child: SvgPicture.asset(Assets.iconImage.pullClose, width: 36, height: 10), 
            onPressed: () {
            Get.back();
          },),
        ),
        body: Center(
          child: Column(
            children: [
              Flexible(flex: 2, fit: FlexFit.tight, child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.network('https://cccimg.com/view.php/7ff3bd13cda0aaae9ad0de8d29411f56.jpeg', fit: BoxFit.cover, height: 170, width: 170,)),
                  const Gap(23),
                  Text("center music", style: XMTextStyle(color: XMColor.xmGrey, fontSize: 20, fontWeight: FontWeight.w400),),
                  const Gap(10),
                  Text("Pack name", style: XMTextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.w900),),
                ]
              )),
              Flexible(flex: 1, child: Center(
                child: SizedBox(
                  width: 72,
                  height: 72,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      StreamBuilder<bool>(
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
                            const model = AudioItem(id: "123", title: "东方红", albumTitle: "新中国", artist: "陕北人民", url: "https://cccimg.com/view.php/5d4086139dcd25bef2522c469512c83f.mp3", artwork: "https://cccimg.com/view.php/7ff3bd13cda0aaae9ad0de8d29411f56.jpeg");
                            playerController.setPlayItem(model);
                            playerController.handler?.playOrPause();
                          },  
                          icon: Icon(playerController.player.isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white, size: 36,),
                          );
                        },  
                      ),
                      ]
                  ),
                ),
              ),)
            ],
          ),
        ),
      ),
    );
  }
}