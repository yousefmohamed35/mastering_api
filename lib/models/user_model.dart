import 'package:api/core/api/end_points.dart';

class UserModel {
  final String name;
  final String email;
  final String profilePic;
  final String phone;
  final Map<String, dynamic> address;

  UserModel(
      {required this.name,
      required this.email,
      required this.profilePic,
      required this.phone,
      required this.address});
  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      name: jsonData['user'][ApiKey.name],
      email: jsonData['user'][ApiKey.email],
      profilePic: jsonData['user'][ApiKey.profilePic],
      phone: jsonData['user'][ApiKey.phone],
      address: jsonData['user'][ApiKey.location],
    );
  }
}
