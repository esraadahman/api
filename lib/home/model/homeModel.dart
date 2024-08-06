import 'package:project_api/core/api/endPointes.dart';

class HomeModel {
  final bool status;
  final String message;
  final List<PostData> data;

  HomeModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> jsonData) {
    return HomeModel(
      status: jsonData[ApiKey.status],
      message: jsonData[ApiKey.message],
      data: (jsonData[ApiKey.data] as List)
          .map((item) => PostData.fromJson(item))
          .toList(),
      //PostData.fromJson(jsonData[ApiKey.data]),
      //(jsonData[ApiKey.data] as List).map((item) => PostData.fromJson(item)).toList(),
    );
  }
}

class PostData {
  final int id;
  final String title;
  final String description;
  final int? user_id;
  final String? createdAt;
  final String? updatedAt;

  PostData({
    required this.id,
    required this.title,
    required this.description,
    this.user_id,
    this.createdAt,
    this.updatedAt,
  });

  factory PostData.fromJson(Map<String, dynamic> jsonData) {
    return PostData(
        id: jsonData[ApiKey.id],
      title: jsonData[ApiKey.title],
      description: jsonData[ApiKey.description],
      user_id: jsonData[ApiKey.user_id],
      createdAt: jsonData[ApiKey.created_at],
      updatedAt: jsonData[ApiKey.updated_at],
    );
  }
}


