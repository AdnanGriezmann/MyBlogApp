
import 'package:get/get.dart';

class UploadBlogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadBlogBinding>(
      () => UploadBlogBinding(),
    );
  }
}