import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_g/app/modules/leaderboard_module/leaderboard_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class LeaderboardPage extends GetView<LeaderboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Leaderboard Page')),
      body: Container(
        child:(controller.isShowLoader.value == false) ?ListView.builder(
            itemCount: controller.contactList.length,
            itemBuilder: (context,int index){
          return Card(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child:Column(
              children: [
                Text(controller.contactList[index]["name"]),
                Text(controller.contactList[index]["score"]),
                Text(controller.contactList[index]["attempt"])
              ],
            ),
          );
        }) : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
