import 'package:blogging_app/App/Utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ReuseableTextField extends StatelessWidget {
  const ReuseableTextField(
      {required this.controller,
      required this.hintText,
      this.obscureText = false,
      required this.isMultiline,
      Key? key})
      : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final bool isMultiline;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMultiline? 23.0.h : 13.0.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.0.sp, vertical: 4.0.sp),
      child: TextFormField(
        maxLines: isMultiline ? null : 1,
        keyboardType: isMultiline ? TextInputType.multiline : null,
        textInputAction: TextInputAction.done,
        obscureText: obscureText,
        cursorColor: AppColor.black,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              color: AppColor.black,
              fontWeight: FontWeight.bold,
              fontSize: 14.0.sp),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.orange, width: 3),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.orange, width: 3),
          ),
          filled: true,
          fillColor: AppColor.grey,
        ),
      ),
    );
  }
}
