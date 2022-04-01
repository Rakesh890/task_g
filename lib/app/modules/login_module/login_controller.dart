import 'dart:convert';
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
        Get.snackbar("Successfully", "You Have Successfully Logged In",
          backgroundColor: Colors.black,
          colorText: Colors.white,),
          Get.offNamed(Routes.HOME),
        },
      });
    }catch(e){
      isShowLoader.value=false;
      Get.snackbar("About Login", "Login message",);
    }
  }


}
