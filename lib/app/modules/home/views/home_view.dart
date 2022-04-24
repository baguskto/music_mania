import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../widgets/home_audio_player_widget.dart';
import '../widgets/home_play_list_item_widget.dart';
import '../widgets/home_search_bar_widget.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Music Mania'),
            centerTitle: true,
            toolbarHeight: 110,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: HomeSearchBarWidget(),
            )),
        body: controller.obx((state) => HomePlaylistItemWidget(state!),
            onEmpty: Center(child: Text('Not Found')),
            onError: (err) => Center(child: Text('Try again')),
            onLoading: Center(
              child: SizedBox(
                  height: 30, width: 30, child: CircularProgressIndicator()),
            )),
        bottomSheet: HomeAudioPlayerWidget());
  }
}
