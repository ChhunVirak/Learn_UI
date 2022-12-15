import 'package:get/get.dart';

import '../modules/cv_gen/controller/cv_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CvController());
  }
}
