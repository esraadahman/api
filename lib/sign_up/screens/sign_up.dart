import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_api/core/api/dio_consumer.dart';
import 'package:project_api/repositories/user_repository.dart';
import 'package:project_api/sign_up/cubit/cubit/sign_up_cubit.dart';
import 'package:project_api/sign_up/screens/widgets/upload_image.dart';
import 'package:project_api/sign_in/cubit/cubit/signin_cubit.dart';

class Sign_UP extends StatefulWidget {
  Sign_UP({Key? key});

  @override
  State<Sign_UP> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<Sign_UP> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SignUpCubit(userRepo(api: DioConsumer(dio: Dio()))),
        child:
            BlocConsumer<SignUpCubit, SignUpState>(listener: (context, state) {
          if (state is SignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          } else if (state is SignUpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errMessage),
              ),
            );
          }
        }, builder: (context, state) {
          final cubit = BlocProvider.of<SignUpCubit>(context);
          return Scaffold(
            body: Column(
              children: [
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 100),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(fontSize: 20),
                    )),
                PickImageWidget(
                  cubit: cubit,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: cubit.signup_email,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Email',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: cubit.signup_password,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: cubit.signup_name,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name ',
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    cubit.sign_up();
                  },
                  child: Container(
                      height: 50,
                      width: 300,
                      color: Colors.blue,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Center(
                          child: Text(
                        'Sign up ',
                        style: TextStyle(fontSize: 25),
                      ))),
                ),
              ],
            ),
          );
        }));
  }
}
