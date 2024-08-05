import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_api/core/api/dio_consumer.dart';
import 'package:project_api/profile/cubit/cubit/profile_cubit.dart';
import 'package:project_api/repositories/user_repository.dart';
import 'package:project_api/sign_in/models/sign_inModel.dart';

class ProfileScreen extends StatelessWidget {
  

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileCubit(userRepo(api: DioConsumer(dio: Dio())))..getuserProfile(),
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
          return Scaffold(
            body: state is GetUserLoading
                ? CircularProgressIndicator()
                : state is GetUserSuccess
                    ? ListView(
                        children: [
                          SizedBox(height: 16),
                          //! Profile Picture
                          CircleAvatar(
                            radius: 80,
                            backgroundImage:
                                NetworkImage(state.user.profilePic),
                          ),
                          SizedBox(height: 16),

                          //! Name
                          ListTile(
                            title: Text(state.user.name),
                            leading: Icon(Icons.person),
                          ),
                          SizedBox(height: 16),

                          //! Email
                          ListTile(
                            title: Text(state.user.email),
                            leading: Icon(Icons.email),
                          ),
                          SizedBox(height: 16),

                          //! Phone number
                          ListTile(
                            title: Text(state.user.phone),
                            leading: Icon(Icons.phone),
                          ),
                          SizedBox(height: 16),

                          //! Address
                          ListTile(
                            title: Text(state.user.address.toString()),
                            leading: Icon(Icons.location_city),
                          ),
                          SizedBox(height: 16),
                        ],
                      )
                    : Container(),
          );
        },
      ),
    );
  }
}
