import 'package:get/get.dart';
import 'package:music_mania/app/data/repositories/music_repository.dart';
import 'package:music_mania/app/data/repositories/search_repository.dart';
import 'package:music_mania/app/modules/home/controllers/music_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  final searchRepository = SearchRepository();
  final musicRepository = MusicRepository();

  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(searchRepository: searchRepository),
    );
    Get.lazyPut(() => MusicController(musicRepository: musicRepository));
  }
}
