import 'package:spotifyclone/core/usecases/usecase.dart';
import 'package:spotifyclone/domain/repository/song/song.dart';
import 'package:spotifyclone/service_locator.dart';

class IsFavoriteSongUseCase implements UseCase<bool, String> {
  @override
  Future<bool> call({String? params}) async {
    return await sl<SongsRepostiory>().isFavoriteSong(params!);
  }
}
