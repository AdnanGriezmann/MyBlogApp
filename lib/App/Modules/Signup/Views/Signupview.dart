import 'package:blogging_app/App/Modules/Signup/Controller/Signupcontroller.dart';
import 'package:blogging_app/App/Utils/Colors.dart';
import 'package:blogging_app/App/Widgets/Custom_button.dart';
import 'package:blogging_app/App/Widgets/ReuseableTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class SignUpView extends StatelessWidget {
  final signupcontroller = Get.find<SignupController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkblue,
      appBar: AppBar(
        backgroundColor: AppColor.darkblue,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 2.0.h),
                height: 12.0.h,
                width: 30.0.h,
                child: Lottie.asset('assets/Lottie/sign.json'),
              ),
              SizedBox(height: 7.0.h),
              Column(
                children: [
                  ReuseableTextField(
                    isMultiline: false,
                    controller: signupcontroller.name,
                    hintText: 'Name',
                  ),
                  ReuseableTextField(
                    isMultiline: false,
                    controller: signupcontroller.email,
                    hintText: 'Email',
                  ),
                  ReuseableTextField(
                    isMultiline: false,
                      controller: signupcontroller.password,
                      hintText: 'Password',
                      obscureText: true),
                  CustomButton(
                      text: 'SIGNUP',
                      func: () {
                        signupcontroller.onCreateAccount();
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
