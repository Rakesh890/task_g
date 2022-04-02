import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_g/app/routes/app_pages.dart';

import '../../Constant/FirebaseContant.dart';



class LoginController extends GetxController{

  var passwordVisible=false.obs;
  late TextEditingController emailControoler,passwordController;
  GlobalKey<FormState> loginFormKey = GlobalKey();
  var isShowLoader = false.obs;
  late User user;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    emailControoler = TextEditingController();
    passwordController = TextEditingController();
    //our user would be notified
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }



  showPassword()
  {
    if(passwordVisible == false)
      {
        passwordVisible.value =true;
      }else{
      passwordVisible.value = false;
    }
  }

  loginButton()
  {
    if(loginFormKey.currentState!.validate()){
      print("Come in this section");
      var email = emailControoler.text.toString();
      var password = passwordController.text.toString();
      isShowLoader.value=true;
      login(email, password);
    }else{
      print("Come in this");
    }
  }

  Future login(String email, password) async{
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password).then((value) =>
      {
        isShowLoader.value=false,
        if(value != null){
          addUserInfo(user),
        },
      });
    }catch(e){
      isShowLoader.value=false;
      // Get.snackbar("About Login", "Login message",);
    }
  }


  Future<void> addUserInfo(User user)
  {
    // Call the user's CollectionReference to add a new user
    return FirebaseFirestore.instance.collection("Users")
        .add({
      "Name":"${user.displayName}",
      "Email":"${user.email}",
      "isPlaying":"false",
      "Attempt":"0",
      "Score":"0",
      "Uid":"${user.uid}"
    }).then((value) =>
    {
      print("Added user info"),
      Get.snackbar("Successfully", "You Have Successfully Logged In",
        backgroundColor: Colors.black,
        colorText: Colors.white,),
      Get.offNamed(Routes.HOME),
    }).catchError((error) => print("Failed to add user: $error"));
  }


}
