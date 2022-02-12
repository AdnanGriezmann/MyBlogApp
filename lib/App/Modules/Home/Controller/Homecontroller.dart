import 'package:blogging_app/App/Data/Models/Getblogmodel.dart';
import 'package:blogging_app/App/Firebase/firebase_cloud.dart';
import 'package:blogging_app/App/Utils/indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final FirebaseFunctions _functions = FirebaseFunctions();
  final ScrollController controller = ScrollController();
  var blogs = <BlogModel>[].obs;
  var isLoading = false.obs;

  void getData() async {
    var b = await _functions.getBlogs();
    if (b.length > 0) blogs.value = b;
    update();
  }

  @override
  void onReady() {
    super.onReady();
    Indicator.ShowLoading();
  }

  @override
  void onInit() {
    super.onInit();
    getData();

    _functions.isLoading.listen((p) {
      isLoading.value = p;
    });

    controller.addListener(() {
      double maxScrollPoint = controller.position.maxScrollExtent;
      double currentPosition = controller.position.pixels;
      double height20 = Get.size.height * 0.20;
      if (maxScrollPoint - currentPosition <= height20) {
        getData();
      }
    });
  }
}
