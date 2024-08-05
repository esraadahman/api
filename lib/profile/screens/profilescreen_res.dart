import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_api/core/api/dio_consumer.dart';
import 'package:project_api/core/api/endPointes.dart';
import 'package:project_api/logout/screen/logout.dart';
import 'package:project_api/profile/cubit/cubit/profile_cubit.dart';
import 'package:project_api/repositories/user_repository.dart';

class ProfileScreen_res extends StatelessWidget {
  ProfileScreen_res({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileCubit(userRepo(api: DioConsumer(dio: Dio())))..getdataChach(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is GetUserFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<ProfileCubit>(context);
          return Scaffold(
            body: state is GetUserLoading
                ? CircularProgressIndicator()
                : state is GetuserSuccess
                    ? Center(
                        child: ListView(
                          children: [
                            SizedBox(height: 16),

                            //! Name
                            ListTile(
                              title: Text(state.data[ApiKey.name].toString()),
                              leading: Icon(Icons.person),
                            ),
                            SizedBox(height: 16),

                            //! Email
                            ListTile(
                              title: Text(state.data[ApiKey.email].toString()),
                              leading: Icon(Icons.email),
                            ),
                            SizedBox(height: 16),

                            ListTile(
                              title: Text(state.data[ApiKey.token].toString()),
                              leading: Icon(Icons.person),
                            ),
                            SizedBox(height: 50),
                            GestureDetector(
                              onTap: () {
                                   Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Logout(),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.all(20),
                                width: 100,
                                height: 40,
                                color: Colors.blue,
                                child: Center(
                                    child: Text(
                                  "Log out",
                                  style: TextStyle(fontSize: 30),
                                )),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
          );
        },
      ),
    );
  }
}
