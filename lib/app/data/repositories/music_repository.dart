import 'package:just_audio/just_audio.dart';

import '../../utils/snackbar.util.dart';

class MusicRepository {
  final player = AudioPlayer();

  Future initPlayerMusic(String url) async {
    await player.setUrl(url);
  }

  playMusic() {
    try {
      player.play();
    } on PlayerException catch (err) {
      SnackbarUtil.showError(message: 'Error message ${err.message}');
    } on PlayerInterruptedException catch (err) {
      SnackbarUtil.showError(message: 'Connection aborted ${err.message}');
    } catch (err) {
      SnackbarUtil.showError(message: 'Error message ${err.toString()}');
    }
  }

  Future pauseMusic() async {
    try {
      await player.pause();
    } on PlayerException catch (err) {
      SnackbarUtil.showError(message: 'Error message ${err.message}');
    } on PlayerInterruptedException catch (err) {
      SnackbarUtil.showError(message: 'Connection aborted ${err.message}');
    } catch (err) {
      SnackbarUtil.showError(message: 'Error message ${err.toString()}');
    }
  }

  Future stopMusic() async {
    try {
      await player.stop();
    } on PlayerException catch (err) {
      SnackbarUtil.showError(message: 'Error message ${err.message}');
    } on PlayerInterruptedException catch (err) {
      SnackbarUtil.showError(message: 'Connection aborted ${err.message}');
    } catch (err) {
      SnackbarUtil.showError(message: 'Error message ${err.toString()}');
    }
  }

  Future disposePlayer() async {
    await player.dispose();
  }

  double getMusicDuration() {
    return player.duration!.inMilliseconds.toDouble();
  }
}
