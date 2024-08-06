part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class GetPostsLoading extends HomeState {}

class GetPostsSuccess extends HomeState {
  final HomeModel model;

  GetPostsSuccess({required this.model});
}

class GetPostsFailure extends HomeState {
  final String errMessage;
  GetPostsFailure({required this.errMessage});
}
