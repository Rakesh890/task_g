import 'package:get/get.dart';
import 'package:task_g/app/modules/register_module/register_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}