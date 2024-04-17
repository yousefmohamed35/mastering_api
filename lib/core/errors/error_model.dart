import 'package:api/core/api/end_points.dart';

class ErorrModel {
  final String message;
  final int code;

  ErorrModel({required this.message, required this.code});
  factory ErorrModel.fromJson(Map<String, dynamic> json) {
    return ErorrModel(
      message: json[ApiKey.errorMessage],
      code: json[ApiKey.status],
    );
  }
}
