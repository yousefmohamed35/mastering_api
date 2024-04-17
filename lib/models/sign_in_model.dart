import 'package:api/core/api/end_points.dart';

class SignIn {
  final String message;
  final String token;

  SignIn({required this.message, required this.token});
  factory SignIn.fromJson(Map<String, dynamic> json) {
    return SignIn(
      message: json[ApiKey.message],
      token: json[ApiKey.token],
    );
  }
}
