import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotifyclone/presentation/song_player/bloc/song_player_state.dart';

class SongPlayerCubit extends Cubit<SongPlayerState> {
  AudioPlayer audioPlayer = AudioPlayer();

  Duration songDuration = Duration.zero;
  Duration songPosition = Duration.zero;
  SongPlayerCubit() : super(SongPlayerLoading()) {
    audioPlayer.positionStream.listen(
      (postion) {
        songPosition = postion;
        updateSongPlayer();
      },
    );
    audioPlayer.durationStream.listen(
      (duration) {
        songDuration = duration!;
      },
    );
  }

  void updateSongPlayer() {
    emit(
      SongPlayerLoaded(),
    );
  }

  Future<void> loadSong(String url) async {
    try {
      await audioPlayer.setUrl(url);
      log("song vannu");
      emit(SongPlayerLoaded());
    } catch (e) {
      log(e.toString(), name: 'song vanno?');
      emit(
        SongPlayerLoadFailure(),
      );
    }
  }

  void playOrPauseSong() {
    if (audioPlayer.playing) {
      audioPlayer.stop();
    } else {
      audioPlayer.play();
    }
    emit(SongPlayerLoaded());
  }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}
