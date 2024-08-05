import 'package:project_api/core/api/endPointes.dart';

class SignUpModel{
  final bool status;
  final String message;

  SignUpModel({required this.status, required this.message});

    factory SignUpModel.fromJson(Map<String, dynamic> jsonData) {
    return SignUpModel(
      status: jsonData[ApiKey.status],
      message: jsonData[ApiKey.message],
    );
  }
}