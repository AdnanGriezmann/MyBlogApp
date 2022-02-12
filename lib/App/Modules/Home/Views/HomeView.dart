import 'package:blogging_app/App/Modules/Home/Controller/Homecontroller.dart';
import 'package:blogging_app/App/Modules/UploadBlog/Bindings/UploadBlogBinding.dart';
import 'package:blogging_app/App/Modules/UploadBlog/Views/UploadBlog.dart';
import 'package:blogging_app/App/Utils/Colors.dart';
import 'package:blogging_app/App/Widgets/post.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeView extends StatelessWidget {
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 2.0.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Blog App',
                  style:
                      TextStyle(fontSize: 22.0.sp, fontWeight: FontWeight.w500),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.account_circle, size: 4.0.h))
              ],
            ),
          ),
          Expanded(child: GetBuilder<HomeController>(
            builder: (value) {
              print(value.blogs.length);
              if (value.blogs.length>0) {
                return ListView.builder(
                    controller: homeController.controller,
                    itemCount: value.blogs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0.sp, vertical: 5.0.sp),
                        child: Post(model: value.blogs[index]),
                      );
                    });
              } else {
                return Center(
                  child: Text('No Blogs Available'),
                );
              }
            },
          )),
          Obx(() {
            if (homeController.isLoading.value) {
              return SizedBox(
                height: 2.0.h,
                child: CircularProgressIndicator.adaptive(),
              );
            } else {
              return SizedBox();
            }
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: AppColor.darkblue,
          onPressed: () {
            Get.to(() => UploadBlog(), binding: UploadBlogBinding());
          },
          elevation: 2,
          label: Row(
            children: [
              Icon(Icons.upload),
              Text(
                'Create Blog',
                style:
                    TextStyle(fontSize: 11.0.sp, fontWeight: FontWeight.bold),
              ),
            ],
          )),
    );
  }
}
