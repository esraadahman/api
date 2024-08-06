import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_api/core/api/dio_consumer.dart';
import 'package:project_api/core/api/endPointes.dart';
import 'package:project_api/home/cubit/cubit/home_cubit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(DioConsumer(dio: Dio()))..getallPosts(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<HomeCubit>(context);
          if (state is GetPostsLoading) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              ),
            );
          } else {
            if (state is GetPostsSuccess) {
              return Scaffold(
                  appBar: AppBar(
                    title: Text("Posts"),
                    centerTitle: true,
                  ),
                  body: ListView.separated(
                    itemCount: state.model.data.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(state.model.data[index].title),
                          SizedBox(
                            height: 10,
                          ),
                          Text(state.model.data[index].description),
                          SizedBox(
                            height: 10,
                          ),
                          // Text(state.model.data[index].createdAt!),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // Text(state.model.data[index].updatedAt!),
                          // SizedBox(
                          //   height: 10,
                          // ),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Divider(
                          color: Colors.green,
                          thickness: 3,
                        ),
                      );
                    },
                  ));
            } else {
              return Scaffold(
                body: Center(child: Text("error")),
              );
            }
          }
        },
      ),
    );
  }
}
