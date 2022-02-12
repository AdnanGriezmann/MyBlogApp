
import 'package:blogging_app/App/Modules/Signup/Controller/Signupcontroller.dart';
import 'package:get/get.dart';

class SignupBinding extends  Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(),
    );
  }
}