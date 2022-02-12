import 'package:blogging_app/App/Data/Models/Getblogmodel.dart';
import 'package:blogging_app/App/Utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BlogDtail extends StatelessWidget {
   BlogDtail({Key? key}) : super(key: key);
  final BlogModel model = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.white,
        title: Text(
          'Blog Detail',
          style: TextStyle(color: AppColor.darkblue),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColor.darkblue,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14.sp),
              alignment: Alignment.centerLeft,
              child: Text(
                model.title,
                style:
                    TextStyle(fontSize: 18.0.sp, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 2.0.h,
            ),
            Container(
              height: 26.0.h,
              width: 70.0.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: DecorationImage(
                  image: NetworkImage(
                    model.image,
                      ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 2.0.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14.sp),
              alignment: Alignment.centerLeft,
              child: Text(
                model.description,
                style:
                    TextStyle(fontSize: 18.0.sp, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
