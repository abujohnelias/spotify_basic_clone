import 'package:spotifyclone/domain/entities/authentication/user.dart';

abstract class ProfileInfoState {}

class ProfileInfoLoading extends ProfileInfoState {}

class ProfileInfoLoaded extends ProfileInfoState {
  final UserEntity userEntity;
  ProfileInfoLoaded({required this.userEntity});
}

class ProfileInfoLoadingFailure extends ProfileInfoState {}
