import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_api/core/api/dio_consumer.dart';
import 'package:project_api/home/screens/home.dart';
import 'package:project_api/profile/screens/profileScreen_req.dart';
import 'package:project_api/profile/screens/profilescreen_res.dart';
import 'package:project_api/repositories/user_repository.dart';
import 'package:project_api/sign_up/screens/widgets/upload_image.dart';
import 'package:project_api/sign_in/cubit/cubit/signin_cubit.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key});

  @override
  State<SignIn> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(userRepo(api: DioConsumer(dio: Dio()))),
      child: BlocConsumer<SigninCubit, SigninState>(
        listener: (context, state) {
            if (state is SignInSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("succes"),
                
              ),
            );
              
          } else if (state is  SignInfailer) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<SigninCubit>(context);
          
          return Scaffold(
            body: Column(
              children: [
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 100),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),
                    
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: cubit.nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: cubit.passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
              SizedBox(
                height: 50,
              ),
                State is SignInloading
                    ? CircularProgressIndicator()
                    : GestureDetector(
                        onTap: () {
                          cubit.signin();
                           Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                                //  ProfileScreen_res(),
                            ),
                          );
                        },
                        child: Container(
                            height: 50,
                            width: 300,
                            color: Colors.blue,
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Center(
                                child: Text(
                              'Login',
                              style: TextStyle(fontSize: 25),
                            ))),
                      ),
            
              ],
            ),
          );
        },
      ),
    );
  }
}
