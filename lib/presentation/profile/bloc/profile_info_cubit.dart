import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotifyclone/domain/usecases/authentication/get_user.dart';
import 'package:spotifyclone/presentation/profile/bloc/profile_info_state.dart';
import 'package:spotifyclone/service_locator.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> {
  ProfileInfoCubit() : super(ProfileInfoLoading());

  Future<void> getUser() async {
    log("hai");
    var user = await sl<GetUserUseCase>().call();

    user.fold(
      (l) {
        emit(ProfileInfoLoadingFailure());
      },
      (userEntity) {
        log(userEntity.toString());
        emit(ProfileInfoLoaded(userEntity: userEntity));
      },
    );
  }
}
