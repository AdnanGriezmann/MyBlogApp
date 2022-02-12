import 'package:blogging_app/App/Modules/Login/Controller/Logincontroller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
