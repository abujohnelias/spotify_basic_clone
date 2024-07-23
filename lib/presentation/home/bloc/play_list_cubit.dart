import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotifyclone/domain/usecases/song/get_playlist.dart';
import 'package:spotifyclone/presentation/home/bloc/play_list_state.dart';
import 'package:spotifyclone/service_locator.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PlayListLoading());

  Future<void> getPlayList() async {
    var returnedSongs = await sl<GetPlayListUseCase>().call();

    returnedSongs.fold(
      (l) {
        debugPrint("playlist failed");
        emit(PlayListLoadFailure());
      },
      (data) {
        debugPrint("playlist loaded");
        emit(PlayListLoaded(songs: data));
      },
    );
  }
}
