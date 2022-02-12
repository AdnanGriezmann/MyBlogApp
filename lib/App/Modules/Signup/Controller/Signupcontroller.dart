
import 'package:blogging_app/App/Firebase/firebase_auth.dart';
import 'package:blogging_app/App/Firebase/firebase_cloud.dart';
import 'package:blogging_app/App/Utils/Dailog.dart';
import 'package:blogging_app/App/Utils/indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final FirebaseAuthtentication _authtentication = FirebaseAuthtentication();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final FirebaseFunctions _functions = FirebaseFunctions();
  void onCreateAccount() async {
    if (name.text.isNotEmpty &&
        email.text.isNotEmpty &&
        password.text.isNotEmpty) {
      Indicator.ShowLoading();
      await _authtentication
          .createAccount(email.text, password.text)
          .then((value) {
        _functions.createUserCredential(name.text, email.text);
      });
    } else {
      showAlert('All fields are required');
    }
  }
}
