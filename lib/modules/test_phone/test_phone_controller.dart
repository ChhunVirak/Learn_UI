import 'dart:async';

import 'package:get/get.dart';

class TestPhoneController extends GetxController {
  final tick = 1.obs;
  Timer? timer;

  void clockRunner() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (t) {
        if (tick.value == 60) {
          tick.value = 0;
        } else {
          tick.value = tick.value + 1;
        }

        // tick(t.tick);
        // debugPrint('${t.tick}');
      },
    );
  }

  @override
  void onReady() {
    clockRunner();
    super.onReady();
  }
}
