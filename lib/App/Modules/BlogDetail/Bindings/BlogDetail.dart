
import 'package:get/get.dart';

class BlogDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlogDetailBinding>(
      () => BlogDetailBinding(),
    );
  }
}