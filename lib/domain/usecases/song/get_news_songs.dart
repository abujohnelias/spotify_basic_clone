// import 'dart:developer';

// import 'package:dartz/dartz.dart';
// import 'package:spotifyclone/core/usecases/usecase.dart';
// import 'package:spotifyclone/data/repository/song/song_repository_impl.dart';
// import 'package:spotifyclone/service_locator.dart';

// class GetNewsSongsUseCase implements UseCase<Either, dynamic> {
//   @override
//   Future<Either> call({params}) async {
//     log("ullil 1");
//     return await sl<SongRepositoryImpl>().getNewsSongs();

//   }
// }

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
