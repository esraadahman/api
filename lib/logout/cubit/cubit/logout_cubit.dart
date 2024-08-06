import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:project_api/cache/cache_healper.dart';
import 'package:project_api/core/api/api_consumer.dart';
import 'package:project_api/core/api/endPointes.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this.api) : super(LogoutInitial());

  final ApiConsumer api;

  Future<void> logout() async {
    try {
      emit(LogoutLoading());
    //  final token = CacheHelper().getData(key: ApiKey.token);
      final response = await api.post(
        EndPoint.logout,
      );
       CacheHelper().removeData(key: ApiKey.token);
       CacheHelper().removeData(key: ApiKey.id);
          CacheHelper().removeData(key: ApiKey.name);
      print("loged out");
      emit(LogoutSuccess());
    } on DioException catch (e) {
      emit(LogoutFailure(errMessage: e.toString()));
    } catch (e) {
      emit(LogoutFailure(errMessage: e.toString()));
    }
  }
}
