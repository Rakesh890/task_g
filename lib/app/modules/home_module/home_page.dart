import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_g/app/Constant/FirebaseContant.dart';
import 'package:task_g/app/modules/home_module/home_controller.dart';


class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text('Home'), elevation: 0, actions: [
        IconButton(
            onPressed: () => controller.logout(), icon: Icon(Icons.logout)),
        IconButton(onPressed: () => controller.openLeaderBoard(), icon: Icon(Icons.leaderboard))
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
                  Row(
                    children: [
                      Text("Welcome", style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),),
                      SizedBox(width: 10,),
                      Text(
                        "${auth.currentUser!.displayName}"
                            .toUpperCase(),
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
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
            Obx(() => Center(
                child: Text("Score : ${controller.userScore.value}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24
                ),),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(
                () => Center(
                    child: Image.asset(
                  'assets/images/' +
                      controller.imageArray[controller.randomIntForDiceOne.value],
                  height: 100,
                  width: 100,
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: RaisedButton(
                onPressed: () => controller.changeImage(controller.imageArray[controller.randomIntForDiceOne.value]),
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
    );
  }
}
