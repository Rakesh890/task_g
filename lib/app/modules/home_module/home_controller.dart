import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_version/new_version.dart';
import 'package:task_g/app/routes/app_pages.dart';

import '../../Constant/FirebaseContant.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class HomeController extends GetxController
{

  var userDiceCount=0.obs;
  var imageArray = ['one.png', 'two.png', 'three.png', 'four.png', 'five.png', 'six.png'];
  var randomIntForDiceOne = Random().nextInt(5).obs;
  var appVersion="".obs;
  var selectBottomIndex=0.obs;
  var userScore=0.obs;
  var userPlayList=[].obs;
  var myDocumentID="".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentUser();
    getPackageInfo();
  }

  getCurrentUser() {
    User? user = FirebaseAuth.instance.currentUser;
    String username = user!.displayName.toString();
    print( "User ${username}");
    getUserPlayer();

  }

  getPackageInfo() async {
    final newVersion = NewVersion(
      iOSId: 'com.example.task_g',
      androidId: 'com.example.task_g',
    );
    appVersion.value  = "1.0.0";
  }


  changeImage(String imageArray)
  {

    print("Enter here ${imageArray}");
    if(userDiceCount.value < 10 && userDiceCount.value != 10){
          userDiceCount.value++;
          print(userDiceCount.value);
          randomIntForDiceOne.value = Random().nextInt(6);
          userScore.value += randomIntForDiceOne.value;
          print("User Score Now ${ userScore.value}");
          udpateUserScore( userScore.value);
        }else{
          Get.snackbar("Err", "You can play only 10 times ${userDiceCount.value}",
            backgroundColor: Colors.black,
            colorText: Colors.white,);
        }
      }


  logout()
  {
    try {
        auth.signOut();
        userScore.value = 0;
        userDiceCount.value = 0;
      } catch (e) {
        print(e.toString());
      }
  }

  selectBottomTab(int value)
  {
    selectBottomIndex.value = value;
  }

  openLeaderBoard()
  {
    Get.toNamed(Routes.LEADERBOARD);
  }

  Future getUserPlayer() async
  {
    try{
      FirebaseFirestore.instance
          .collection('Users')
          .get()
          .then((QuerySnapshot querySnapshot)
      {
        userPlayList.clear();
        querySnapshot.docs.forEach((DocumentSnapshot doc)
        {

           myDocumentID.value = doc.id;
           userScore.value = int.parse(doc.get("Score"));
           userDiceCount.value = int.parse(doc.get("Attempt"));
           print(myDocumentID.value);
          var userPlayer = {
            "name":doc.get("Name"),
            "score":doc.get("Score"),
            "attempt":doc.get("Attempt"),
            "docId":doc.id,
            "email":doc.get("Email"),
            "isPlaying":doc.get("isPlaying"),
            "uId":doc.get("Uid")
          };
          userPlayList.add(userPlayer);
          userPlayList.value = userPlayList.toSet().toList();

        });
      });
    }catch(Error){
      printInfo(info: "Something Went wriong");
    }
  }

  void udpateUserScore(value)
  {
    print(userScore.value);
   for(var user in userPlayList){
     if(myDocumentID.value == user["docId"]){
       updateDataFirestore(user["docId"],
           user["score"],
           user["attempt"],
           user["name"],
           user["email"],
           user["isPlaying"],
           user["Uid"]);
     }
   }
  }

  void updateDataFirestore(id,score,attempt,userName,email,isPlaying,uId) async
  {
   await FirebaseFirestore.instance
        .collection('Users').doc(myDocumentID.value).update({
      "Name":"${userName}",
      "Email":"${email}",
      "isPlaying":"true",
      "Attempt":"${userDiceCount.value}",
      "Score":"${userScore.value}",
      "Uid":"${uId}"
    }).then((value) =>
    {
      print("updated Board"),
      getUserPlayer(),
    });
  }
}
