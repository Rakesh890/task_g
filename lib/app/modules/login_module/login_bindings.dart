import 'package:get/get.dart';
import 'package:task_g/app/modules/login_module/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}