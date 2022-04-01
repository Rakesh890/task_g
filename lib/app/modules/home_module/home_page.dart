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
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text('Home'), elevation: 0, actions: [
        IconButton(
            onPressed: () => controller.logout(), icon: Icon(Icons.logout))
      ]),
      body: Container(
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(
                    "Current User : ${auth.currentUser!.displayName}"
                        .toUpperCase(),
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${controller.appVersion.value}",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
            ),
            Divider(
              color: Colors.white,
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => Center(
                  child: Image.asset(
                'assets/images/' +
                    controller.imageArray[controller.randomIntForDiceOne.value],
                height: 100,
                width: 100,
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: RaisedButton(
                onPressed: () => controller.changeImage(),
                color: Colors.white,
                elevation: 1,
                child: Text(
                  'Roll Dice',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}
