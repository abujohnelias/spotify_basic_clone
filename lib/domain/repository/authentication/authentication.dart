import 'package:dartz/dartz.dart';
import 'package:spotifyclone/data/models/authentication/create_user_req.dart';
import 'package:spotifyclone/data/models/authentication/signin_user_req.dart';

abstract class AuthenticationRepository {
  Future<Either> signUp(CreateUserReq createUserReq);

  Future<Either> signIn(SigninUserReq signinUserReq);

  Future<Either> getUser();
}
