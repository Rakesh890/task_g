import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_g/app/modules/home_module/home_page.dart';
import 'package:task_g/app/routes/app_pages.dart';


class RegisterController extends GetxController
{

  GlobalKey<FormState> registerFormKey = GlobalKey();
  TextEditingController emailControoler = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameContoller = TextEditingController();

  var passwordVisible = false.obs;
  var isShowloader=false.obs;
  late User user;
  var sevriceResponse;
  FirebaseAuth auth = FirebaseAuth.instance;

  showPassword() {
    if (passwordVisible == false) {
      passwordVisible.value = true;
    } else {
      passwordVisible.value = false;
    }
  }

  registerBtn() {
    if(registerFormKey.currentState!.validate())
    {
      String name = fullNameContoller.text;
      String email = emailControoler.text;
      String password = passwordController.text;
      register(name,email,password);
    }
  }

  void register(String name,String email, password)async{
    try{
      isShowloader.value=true;
      await auth.createUserWithEmailAndPassword(email: email, password: password).then((value) =>
      {
        isShowloader.value=false,
        if(value != null){
          user = value.user!,
          user.updateProfile(displayName: name),
          addUserInfo(user,name),
          Get.snackbar("Success",
            "Successfully Account Registered",
            backgroundColor: Colors.black,
            colorText: Colors.white,
          ),
          Get.offNamed(Routes.HOME),
        }else{
          isShowloader.value=false,
          print("Unable to register your account"),
        }

      });
    }catch(e){
      isShowloader.value=false;
      Get.snackbar("Error", "${e.toString()}",);
    }

  }
  Future<void> addUserInfo(User user,name)
  {
    // Call the user's CollectionReference to add a new user
    return FirebaseFirestore.instance.collection("Users")
        .add({
      "Name":"${name}",
      "Email":"${user.email}",
      "isPlaying":"false",
      "Attempt":"0",
      "Score":"0",
      "Uid":"${user.uid}"
    }).then((value) =>
    {
      print("Added user info"),
    }).catchError((error) => print("Failed to add user: $error"));
  }
}
