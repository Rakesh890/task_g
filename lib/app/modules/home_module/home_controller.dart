import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constant/FirebaseContant.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class HomeController extends GetxController
{

  var userDiceCount=0.obs;
  var imageArray = ['one.png', 'two.png', 'three.png', 'four.png', 'five.png', 'six.png'];
  var randomIntForDiceOne = Random().nextInt(5).obs;
  late Rx<User?> firebaseUser;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    firebaseUser = Rx<User?>(auth.currentUser);
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
}
