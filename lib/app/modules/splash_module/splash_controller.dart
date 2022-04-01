import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:task_g/app/routes/app_pages.dart';
import '../../Constant/FirebaseContant.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SplashController extends GetxController {
  late Rx<User?> firebaseUser;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
   setUpFirebase();
  }

  setUpFirebase()async{
   await Firebase.initializeApp();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    print("Get Info ${firebaseUser.toString()}");
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    Timer(
        Duration(seconds: 3),
        () => {
              if (user != null)
                {
                  // user is logged in
                  Get.offNamed(Routes.HOME),
                }
              else
                {
                  // user is null as in user is not available or not logged in
                  Get.offNamed(Routes.LOGIN),
                }
            });
  }
}
