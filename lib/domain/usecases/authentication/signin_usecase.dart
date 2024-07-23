import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:spotifyclone/core/usecases/usecase.dart';
import 'package:spotifyclone/data/models/authentication/signin_user_req.dart';
import 'package:spotifyclone/domain/repository/authentication/authentication.dart';
import 'package:spotifyclone/service_locator.dart';

class SigninUseCase implements UseCase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) async {
    log("evdelim 1");
    return sl<AuthenticationRepository>().signIn(params!);
  }
}
