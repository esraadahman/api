import 'package:dartz/dartz.dart';
import 'package:project_api/cache/cache_healper.dart';
import 'package:project_api/core/api/api_consumer.dart';
import 'package:project_api/core/api/endPointes.dart';
import 'package:project_api/core/errors/exceptions.dart';
import 'package:project_api/profile/model/usermodel.dart';
import 'package:project_api/sign_in/models/sign_inModel.dart';
import 'package:project_api/sign_up/models/sign_upmodel.dart';

class userRepo {
  final ApiConsumer api;

  userRepo({required this.api});
  Future<Either<String, SignInModel>> sign_in(
      {required String email, required String pass}) async {
    try {
      final response = await api.post(EndPoint.signin,
          data: {ApiKey.email: email, ApiKey.password: pass});
      final user = SignInModel.fromJson(response);
      CacheHelper().saveData(key: ApiKey.token, value: user.data.token);
      CacheHelper().saveData(key: ApiKey.id, value: user.data.user.id);
      CacheHelper().saveData(key: ApiKey.email, value: user.data.user.email);
      CacheHelper().saveData(key: ApiKey.name, value: user.data.user.name);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, SignUpModel>> sign_up(
      {required String email,
      required String pass,
      required String name}) async {
    try {
      final response = await api.post(EndPoint.signup, isFromData: true, data: {
        ApiKey.email: email,
        ApiKey.password: pass,
        ApiKey.name: name,
// to send image
//ApiKey.profilePic: await uploadImageToAPI(profilePic!)
      });
      final user = SignUpModel.fromJson(response);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, UserModel>> getUserProfile() async {
    try {
      final response = await api.get(
        EndPoint.getuserDataEndPoint(
          CacheHelper().getData(key: ApiKey.id),
        ),
      );
      return Right(UserModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, Map<String , dynamic>>> getdataChach() async {
    print("enter function");
    try {
      final Map<String, dynamic> data = {};
      data[ApiKey.email] = await CacheHelper().getData(key: ApiKey.email);
      data[ApiKey.name] = await CacheHelper().getData(key: ApiKey.name);
      data[ApiKey.token] = await CacheHelper().getData(key: ApiKey.token);
      print(
          "email ${data[ApiKey.email]}   name ${data[ApiKey.name]}  token ${data[ApiKey.token]}");

      print("end function ");
      return Right(data);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }
}
