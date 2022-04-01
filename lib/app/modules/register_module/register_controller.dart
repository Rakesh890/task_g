import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      await  auth.createUserWithEmailAndPassword(email: email, password: password).then((value) =>
      {
        if(value != null){
          user = value.user!,
          user.updateProfile(displayName: name),
          Get.offNamed(Routes.HOME),
          Get.snackbar("Success", "Successfully Account Registered",backgroundColor: Colors.black,
            colorText: Colors.white,
          ),
        }else{
          print("Unable to register your account"),
        }

      });
    }catch(e){
      Get.snackbar("About User", "User message",);
    }

  }

}
