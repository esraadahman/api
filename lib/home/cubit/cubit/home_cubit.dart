import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_api/cache/cache_healper.dart';
import 'package:project_api/core/api/api_consumer.dart';
import 'package:project_api/core/api/endPointes.dart';
import 'package:project_api/core/errors/exceptions.dart';
import 'package:project_api/home/model/homeModel.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.api) : super(HomeInitial());

  final ApiConsumer api;

  Future<void> getallPosts() async {
    try {
      emit(GetPostsLoading());

      final response = await api.get(
        EndPoint.getallPosts,
      );
      final posts = HomeModel.fromJson(response);
      print("get all posts");
      emit(GetPostsSuccess(model: posts));
    } on ServerException catch (e) {
      emit(GetPostsFailure(errMessage: e.toString()));
    }
  }
}
