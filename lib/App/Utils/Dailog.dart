import 'package:blogging_app/App/Utils/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:uuid/uuid.dart';

void showAlert(String message) {
  Get.defaultDialog(
    title: '',
    middleText: message,
    contentPadding: EdgeInsets.only(bottom: 10.0),
    backgroundColor: AppColor.white,
    radius: 6.0,
    middleTextStyle: TextStyle(
        color: AppColor.darkblue,
        fontWeight: FontWeight.bold,
        fontSize: 13.0.sp),
  );
}

//UniqueId:
String generateId() {
  return Uuid().v1();
}
