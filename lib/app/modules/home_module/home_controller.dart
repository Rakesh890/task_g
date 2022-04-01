import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_version/new_version.dart';
import 'package:task_g/app/routes/app_pages.dart';

import '../../Constant/FirebaseContant.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class HomeController extends GetxController
{

  var userDiceCount=0.obs;
  var imageArray = ['one.png', 'two.png', 'three.png', 'four.png', 'five.png', 'six.png'];
  var randomIntForDiceOne = Random().nextInt(5).obs;
  var appVersion="".obs;
  var selectBottomIndex=0.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentUser();
    getPackageInfo();
  }

  getCurrentUser() {
    User? user = FirebaseAuth.instance.currentUser;
    String username = user!.displayName.toString();
    print( "User ${username}");
  }

  getPackageInfo() async {
    final newVersion = NewVersion(
      iOSId: 'com.example.task_g',
      androidId: 'com.example.task_g',
    );
    appVersion.value  = "1.0.0";

   //  PackageInfo packageInfo = await PackageInfo.fromPlatform();
   //  appVersion.value= packageInfo.version;
   // print("App Version ${appVersion}");
  }


  changeImage()
  {
    if(userDiceCount.value < 10 && userDiceCount.value != 10){
      userDiceCount.value++;
      print(userDiceCount.value);
      randomIntForDiceOne.value = Random().nextInt(6);
    }else{
      Get.snackbar("Err", "You can play only 10 times ${userDiceCount.value}",
      backgroundColor: Colors.black,
      colorText: Colors.white,);
    }

  }

  logout()
  {
    try {
        auth.signOut();
      } catch (e) {
        print(e.toString());
      }
  }

  selectBottomTab(int value)
  {
    selectBottomIndex.value = value;
  }

  openLeaderBoard()
  {
    Get.toNamed(Routes.LEADERBOARD);
  }
}
