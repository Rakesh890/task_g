import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_g/app/Constant/FirebaseContant.dart';
import 'package:task_g/app/modules/home_module/home_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home )'),
      actions: [
        IconButton(onPressed: () => controller.logout(), icon: Icon(Icons.logout))
      ]),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
            () => Center(child:
                  Image.asset('assets/images/'+controller.imageArray[controller.randomIntForDiceOne.value], height: 100, width: 100,)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: RaisedButton(onPressed:() => controller.changeImage(),
                child: Text('Roll Dice'),
              ),
            )
          ],
        ),
      ),

    );
  }
}
