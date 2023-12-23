
import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  static final AudioPlayer _audioPlayer = AudioPlayer();
  static bool _isPlaying = false;

  static Future<void> playBackgroundMusic() async {
    if (!_isPlaying) {
      _audioPlayer.setReleaseMode(ReleaseMode.loop); // Установка режима повторения
      await _audioPlayer.play(AssetSource("../assets/audio/my_audio.mp3"));
      _isPlaying = true;
    }
  }

  static void pauseBackgroundMusic() {
    if (_isPlaying) {
      _audioPlayer.pause();
      _isPlaying = false;
    }
  }

  static void stopBackgroundMusic() {
    _audioPlayer.stop();
    _isPlaying = false;
  }

  static bool get isPlaying => _isPlaying;
}
