import 'package:blogging_app/App/Utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Indicator {
  static void ShowLoading() {
    Get.dialog(
      
    
      Center(
        
      child: CircularProgressIndicator(color: AppColor.orange),
    ));
  }

 static void CloseLoading() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }
}
