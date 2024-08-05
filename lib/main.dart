import 'package:flutter/material.dart';
import 'package:project_api/core/api/endPointes.dart';
import 'package:project_api/profile/screens/profileScreen_req.dart';
import 'package:project_api/profile/screens/profilescreen_res.dart';
import 'package:project_api/sign_in/Screens/signin.dart';
import 'package:project_api/cache/cache_healper.dart';
import 'package:project_api/sign_up/screens/sign_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await  CacheHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: 
      CacheHelper().getData(key: ApiKey.id) ==null? SignIn(): ProfileScreen_res(),
    //  SignIn(),
    );
  }
}
