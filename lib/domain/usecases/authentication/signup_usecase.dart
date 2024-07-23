import 'package:dartz/dartz.dart';
import 'package:spotifyclone/core/usecases/usecase.dart';
import 'package:spotifyclone/data/models/authentication/create_user_req.dart';
import 'package:spotifyclone/domain/repository/authentication/authentication.dart';
import 'package:spotifyclone/service_locator.dart';

class SignupUsecase implements UseCase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) async {
    return sl<AuthenticationRepository>().signUp(params!);
  }
}
