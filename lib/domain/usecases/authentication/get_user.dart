import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:spotifyclone/core/usecases/usecase.dart';
import 'package:spotifyclone/domain/repository/authentication/authentication.dart';
import 'package:spotifyclone/service_locator.dart';

class GetUserUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    log("thisthisthisthis");
    return await sl<AuthenticationRepository>().getUser();
  }
}
