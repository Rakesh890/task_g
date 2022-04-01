import 'package:task_g/app/modules/leaderboard_module/leaderboard_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class LeaderboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LeaderboardController());
  }
}