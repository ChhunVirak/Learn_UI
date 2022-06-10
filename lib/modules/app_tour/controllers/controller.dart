import 'package:get/get.dart';

class ControllerCount extends GetxController {
  final i = 0.obs;

  increase() {
    for (int a = 0; a < 10; a++) {
      i.value++;
    }
  }
}
