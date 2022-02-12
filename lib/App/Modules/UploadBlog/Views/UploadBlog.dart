import 'package:blogging_app/App/Modules/UploadBlog/Controllers/UploadBlogcontroler.dart';
import 'package:blogging_app/App/Utils/Colors.dart';
import 'package:blogging_app/App/Widgets/Custom_button.dart';
import 'package:blogging_app/App/Widgets/ReuseableTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class UploadBlog extends StatelessWidget {
  UploadBlog({Key? key}) : super(key: key);
  final UploadController = Get.put(UploadBlogController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.white,
          title: Text(
            'Upload Blog',
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
              Padding(
                padding: EdgeInsets.only(top: 3.0.h),
                child: ReuseableTextField(
                  hintText: 'Title',
                  controller: UploadController.title,
                  isMultiline: false,
                ),
              ),
              SizedBox(
                height: 1.0.h,
              ),
              ReuseableTextField(
                controller: UploadController.description,
                hintText: 'Description',
                isMultiline: true,
              ),
              SizedBox(
                height: 5.0.h,
              ),
              Container(
                height: 25.0.h,
                width: 60.0.h,
                alignment: Alignment.center,
                child: GetBuilder<UploadBlogController>(
                  init: UploadBlogController(),
                  builder: (value) {
                    if (value.imageFile != null) {
                      return Image.file(value.imageFile!);
                    } else {
                      return CustomButton(
                          text: 'Upload Image',
                          func: () {
                            UploadController.pickImage();
                            UploadController.cleartext();
                          });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(2.0.h),
          child: Container(
            height: 6.0.h,
            width: double.infinity,
            alignment: Alignment.topCenter,
            child: CustomButton(
                text: 'Create Blog',
                func: () {
                  UploadController.createBlog();
                }),
          ),
        ),
      ),
    );
  }
}
