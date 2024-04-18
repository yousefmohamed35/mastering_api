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
      name: jsonData[ApiKey.name],
      email: jsonData[ApiKey.email],
      profilePic: jsonData[ApiKey.profilePic],
      phone: jsonData[ApiKey.phone],
      address: jsonData[ApiKey.location],
    );
  }
}
