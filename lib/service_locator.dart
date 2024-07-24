import 'package:get_it/get_it.dart';
import 'package:spotifyclone/data/repository/authentication/authentication_repository_impl.dart';
import 'package:spotifyclone/data/repository/song/song_repository_impl.dart';
import 'package:spotifyclone/data/sources/authentication/auth_firebase_service.dart';
import 'package:spotifyclone/data/sources/song/song_firebase_service.dart';
import 'package:spotifyclone/domain/repository/authentication/authentication.dart';
import 'package:spotifyclone/domain/repository/song/song.dart';
import 'package:spotifyclone/domain/usecases/authentication/get_user.dart';
import 'package:spotifyclone/domain/usecases/authentication/signin_usecase.dart';
import 'package:spotifyclone/domain/usecases/authentication/signup_usecase.dart';
import 'package:spotifyclone/domain/usecases/song/add_or_remove_favorite_song.dart';
import 'package:spotifyclone/domain/usecases/song/get_favorite_songs.dart';
import 'package:spotifyclone/domain/usecases/song/get_news_songs.dart';
import 'package:spotifyclone/domain/usecases/song/get_playlist.dart';
import 'package:spotifyclone/domain/usecases/song/is_favorite_song.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthenticationFirebaseService>(
      AuthenticationFirebaseServiceImpl());

  sl.registerSingleton<SongFirebaseService>(SongFirebaseServiceImpl());

  sl.registerSingleton<AuthenticationRepository>(
      AuthenticationRepositoryImpl());

  sl.registerSingleton<SongsRepostiory>(SongRepositoryImpl());

  sl.registerSingleton<SignupUsecase>(SignupUsecase());

  sl.registerSingleton<SigninUseCase>(SigninUseCase());

  sl.registerSingleton<GetNewsSongsUseCase>(GetNewsSongsUseCase());

  sl.registerSingleton<GetPlayListUseCase>(GetPlayListUseCase());

  sl.registerSingleton<AddOrRemoveFavoriteSongUseCase>(
      AddOrRemoveFavoriteSongUseCase());

  sl.registerSingleton<IsFavoriteSongUseCase>(IsFavoriteSongUseCase());

  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());

  sl.registerSingleton<GetFavoriteSongsUseCase>(GetFavoriteSongsUseCase());
}
