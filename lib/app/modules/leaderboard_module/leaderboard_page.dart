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
      body: Obx(
          () => Container(
          child:(controller.isShowLoader.value == false) ? ListView.builder(
              itemCount: controller.contactList.length,
              itemBuilder: (context,int index){
            return Card(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child:Column(
                children: [
                  ListTile(
                      leading:Image.network("https://aartel.com.au/wp-content/uploads/2018/12/avatar-placeholder-80x80.png"),
                      title:Text(controller.contactList[index]["name"]),
                    subtitle:
                    Text("Attempt : ${controller.contactList[index]["attempt"]}"),
                    trailing: Text(controller.contactList[index]["score"]),
                  ),

                ],
              ),
            );
          }) : Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
