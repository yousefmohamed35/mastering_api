class ErorrModel {
  final String message;
  final int code;

  ErorrModel({required this.message, required this.code});
  factory ErorrModel.fromJson(Map<String, dynamic> json) {
    return ErorrModel(
      message: json['ErrorMessage'],
      code: json['status'],
    );
  }
}
