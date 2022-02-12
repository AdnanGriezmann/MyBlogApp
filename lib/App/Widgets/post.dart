import 'package:blogging_app/App/Data/Models/Getblogmodel.dart';
import 'package:blogging_app/App/Modules/BlogDetail/Bindings/BlogDetail.dart';
import 'package:blogging_app/App/Modules/BlogDetail/Views/BlogDetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Post extends StatelessWidget {
  final BlogModel model;
  const Post({required this.model,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.0.h),
      child: GestureDetector(
        onTap: () {
          Get.to(() => BlogDtail(),arguments:model , binding: BlogDetailBinding());
        },
        child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(4.0.h),
            child: SizedBox(
              height: 27.0.h,
              width: 30.0.w,
              child: Column(
                children: [
                  Container(
                    height: 15.0.h,
                    width: 70.0.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      image: DecorationImage(
                        image: NetworkImage(model.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 2.0.h),
                  Text(model.title,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2),
                ],
              ),
            )),
      ),
    );
  }
}
