import 'package:change_language/modules/cv_gen/controler/cv_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CvController());
  }
}
