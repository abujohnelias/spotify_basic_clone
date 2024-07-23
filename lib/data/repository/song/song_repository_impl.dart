import 'package:dartz/dartz.dart';
import 'package:spotifyclone/data/sources/song/song_firebase_service.dart';
import 'package:spotifyclone/domain/repository/song/song.dart';
import 'package:spotifyclone/service_locator.dart';

// class SongRepositoryImpl extends SongsRepostiory {
//   @override
//   Future<Either> getNewsSongs() async {
//     log("ullil ullil 1");
//     return await sl<SongFirebaseService>().getNewsSongs();
//   }
// }

class SongRepositoryImpl extends SongsRepostiory {
  @override
  Future<Either> getNewsSongs() async {
    return await sl<SongFirebaseService>().getNewsSongs();
  }

  @override
  Future<Either> getPlaylist() async {
    return await sl<SongFirebaseService>().getPlayList();
  }

  @override
  Future<Either> addOrRemoveFavoriteSongs(String songId) async {
    return await sl<SongFirebaseService>().addOrRemoveFavoriteSongs(songId);
  }

  @override
  Future<bool> isFavoriteSong(String songId) async {
    return await sl<SongFirebaseService>().isFavoriteSong(songId);
  }

  @override
  Future<Either> getUserFavoriteSongs() async {
    return await sl<SongFirebaseService>().getUserFavoriteSongs();
  }

  // @override
  // Future<Either> getUserFavoriteSongs() async {
  //   return await sl<SongFirebaseService>().getUserFavoriteSongs();
  // }

  // @override
  // Future<Either> addOrRemoveFavoriteSongs(String songId) async {
  //   return await sl<SongFirebaseService>().addOrRemoveFavoriteSong(songId);
  // }

  // @override
  // Future<bool> isFavoriteSong(String songId) async {
  //   return await sl<SongFirebaseService>().isFavoriteSong(songId);
  // }
}
