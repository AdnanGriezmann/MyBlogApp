import 'dart:io';

import 'package:blogging_app/App/Firebase/firebase_cloud.dart';
import 'package:blogging_app/App/Utils/Dailog.dart';
import 'package:blogging_app/App/Utils/indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadBlogController extends GetxController {
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  final FirebaseFunctions _functions = FirebaseFunctions();
  File? imageFile;

  void cleartext() {
    title.clear();
    description.clear();
  }

  Future<void> pickImage() async {
    try {
      ImagePicker _picker = ImagePicker();
      await _picker.pickImage(source: ImageSource.gallery).then((value) {
        if (value != null) {
          imageFile = File(value.path);
          update();
        }
      });
    } catch (e) {
      showAlert('$e');
    }
  }

  void createBlog() async {
    if (title.text.isNotEmpty && description.text.isNotEmpty) {
      if (imageFile != null) {
        Indicator.ShowLoading();
        await _functions
            .uploadBlog(title.text, description.text, imageFile!)
            .then((value) {
          Indicator.CloseLoading();
          showAlert('Blog Created Successfully');
          Get.back();
        });
      } else {
        showAlert('Image is required');
      }
    } else {
      showAlert('All field are required');
    }
  }
}
