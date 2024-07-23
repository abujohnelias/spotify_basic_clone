import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotifyclone/domain/entities/song/song.dart';
import 'package:spotifyclone/domain/usecases/song/get_favorite_songs.dart';
import 'package:spotifyclone/presentation/profile/bloc/favorite_songs_state.dart';
import 'package:spotifyclone/service_locator.dart';

class FavoriteSongsCubit extends Cubit<FavoriteSongsState> {
  FavoriteSongsCubit() : super(FavoriteSongsLoading());

  List<SongEntity> favoriteSongs = [];
  Future<void> getFavoriteSongs() async {
    var result = await sl<GetFavoriteSongsUseCase>().call();

    result.fold(
      (l) {
        emit(FavoriteSongsLoadingFailure());
      },
      (r) {
        favoriteSongs = r;
        emit(FavoriteSongsLoaded(favoriteSongs: favoriteSongs));
      },
    );
  }

  void removeSong(int index) {
    favoriteSongs.removeAt(index);

    emit(
      FavoriteSongsLoaded(favoriteSongs: favoriteSongs),
    );
  }
}
