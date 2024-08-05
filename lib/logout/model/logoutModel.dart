import 'package:project_api/core/api/endPointes.dart';

class LogoutModel {
  final bool status;
  final String message;

  LogoutModel({required this.status, required this.message});

  factory LogoutModel.fromJson(Map<String, dynamic> jsonData) {
    return LogoutModel(
      status: jsonData[ApiKey.status],
      message: jsonData[ApiKey.message],
    );
  }
}
