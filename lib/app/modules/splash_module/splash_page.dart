import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_g/app/modules/splash_module/splash_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(child:Center(child: Text("Splash"))),
      ),
    );
  }
}
