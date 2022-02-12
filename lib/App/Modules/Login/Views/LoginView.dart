import 'package:blogging_app/App/Modules/Login/Controller/Logincontroller.dart';
import 'package:blogging_app/App/Modules/Signup/Bindings/Signupbinding.dart';
import 'package:blogging_app/App/Modules/Signup/Views/Signupview.dart';
import 'package:blogging_app/App/Utils/Colors.dart';
import 'package:blogging_app/App/Widgets/Custom_button.dart';
import 'package:blogging_app/App/Widgets/ReuseableTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final Logincontroller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkblue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 2.0.h),
                height: 12.0.h,
                width: 30.0.h,
                child: Lottie.asset('assets/Lottie/log.json'),
              ),
              SizedBox(height: 7.0.h),
              Column(
                children: [
                  ReuseableTextField(
                    isMultiline: false,
                    controller: Logincontroller.email,
                    hintText: 'Email',
                  ),
                  ReuseableTextField(
                      isMultiline: false,
                      controller: Logincontroller.password,
                      hintText: 'Password',
                      obscureText: true),
                  CustomButton(
                      text: 'LOGIN',
                      func: () {
                        Logincontroller.onLogin();
                      }),
                ],
              ),
              SizedBox(
                height: 4.0.h,
              ),
              Container(
                child: Text(
                  'New Account creation?',
                  style: TextStyle(
                      color: AppColor.white, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 1.0.h,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => SignUpView(), binding: SignupBinding());
                  },
                  child: Text('SignUp')),
            ],
          ),
        ),
      ),
    );
  }
}
