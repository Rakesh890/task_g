import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_g/app/modules/home_module/home_page.dart';
import 'package:task_g/app/modules/login_module/login_bindings.dart';
import 'package:task_g/app/modules/login_module/login_page.dart';
import 'package:task_g/app/modules/splash_module/splash_bindings.dart';
import 'package:task_g/app/routes/app_pages.dart';

import 'app/AuthController.dart';
import 'app/Constant/FirebaseContant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: SplashBinding(),
      initialRoute: Routes.SPLASH,
      getPages: AppPages.pages,
    );
  }
}



