import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_mania/app/data/models/models.dart';
import 'package:music_mania/app/data/repositories/search_repository.dart';
import 'package:music_mania/app/modules/home/controllers/music_controller.dart';

import '../../../utils/snackbar.util.dart';

class HomeController extends GetxController
    with StateMixin<SearchResultMusicByArtistModel> {
  final searchTextController = TextEditingController();
  final SearchRepository _searchRepository;
  RxString initialArtist = 'Tulus'.obs;
  RxBool hasSelect = false.obs;
  RxInt selectedIndexCard = 1000.obs;
  final musicCont = Get.find<MusicController>();
  RxBool isPause = false.obs;
  late String urlCurrentMusic;
  late SearchResultMusicByArtistModel playList;

  HomeController({required SearchRepository searchRepository})
      : _searchRepository = searchRepository;

  @override
  void onInit() {
    searchTextController.text = initialArtist.value;
    showPlaylistByArtistSearched(keyword: initialArtist.value);
    super.onInit();
  }

  @override
  void onClose() {}

  Future playAudio({required String url, required int index}) async {
    urlCurrentMusic = url;
    selectCardToggle(index);
    await musicCont.doPlayMusic(url: url);
  }

  Future pauseAudio() async {
    if (isPause.isFalse) {
      await musicCont.doPauseMusic();
      isPause.toggle();
    } else {
      isPause.toggle();
      await musicCont.doPlayMusic(url: urlCurrentMusic);
    }
  }

  Future stopMusic() async {
    await musicCont.doStopMusic();
  }

  Future playBackMusic() async {
    int _decrementIndex = selectedIndexCard.value;
    _decrementIndex--;

    if (_decrementIndex >= 0) {
      await stopMusic();
      await playAudio(
          url: playList.results[_decrementIndex].previewUrl,
          index: _decrementIndex);
    }
  }

  Future playNextMusic() async {
    int _incrementIndex = selectedIndexCard.value;
    _incrementIndex++;
    if (_incrementIndex <= playList.resultCount) {
      await playAudio(
          url: playList.results[_incrementIndex].previewUrl,
          index: _incrementIndex);
    }
  }

  void selectCardToggle(int index) {
    hasSelect.value = true;
    if (index != selectedIndexCard.value && hasSelect.isTrue) {
      selectedIndexCard.value = index;
    } else {
      hasSelect.value = false;
      selectedIndexCard.value = 1000;
    }
  }

  Future showPlaylistByArtistSearched({required String keyword}) async {
    change(null, status: RxStatus.loading());
    await _searchRepository
        .getPlaylistByArtistSearched(keyword: keyword)
        .then((value) {
      playList = value;
      value.results.isNotEmpty
          ? change(value, status: RxStatus.success())
          : change(null, status: RxStatus.empty());
    }).catchError((err) {
      change(null, status: RxStatus.error(err.toString()));
      SnackbarUtil.showError(message: err.toString());
    });
  }
}
