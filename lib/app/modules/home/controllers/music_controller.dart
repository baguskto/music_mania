import 'package:get/get.dart';
import 'package:music_mania/app/data/repositories/music_repository.dart';

class MusicController extends GetxController {
  final MusicRepository _musicRepository;
   RxDouble durationMax = 1.0.obs;

  MusicController({required MusicRepository musicRepository})
      : _musicRepository = musicRepository;

  @override
  void onClose() {
    _musicRepository.disposePlayer();
    super.onClose();
  }

  Future doPlayMusic({required String url}) async {
    await _musicRepository.initPlayerMusic(url);
    await _musicRepository.playMusic();
  }

  Future doPauseMusic() async {
    await _musicRepository.pauseMusic();
  }

  Future doStopMusic() async {
    await _musicRepository.pauseMusic();
  }

  void getDurationMax(){
    durationMax.value = _musicRepository.getMusicDuration();
  }
}
