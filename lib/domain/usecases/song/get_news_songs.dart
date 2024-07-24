import 'package:dartz/dartz.dart';
import 'package:spotifyclone/core/usecases/usecase.dart';
import 'package:spotifyclone/domain/repository/song/song.dart';
import '../../../service_locator.dart';

class GetNewsSongsUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongsRepostiory>().getNewsSongs();
  }
}
