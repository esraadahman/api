part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class UploadProfilePic extends SignUpState {}


final class SignUpSuccess extends SignUpState {
  final String message;

  SignUpSuccess({required this.message});
}

final class SignUpLoading extends SignUpState {}

final class SignUpFailure extends SignUpState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}
