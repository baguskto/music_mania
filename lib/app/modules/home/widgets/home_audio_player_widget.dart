import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_mania/app/modules/home/controllers/home_controller.dart';

class HomeAudioPlayerWidget extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Visibility(
          visible: controller.hasSelect.isTrue,
          child: Container(
            padding: EdgeInsets.all(20),
            width: Get.width,
            height: 150,
            color: Colors.grey.withOpacity(0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () => controller.playBackMusic(),
                        icon: Icon(Icons.skip_previous_rounded)),
                    IconButton(
                        onPressed: () => controller.pauseAudio(),
                        icon: Icon(controller.isPause.isFalse
                            ? Icons.pause_circle_outline_rounded
                            : Icons.play_circle_outline_rounded)),
                    IconButton(
                        onPressed: () => controller.playNextMusic(),
                        icon: Icon(Icons.skip_next_rounded)),
                  ],
                ),
                Slider(
                  value: 0.5,
                  min: 0,
                  max: controller.musicCont.durationMax.value,
                  onChanged: (value) async {},
                  thumbColor: Colors.black,
                  activeColor: Colors.black,
                )
              ],
            ),
          ),
        ));
  }
}
