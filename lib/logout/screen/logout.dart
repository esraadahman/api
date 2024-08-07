import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_api/core/api/dio_consumer.dart';
import 'package:project_api/logout/cubit/cubit/logout_cubit.dart';
import 'package:project_api/sign_in/Screens/signin.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutCubit(DioConsumer(dio: Dio())),
      child: BlocConsumer<LogoutCubit, LogoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<LogoutCubit>(context);
          return Scaffold(
            body: Center(
              child: Container(
                child: GestureDetector(
                  onTap: () {
                    cubit.logout();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignIn(),
                      ),
                    );
                  },
                  child: Container(
                    //  margin: EdgeInsets.all(20),
                    width: 150,
                    height: 40,
                    color: Colors.blue,
                    child: Center(
                        child: Text(
                      "Log out",
                      style: TextStyle(fontSize: 30),
                    )),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
