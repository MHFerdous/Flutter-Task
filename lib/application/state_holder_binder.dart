import 'package:flutter_task/presentation/state_holders/login_controller.dart';
import 'package:flutter_task/presentation/state_holders/user_profile_controller.dart';
import 'package:get/get.dart';

class StateHolderBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.put(UserProfileController());
  }
}
