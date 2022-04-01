import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class LeaderboardController extends GetxController{
  var contactList = [].obs;
  var isShowLoader = false.obs;

 @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserContacts();
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

 Future getUserContacts() async
 {
   isShowLoader.value=true;
   try{
     FirebaseFirestore.instance
         .collection('Users')
         .get()
         .then((QuerySnapshot querySnapshot)
     {
       contactList.clear();
       querySnapshot.docs.forEach((DocumentSnapshot doc)
       {
         isShowLoader.value=false;
         // if(doc.get("userId").toString() == userData.data!.userDetails!.id.toString())
         // {
           var contacts = {
             "name":doc.get("Name"),
             "score":doc.get("Score"),
             "attempt":doc.get("Attempt"),
           };
           contactList.add(contacts);
           contactList.value = contactList.toSet().toList();
         //}
       });
     });
   }catch(Error){
     isShowLoader.value=false;
     printInfo(info: "Something Went wriong");
   }
 }
}
