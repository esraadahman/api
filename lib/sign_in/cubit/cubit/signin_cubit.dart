import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:project_api/cache/cache_healper.dart';
import 'package:project_api/core/api/api_consumer.dart';
import 'package:project_api/core/api/endPointes.dart';
import 'package:project_api/core/errors/exceptions.dart';
import 'package:project_api/repositories/user_repository.dart';
import 'package:project_api/sign_in/models/sign_inModel.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.userrepo) : super(SigninInitial());
  final userRepo userrepo;

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SignInModel? user;

  signin() async {
    emit(SignInloading());
    final response = await userrepo.sign_in(
        email: nameController.text, pass: passwordController.text);
    response.fold((erromessage) {
      emit(SignInfailer(errorMessage: erromessage));
    }, (SignInModel) {
      emit(SignInSuccess());
    });
  }
}
