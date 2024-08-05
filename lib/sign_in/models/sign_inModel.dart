import 'package:project_api/core/api/endPointes.dart';

class SignInModel {
  final bool status;
  final String message;
  final UserData data;

  SignInModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SignInModel.fromJson(Map<String, dynamic> jsonData) {
    return SignInModel(
      status: jsonData[ApiKey.status],
      message: jsonData[ApiKey.message],
      data: UserData.fromJson(jsonData[ApiKey.data]),
    );
  }
}

class UserData {
  final User user;
  final String token;

  UserData({
    required this.user,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> jsonData) {
    return UserData(
      user: User.fromJson(jsonData[ApiKey.user]),
      token: jsonData[ApiKey.token],
    );
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final String? emailVerifiedAt;
  final String? createdAt;
  final String? updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> jsonData) {
    return User(
      id: jsonData[ApiKey.id],
      name: jsonData[ApiKey.name],
      email: jsonData[ApiKey.email],
      emailVerifiedAt: jsonData[ApiKey.email_verified_at],
      createdAt: jsonData[ApiKey.created_at],
      updatedAt: jsonData[ApiKey.updated_at],
    );
  }
}
