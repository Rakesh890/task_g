import 'package:get/get.dart';
import 'package:task_g/app/modules/home_module/home_controller.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends GetView<HomeController> {
   BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: [
      BottomNavigationBarItem(icon: Icon(Icons.home)),
      BottomNavigationBarItem(icon: Icon(Icons.home)),
      BottomNavigationBarItem(icon: Icon(Icons.profile)),

    ]);
  }
}
