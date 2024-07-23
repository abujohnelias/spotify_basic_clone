import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:spotifyclone/data/models/authentication/create_user_req.dart';
import 'package:spotifyclone/data/models/authentication/signin_user_req.dart';
import 'package:spotifyclone/data/sources/authentication/auth_firebase_service.dart';
import 'package:spotifyclone/domain/repository/authentication/authentication.dart';
import 'package:spotifyclone/service_locator.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  @override
  Future<Either> signIn(SigninUserReq signinUserReq) async {
    return await sl<AuthenticationFirebaseService>().signIn(signinUserReq);
  }

  @override
  Future<Either> signUp(CreateUserReq createUserReq) async {
    return await sl<AuthenticationFirebaseService>().signUp(createUserReq);
  }

  @override
  Future<Either> getUser() async {
    log("ivade il kitty");
    return await sl<AuthenticationFirebaseService>().getUser();
  }
}
