import 'package:spotifyclone/domain/entities/authentication/user.dart';

class UserModel {
  String? fullName;
  String? email;
  String? imageURL;

  UserModel({
    this.fullName,
    this.email,
    this.imageURL,
  });

  UserModel.fromJson(Map<String, dynamic> data) {
    fullName = data['name'];
    email = data['email'];
  }
}

//extension to convert user model to user entity
extension UserModelX on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      fullName: fullName,
      email: email,
      imageURL: imageURL,
    );
  }
}
