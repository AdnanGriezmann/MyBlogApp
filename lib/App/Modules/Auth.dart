import 'package:blogging_app/App/Modules/Home/Views/HomeView.dart';
import 'package:blogging_app/App/Modules/Login/Views/LoginView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authlogic extends StatelessWidget {
  Authlogic({Key? key}) : super(key: key);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return HomeView();
    } else {
      return LoginView();
    }
  }
}
