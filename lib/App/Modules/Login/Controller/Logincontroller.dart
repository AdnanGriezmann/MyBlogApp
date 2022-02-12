
import 'package:blogging_app/App/Firebase/firebase_auth.dart';
import 'package:blogging_app/App/Modules/Home/Bindings/Homebinding.dart';
import 'package:blogging_app/App/Modules/Home/Views/HomeView.dart';
import 'package:blogging_app/App/Utils/Dailog.dart';
import 'package:blogging_app/App/Utils/indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final FirebaseAuthtentication _authtentication = FirebaseAuthtentication();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  void onLogin() async {
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      Indicator.ShowLoading();
      await _authtentication.login(email.text, password.text).then((value) {
        Indicator.CloseLoading();
        Get.off(()=>HomeView(),binding: HomeBinding());
      });
    } else {
      showAlert('All fields are required');
    }
  }
}
