import 'package:dartz/dartz.dart';

abstract class SongsRepostiory {
   Future <Either> getNewsSongs();
   Future <Either> getPlaylist();
   Future <Either> addOrRemoveFavoriteSongs(String songId);
   Future <bool> isFavoriteSong(String songId);
   Future <Either> getUserFavoriteSongs();
}